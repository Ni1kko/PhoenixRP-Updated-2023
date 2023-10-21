/*
	@File: fn_getPlayerInfo.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Querys player info from database...
*/
#include "\life_server\script_macros.hpp"

if !(_this params [
	["_unit", objNull, [objNull]]
]) exitWith { ["Player Data Request", "Failed", "_unit either wasn't passed or wasn't the correct data type"] call PHX_fnc_logIt };

private _fnc_getQueryStatement = { 
	_this params ["_steamid", "_side"];

	private _query = [
		"SELECT uid, playerid, cash, bankacc, playtime, insert_time, adminlevel, donatorLevel, prestigeLevel, level, xp, loy_days, loy_rewards, loy_last, achievements", 
		(call { switch (_side) do {
			case west: {", cop_licenses, cop_gear, cop_stats, cop_professions, cop_perks, blacklist, coplevel, mi5level, npaslevel, tpulevel, ctulevel, academylevel, mpulevel"};
			case independent: {", med_licenses, med_gear, med_stats, med_professions, med_perks, med_blacklist, mediclevel, sarlevel"};
			case civilian: {", civ_licenses, civ_gear, civ_stats, civ_professions, civ_perks, civ_arrested_police, civ_arrested_havoc, jail_time, isSO1, mi5_gear, hss_gear, law_gear, tax_gear, ser_gear, new_gear, so1_gear, cardid, gangid, ganglevel, mi5level, hsslevel, isJudge, judge_gear"};
			case east: {", hav_licenses, hav_gear, hav_stats, hav_professions, hav_perks, hav_blacklist, havoclevel, hsslevel, hmulevel, hsflevel, hadlevel, hav_arrested, hav_jail_time"};
		} }), 
		format["FROM phxclients WHERE playerid='%1'", _steamid]
	];

	_query joinString " "
};

private _playerData = false;

private _steamid = getPlayerUID _unit;
private _side = side _unit;

// ArmA is retarded sometimes...
if (_steamid isEqualTo "") exitWith {
	waitUntil { isNil "playerData" };

	playerData = _playerData;
	remoteExecutedOwner publicVariableClient "playerData";
	playerData = nil; // reset it...
};

private _playerQuery = ([_steamid, _side] call _fnc_getQueryStatement);

private _attempts = 0;

for "_i" from 0 to 1 step 0 do {
	if (_playerData isEqualType [] || { _attempts > 3 }) exitWith {};

	private _result = [_playerQuery, 2] call DB_fnc_asyncCall;

	if (_result isEqualType "" || { _result isEqualTo [] }) then {
		// We don't have a player save active at this time, need to insert it...

		private _name = name _unit;

		[
			format ["INSERT INTO phxclients (playerid, name, cash, bankacc, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, med_gear, civ_professions, cop_professions, med_professions, cop_perks, civ_perks, med_perks, hav_perks, hav_licenses, hav_gear, hav_professions, mi5_gear, hss_gear, new_gear, law_gear, tax_gear, ser_gear, achievements, so1_gear, judge_gear, loy_rewards, loy_last) VALUES('%1', '%2', '0', '%3', '%4','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""', CURDATE())",
				_steamid,
				[_name] call DB_fnc_mresString,
				[LIFE_SETTINGS(getNumber,"starting_bank")] call DB_fnc_numberSafe,
				[[_name]] call DB_fnc_mresArray
			], 1
		] call DB_fnc_asyncCall;

		uiSleep 3; // Wait to ensure the request has a chance to finish...
	} else {
		// Player save found, time to convert data types etc...
		private _newResult = _result;

		// Cash, Bank
		private _numbersToMakeSafe = [2, 3];

		// Playtime, Loyalty Rewards, Achievements, Licenses, Gear, Stats, Professions, Perks
		private _arraysToConvert = [4, 12, 14, 15, 16, 17, 18, 19];

		// (Blacklist / Arrest Status)
		private _boolsToConvert = [20];

		private _playTimeIndex = 0;

		switch (_side) do {
			case independent : { _playTimeIndex = 1 };
			case civilian : {
				// MI5, HSS, LAW, TAXI, SERVICE, NEWS, S01 Gear, Judge Gear
				_arraysToConvert append [24, 25, 26, 27, 28, 29, 30, 37];
				// Civ Arrested HAVOC, isS01, isJudge
				_boolsToConvert append [21, 23, 36];

				_playTimeIndex = 2;

				// ID Card Setup...
				private _cardID = _newResult select 31;

				if !(_cardID isEqualType 0) then { _cardID = parseNumber _cardID };
				if !(_cardID isEqualTo -1) then {
					_cardID = [_cardID] call PHXSRV_fnc_getID;

					if (_cardID isEqualType []) then {
						if !((_cardID select 1) isEqualTo (name _unit)) then {
							[_steamid, (name _unit)] call PHXSRV_fnc_updateID;
							_cardID set [1, name _unit];
						};
					};
				};

				_newResult set[31, _cardID];
			};
			case east : {
				// HAVOC Arrested
				_boolsToConvert append [26];

				_playTimeIndex = 3;
			};
		};

		// Coverts data types to something arma can understand...
		{ _newResult set [_x, [(_result select _x)] call DB_fnc_numberSafe] } forEach _numbersToMakeSafe;
		{ _newResult set [_x, [(_result select _x)] call DB_fnc_mresToArray] } forEach _arraysToConvert;
		{ _newResult set [_x, [(_result select _x), 1] call DB_fnc_bool] } forEach _boolsToConvert;

		// License Bool Conversion
		private _licenses = _newResult select 15;

		{
			_licenses set [_forEachIndex, [(_x select 0), ([(_x select 1), 1] call DB_fnc_bool)]];
		} forEach (_newResult select 15);

		_newResult set [15, _licenses];

		// Setup playtime tracking...
		private _playtime = _newResult select 4;
        private _index = TON_fnc_playtime_values_request find [_steamid, _playtime];

        if !(_index isEqualTo -1) then {
            TON_fnc_playtime_values_request set[_index, -1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_steamid, _playtime];
        } else {
            TON_fnc_playtime_values_request pushBack [_steamid, _playtime];
        };

        [_steamid, (_playtime select _playTimeIndex)] call TON_fnc_setPlayTime;

		// Housing + Gangs
		if (_side isEqualTo civilian) then {
			private _gangID = _newResult select 32;

			_newResult pushBack ([_steamid, _gangID] call TON_fnc_fetchPlayerHouses);
			_newResult pushBack ([_steamid, _gangID] call TON_fnc_queryPlayerGang);
		};

		_newResult pushBack ([_steamid, [
			(_newResult select 11),
			(_newResult select 12),
			(_newResult select 13)
		]] call PHXSRV_fnc_getRewards);

		_newResult pushBack ([_steamid, _side] call PHXSRV_fnc_getStats);
		_newResult pushBack (missionNamespace getVariable [format ["%1_KEYS_%2", _steamid, _side], []]); // Save keys 

		_newResult pushBack [
			PHX_curGovernor,
			PHX_noVotes,
			PHX_noOptions,
			PHX_activePolls,
			PHX_doneResults,
			PHX_isEnlistmentOpen,
			PHX_TaxRate,
			PHX_PaycheckRate,
			PHX_RevivalRate,
			PHX_FuelRate,
			PHX_IllegalItems,
			PHX_isWaring
		];

		_playerData = _newResult;
	};
	
	_attempts = _attempts + 1;
};

waitUntil { isNil "playerData" };

playerData = _playerData;
remoteExecutedOwner publicVariableClient "playerData";
playerData = nil; // reset it...