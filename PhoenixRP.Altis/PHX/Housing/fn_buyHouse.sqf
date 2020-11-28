/*
	@File: fn_buyHouse.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Check stuff then buys our house...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgHousing" >> worldName
params [
	["_house", objNull, [objNull]],
	["_isGang", false, [true]]
];

if !(canSuspend) exitWith { _this spawn PHX(buyHouse) };

closeDialog 0;

private _steamid = getPlayerUID player;

private _houses = ([life_houses, life_gang_houses] select (_isGang));
private _limit = call {
	if (_isGang) exitWith {(LIFE_SETTINGS(getNumber,"gang_house_limit"))};
	(LIFE_SETTINGS(getNumber,"house_limit"));
};

if (isNull _house || { _house getVariable ["isBlacklisted", false] } || { !(_house isKindOf "House_F") }) exitWith {["These building is blacklisted and can not be bought..."] spawn PHX(notify)};
if (!_isGang && {typeOf (_house) isEqualTo "Land_i_Shed_Ind_F"}) exitWith { ["These buildings can only be bought by groups..."] spawn PHX(notify) };
if !(license_civ_home) exitWith { ["You don't have the home owners licensing"] spawn PHX(notify) };
if !((count _houses) < _limit) exitWith { [format["You're only allowed a max of %1 houses", _limit]] spawn PHX(notify) };
if !(isNil {_house getVariable "house_owner"}) exitWith { ["This house is already owned"] spawn PHX(notify) };
if !(isNil {_house getVariable "bType"}) exitWith { ["This building is owned by a faction"] spawn PHX(notify) };
if (isNil {grpPlayer getVariable "gang_owner"} && { !((grpPlayer getVariable ["gang_owner", ""]) isEqualTo _steamid) } && { _isGang }) exitWith {
	["You must be in a gang and the leader of the gang to purchase a house for a gang..."] spawn PHX(notify);
};

private _typeOf = typeOf _house;
if !(isClass (CFG >> _typeOf)) exitWith {};

private _cost = (getNumber (CFG >> _typeOf >> "price"));
if (HAS_PERK("propertyBroker")) then { _cost = _cost * 0.85 };

if (BANK < _cost) exitWith { [format["You require %1 in your bank to buy this house.", NUM_TXT(_cost)]] spawn PHX(notify) };

private _rent = (getNumber (CFG >> _typeOf >> "rent"));

private _action = [
	format["Are you use you wish to buy this house for %1. It will cost: £%2 with a total of £%3 in upkeep each restart", (["yourself", "your group"] select (_isGang)), NUM_TXT(_cost) , NUM_TXT(_rent)],
	"Housing Confirmation", "Buy House", "Cancel"
] call PHX_fnc_confirmBox;

if (_action) then {
	_house setVariable ["house_upgrades",[0,0,[]],true];
	private _houseID = ([_steamid, (player getVariable ["gang_uid", -1])] select(_isGang));
	[_houseID, _house, _isGang] remoteExec (["fnc_addHouse", "TON"] call SOCK_fnc_getRemoteDestination);
	[_cost, 1, 1, "Purchased A House"] call PHX_fnc_handleMoney;

	private _owner = [_steamid, profileName];
	if (_isGang) then {
		_owner = [(player getVariable ["gang_uid", -1]), grpPlayer getVariable "gang_name"];
	};

	_owner pushBack _isGang;

	_house setVariable ["uid", format["%1-%2", _houseID, ((count _houses) + 1)], true];
	_house setVariable ["house_owner", _owner, true];

	waitUntil { !(isNil { _house getVariable "uid" }) };

	[_house] call PHX(houseMarker);

	if (_isGang) then {
		[_house, false] remoteExecCall ["PHX_fnc_gangHousing", (units (grpPlayer))];
	};

	// Lock all doors...
    for "_i" from 1 to (FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house),"numberOfDoors")) do {
        _house setVariable [format ["bis_disabled_Door_%1", _i], 1, true];
    };

	life_vehicles pushBack _house;
	_houses pushBack _house;

	[format["You've bought a house for %1 that cost you £%2.", (["yourself", "your group"] select (_isGang)), NUM_TXT(_cost)]] spawn PHX(notify);
	[player, format ["%1 (%2) bought a house for %3. Bank Balance: %4 On Hand Cash: %5",profileName,(getPlayerUID player),[_cost] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	["Purchase cancelled"] spawn PHX(notify);
};

closeDialog 0;