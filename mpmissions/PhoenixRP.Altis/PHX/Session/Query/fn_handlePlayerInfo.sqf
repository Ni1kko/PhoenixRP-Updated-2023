/*
	@File: fn_handlePlayerInfo.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles the request from server...
*/
#include "..\..\..\script_macros.hpp"

if !(_this params [
	["_playerData", false, [[], false]]
]) exitWith { 
	["Handled Player Info", "Failed", "_playerData either wasn't passed or wasn't the correct data type"] call PHX_fnc_logIt;
	["Retriving Player Data Failed"] call PHXUI_fnc_loadingFailed;
};

if !(_playerData isEqualType []) exitWith {
	["Handled Player Info", "Failed", "The server was unabled to query our player data"] call PHX_fnc_logIt;
	["Retriving Player Data Failed"] call PHXUI_fnc_loadingFailed;
};

if (PHX_Data_Complete) exitWith {}; // Already ran...

["Handling Player Data", 0.7] call PHX(setLoadingStage);

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if (!isServer && (!isNil "life_adminlevel" || !isNil "life_coplevel")) exitWith {
    [profileName,getPlayerUID player,"VariablesAlreadySet"] remoteExecCall ["SPY_fnc_cookieJar",RSERV];
    [profileName,format ["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2",life_adminlevel,life_coplevel]] remoteExecCall ["SPY_fnc_notifyAdmins",RCLIENT];
    sleep 0.9;
    if (SPY_SETTINGS(getNumber,"debug_mode") isEqualTo 0) then { failMission "SpyGlass" };
};

private _count = count _playerData;

// These values are always the same index...
_playerData params [
	"_uid", 
	"_steamid", 
	"_cash", 
	"_bank", 
	"", // Playtime
	"_joinDate", 
	"_adminlevel", 
	"_donorlevel", 
	"_prestige", 
	"_level",
	"_xp", 
	"", // Total Loyalty Days...
	"", // Loyalty Rewards...
	"", // Date of Last loyalty...
	"_achievements", 
	"_licenses", 
	"_gear", 
	"_stats", 
	"_professions", 
	"_perks"
];

[parseNumber (_cash), 2, 0] call PHX_fnc_HandleMoney;
[parseNumber (_bank), 2, 1] call PHX_fnc_HandleMoney;

PHX_Join_Date = _joinDate;

CONST(life_adminlevel, _adminlevel);

PHX_DonatorLevel = _donorlevel;
PHX_PrestigeLevel = _prestige;

{
	if !(_x isEqualTo []) then {
		{ 
			_x params ["_var", "_val"];
			missionNamespace setVariable [_var, _val];
		} forEach _x;
	};
} forEach [_licenses, _professions];

life_hunger = (_stats select 0);
life_thirst = (_stats select 1);
player setDamage (_stats select 2);

PHX_Level = _level;
PHX_XP = _xp;
PHX_Perks = _perks;
PHX_Achievements = [[],_achievements] select (_achievements isEqualType []);

player setVariable ["PHX_ID", _uid, true];

// Main Faction Ranks...
private _coplvl = 0;
private _medlvl = 0;
private _havlvl = 0;

// Secondary Faction Ranks...
private _mi5lvl = 0;
private _npaslvl = 0;
private _tpulvl = 0;
private _ctulvl = 0;
private _academylvl = 0;
private _mpulvl = 0;
private _hsslvl = 0;
private _hmulvl = 0;
private _hsflvl = 0;
private _hadlvl = 0;
private _sarlvl = 0;

switch (playerSide) do {
	case west: {
		_coplvl = _playerData select 21;
		_mi5lvl = _playerData select 22;
		_npaslvl = _playerData select 23;
		_tpulvl = _playerData select 24;
		_ctulvl = _playerData select 25;
		_academylvl = _playerData select 26;
		_mpulvl = _playerData select 27;

		if (_mi5lvl > 0) then {
            player setVariable ["isCID", true, true];
        };

		life_blacklisted = _playerData select 20;

		PHX_ID = ["POLICE", name player, "N/A", "N/A", "N/A", false];
	};

	case independent: {
		_medlvl = _playerData select 21;
		_sarlvl = _playerData select 22;
		
		life_blacklisted = _playerData select 20;

		PHX_ID = ["NHS", name player, "N/A", "N/A", "N/A", false];
	};

	case civilian: {
		_mi5lvl = _playerData select 34;
		_hsslvl = _playerData select 35;

		PHX_UID = _uid;

        life_is_arrested_police = _playerData select 20;
		life_is_arrested_havoc = _playerData select 21;
		life_jail_time = _playerData select 22;

		license_civ_SO1 = _playerData select 23;
		if (license_civ_SO1) then {
            player setVariable ["PHX_isSO1", true, true];
        };

		PHX_CID_Gear = _playerData select 24;
        PHX_HSS_Gear = _playerData select 25;
        PHX_LAW_Gear = _playerData select 26;
        PHX_TAX_Gear = _playerData select 27;
        PHX_SER_Gear = _playerData select 28;
        PHX_NEW_Gear = _playerData select 29;
        PHX_SO1_Gear = _playerData select 30;
        PHX_Judge_Gear = _playerData select 37;

        PHX_isJudge = _playerData select 36;

		PHX_ID = _playerData select 31;

        if (PHX_ID isEqualType []) then {
            player setVariable ["idCard", PHX_ID, true];
        };

        life_gangData = _playerData select (_count - 5);

		if (!(life_gangData isEqualTo []) && { !(isCID(player)) } && { !(isHSS(player)) }) then {
            [] call PHX_fnc_initGang;
        };

		private _allHouses = _playerData select (_count - 6);
        life_houses = [];
        life_gang_houses = [];

        {
            _house = nearestObject [(parseSimpleArray (_x select 0)), "House"];
            life_vehicles pushBack _house;
        } forEach _allHouses;

        [_allHouses] call PHX_fnc_initHouses;
	};

	case east: {
		_havlvl = _playerData select 21;
		_hsslvl = _playerData select 22;
		_hmulvl = _playerData select 23;
		_hsflvl = _playerData select 24;
		_hadlvl = _playerData select 25;

		life_blacklisted = _playerData select 20;

		life_is_arrested_police = _playerData select 26;
		life_jail_time = _playerData select 27;
	};
};

