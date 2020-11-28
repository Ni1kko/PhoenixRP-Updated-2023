#include "..\..\script_macros.hpp"
/*
    File: fn_updatePartial.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sends specific information to the server to update on the player,
    meant to keep the network traffic down with large sums of data flowing
    through remoteExec
*/
if (player getVariable ["isAdmin", false] || { life_firstSpawn }) exitWith {};
if !(params [["_mode", 0, [0]]]) exitWith {};

private _flag = switch (playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"hav"};};
private _packet = [getPlayerUID player, playerSide, nil, _mode, _flag];
private _array = [];

switch (_mode) do {
    case 0: {
        _packet set[2, [CASH]];
        [] call PHX_fnc_hudUpdate;
    };

    case 1: {
        _packet set[2, [BANK]];
    };

    case 2: {
        {
            _varName = LICENSE_VARNAME(configName _x,_flag);
            _array pushBack [_varName,LICENSE_VALUE(configName _x,_flag)];
        } forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_flag] configClasses (missionConfigFile >> "CfgLicenses"));

        _packet set[2, [_array]];
    };

    case 3: {
        [] call life_fnc_saveGear;
        _packet set[2, [[GETGEAR, GEARCOL]]];
    };

    case 5: {
        _packet set[2, [life_is_arrested_police]];
    };

    case 6: {
        _packet set[2, [CASH, BANK]];
    };

    case 7: {
        // Tonic is using for keychain..?
    };

    case 8: {
        _packet set[2, [PHX_Perks]];
    };

    case 9: {
        private _members = _group getVariable ["gang_members", []];
        private _gangid = (player getVariable ["gang_uid", -1]);
        private _ganglevel = 0;

        private _memIndex = _members findIf { (_x select 1) isEqualTo (getPlayerUID player) };
        if !(_memIndex isEqualTo -1) then {
            private _ranks = ((group player) getVariable "gang_ranks");
            _ganglevel = (_members select _memIndex) select 2;

            if ((count _ranks) < _ganglevel) then {
                _ganglevel = 0;
            };
        };

        _packet set[2, [_gangid, _ganglevel]];
    };

    case 10: {
        _packet set[2, [PHX_Achievements]];
    };

    case 11: {
        _packet set[2, [GETGEAR, GEARCOL]];
    };
};

_packet remoteExecCall (["fnc_updatePartial", "DB"] call SOCK_fnc_getRemoteDestination);