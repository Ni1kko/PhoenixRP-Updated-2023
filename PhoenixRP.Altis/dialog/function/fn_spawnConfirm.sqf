#include "..\..\script_macros.hpp"
/*
    File: fn_spawnConfirm.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Spawns the player where he selected.
*/
private ["_spCfg","_sp","_spawnPos"];

"RscBacking" cutFadeOut 0;
if (life_spawn_point isEqualTo []) then {
    private ["_sp","_spCfg"];
    _spCfg = [playerSide] call life_fnc_spawnPointCfg;
    _sp = _spCfg select 0;

    /*
    if (playerSide isEqualTo civilian) then {
        if (isNil {(call compile format ["%1",_sp select 0])}) then {
            player setPos (getMarkerPos (_sp select 0));
        } else {
            _spawnPos = (call compile format ["%1",_sp select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            player setPos _spawnPos;
        };
    } else {
        player setPos (getMarkerPos (_sp select 0));
    };
    */
    player setPos (getMarkerPos (_sp select 0));
    
    titleText[format ["%2 %1",_sp select 1,"You have spawned at"],"BLACK IN"];
} else {
    if (playerSide isEqualTo civilian) then {
        if (isNil {(call compile format ["%1",life_spawn_point select 0])}) then {
            if (["house",life_spawn_point select 0] call BIS_fnc_inString) then {
                private ["_bPos","_house","_pos"];
                _house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
                _bPos = [_house] call life_fnc_getBuildingPositions;

                if (_bPos isEqualTo []) exitWith {
                    if (PHX_preload) then { 3 cutText ["Preloading spawn...","BLACK",0.1]; waitUntil {sleep 0.1; preloadCamera (getMarkerPos (life_spawn_point select 0))}; 3 cutText ["","BLACK IN"]; };
                    player setPos (getMarkerPos (life_spawn_point select 0));
                };

                {_bPos = _bPos - [(_house buildingPos _x)];} forEach (_house getVariable ["slots",[]]);
                _pos = _bPos call BIS_fnc_selectRandom;
                if (PHX_preload) then { 3 cutText ["Preloading spawn...","BLACK",0.1]; waitUntil {sleep 0.1; preloadCamera _pos}; 3 cutText ["","BLACK IN"]; };
                player setPosATL _pos;
            } else {
                if (PHX_preload) then { 3 cutText ["Preloading spawn...","BLACK",0.1]; waitUntil {sleep 0.1; preloadCamera (getMarkerPos (life_spawn_point select 0))}; 3 cutText ["","BLACK IN"]; };
                player setPos (getMarkerPos (life_spawn_point select 0));
            };
        } else {
            _spawnPos = (call compile format ["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
            _spawnPos = _spawnPos buildingPos 0;
            if (PHX_preload) then { 3 cutText ["Preloading spawn...","BLACK",0.1]; waitUntil {sleep 0.1; preloadCamera _spawnPos}; 3 cutText ["","BLACK IN"]; };
            player setPos _spawnPos;
        };
    } else {
        if (PHX_preload) then { 3 cutText ["Preloading spawn...","BLACK",0.1]; waitUntil {sleep 0.1; preloadCamera (getMarkerPos (life_spawn_point select 0))}; 3 cutText ["","BLACK IN"]; };
        player setPos (getMarkerPos (life_spawn_point select 0));
    };
    titleText[format ["%2 %1",life_spawn_point select 1,"You have spawned at"],"BLACK IN"];
};
player switchMove "";
player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];

// Double check the incapacitated stuff...
if (isDowned(player)) then {
    unsetDowned(player);
    unsetKiller(player);
};

setCurrentChannel 5; // Defualt us to direct when spawing...
0 enableChannel false; // Disable user ability to send voice and text on global channel
1 enableChannel false; // Disable user ability to send voice and text on global channel

if (life_firstSpawn) then {
    life_firstSpawn = false;
    [] spawn PHX(welcomeNotification);
    ["firstSpawn"] spawn PHX(unlockAchievement);

    if (PHX_isWaring && (playerSide isEqualTo civilian)) then {
        ["Group Base Wars are active! Get down there and get bidding!", "red", "Group Base Wars"] spawn PHX(notify);
    };

    [] call PHX(notifyPollStatus);
    player setVariable ["spawning", nil, true];

    PHX_loyalty params ["_loyDays", "_loyRewards"];

    private _intoTotal = floor (_loyDays / 8);
    if (_loyDays % 8 isEqualTo 0) then { _intoTotal = _intoTotal - 1 }; // Fixes stuff
    private _loyDays = _loyDays - (8 * (_intoTotal));

    if (_loyDays > (count _loyRewards)) then {
        [true] call PHX(openMenu);
        [23700, "Progression"] call PHX(switchApp);
        ["Loyalty"] call PHX_fnc_onLoad;
    };
} else {
    PHX_saveGear = true;
};

if (playerSide isEqualTo west) then {
	_buggedGear = ["arifle_MX_pointer_F","hgun_P07_F","U_B_CombatUniform_mcam_tshirt","V_PlateCarrierSpec_rgr","H_HelmetB_light_desert","B_AssaultPack_rgr_Medic"];
	_cGear = [primaryWeapon player,handgunWeapon player,uniform player,vest player,headgear player,backpack player];
	if (_cGear isEqualTo _buggedGear) then {
		[] spawn {
			_handle = [] spawn life_fnc_stripDownPlayer;
			waitUntil {scriptDone _handle};
			[] spawn life_fnc_copLoadout;
		};
	};
};

if (PHX_lowDetail) then {
    setTerrainGrid 50;
    enableEnvironment [false, false];
};

if (PHX_settings_streamerMode) then {
// Remove me from NHS Channels...
    switch (playerSide) do {
        case west: {
            [player,"apcToNHS","remove"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
        };
        case east: {
            [player,"havToNHS","remove"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
        };
        case independent: {
            [player,"apcToNHS","remove"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
            [player,"havToNHS","remove"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
        };
    };

    // NO STAFF!
    if (FETCH_CONST(life_adminlevel) > 0) then {
        [player,"staff","remove"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
    };

    // Hide house markers
    {
        private _markerName = format["house_%1",_x getVariable "uid"];
        _markerName setMarkerAlphaLocal 0.01;
    } forEach (life_houses + life_gang_houses);
};

if (PHX_settings_invisibleBackpack && !((backpack player) isEqualTo "")) then {
    (unitbackpack player) setObjectTexture [0,""];
};

[] call PHX(playerSkins);
[] call PHX_fnc_hudSetup;