CONST(life_coplevel, _coplvl);
CONST(life_medicLevel, _medlvl);
CONST(life_havoclevel, _havlvl);
CONST(life_npaslevel, _npaslvl);
CONST(life_tpulevel, _tpulvl);
CONST(life_ctulevel, _ctulvl);
CONST(life_mpulevel, _mpulvl);
CONST(life_cidlevel, _mi5lvl);
CONST(life_academylevel, _academylvl);
CONST(life_hsslevel, _hsslvl);
CONST(life_hmulevel, _hmulvl);
CONST(life_hsflevel, _hsflvl);
CONST(life_hadlevel, _hadlvl);
CONST(life_sarlevel, _sarlvl);

PHX_loyalty = (_playerData select (_count - 4));
PHX_Statistics = (_playerData select (_count - 3));

life_gear = _gear;
PHX_LIFE_GEAR = life_gear;
[] call life_fnc_loadGear;

if !((_playerData select (_count - 2)) isEqualTo []) then {
    { life_vehicles pushBack _x } forEach (_playerData select (_count - 2));
};

if ((call life_adminlevel) > 0) then {
    if ((call life_adminlevel) >= 3) then {
        player setVariable ["isStaff", "Admin", true];
    } else {
        player setVariable ["isStaff", "Moderator", true];
    };
};

private _reqXP = getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1", PHX_Level] >> "expRequired");
private _mxLvl = (getNumber(missionConfigFile >> "CfgLevels" >> "maxLevel"));
if (PHX_Level > _mxLvl) then { PHX_Level = _mxLvl };
if (PHX_Level isEqualTo _mxLvl && { PHX_XP >= _reqXP }) then { PHX_canPrestige = true };

// Check Perks...
{
    if !(isClass (missionConfigFile >> "CfgPerks" >> _x)) then { PHX_Perks deleteAt _forEachIndex }; // This perk does not exist...
    if (PHX_Level < (getNumber(missionConfigFile >> "CfgPerks" >> "unlockLevel")) || { PHX_prestigeLevel < (getNumber(missionConfigFile >> "CfgPerks" >> "presitgeLevel")) }) then { PHX_Perks deleteAt _forEachIndex }; // We don't meet the requirements...
} forEach PHX_Perks;
[8] call SOCK_fnc_updatePartial; // Update our perks...

{
    PHX_Achievements set[_forEachIndex, (_x select 0)];
} forEach (PHX_Achievements select { _x isEqualType []});
[10] call DB(updatePartial);

// Rest donator settings if we're no longer a donator...
if (PHX_DonatorLevel < 1 && PHX_PrestigeLevel < 1 && { (PHX_iconSel isEqualType "") || !(PHX_NameColour isEqualTo "default") }) then {
	PHX_iconSel = "";
	profileNamespace setVariable["iconSel", PHX_iconSel];
	player setVariable ["iconSel", PHX_iconSel, true];

    PHX_NameColour = "default";
    profileNamespace setVariable["nameColour", PHX_NameColour];
    player setVariable ["nameColour", PHX_NameColour, true];
};

// SERVER SETTINGS
if (count (_playerData select (_count - 1)) > 0) then {
    (_playerData select (_count - 1)) params [
        ["_governor", [], [[]]],
        ["_noVotes", [], [[]]],
        ["_noOptions", [], [[]]],
        ["_activePolls", [], [[]]],
        ["_doneResults", [], [[]]],
        ["_enlistmentOpen", false, [true]],
        ["_taxRate", -1, [0]],
        ["_payRate", -1, [0]],
        ["_revRate", -1, [0]],
        ["_fuelRate", -1, [0]],
        ["_illegalItems", [], [[]]],
        ["_isWaring", false, [true]]
    ];

    // Election...
    PHX_curGovernor = _governor;
    PHX_isEnlistmentOpen = _enlistmentOpen;

    // Polls...
    PHX_noVotes = _noVotes;
    PHX_noOptions = _noOptions;
    PHX_activePolls = _activePolls;
    PHX_doneResults = _doneResults;

    // Governor Settings...
    PHX_TaxRate  = _taxRate;
    PHX_PaycheckRate = _payRate;
    PHX_RevivalRate = _revRate;
    PHX_FuelRate = _fuelRate;
    PHX_IllegalItems = _illegalItems;

    // Base Wars
    PHX_isWaring = _isWaring;

    if !(PHX_curGovernor isEqualTo []) then {
        if (
                playerSide isEqualTo civilian && 
                { (PHX_curGovernor select 0) isEqualTo (name player) } &&
                { (PHX_curGovernor select 1) isEqualTo (getPlayerUID player) } &&
                { !(isCID(player)) } &&
                { !(isHSS(player)) }
            ) then {
            PHX_isPM = true;
            player setVariable ["isPM", true, true];
        };
    };
};
PHX_isGovernmentSetup = true;

PHX_Data_Complete = true;