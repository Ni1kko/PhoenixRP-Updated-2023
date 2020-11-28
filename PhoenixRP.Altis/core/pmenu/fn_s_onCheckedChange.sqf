/*
    File: fn_s_onCheckedChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Switching it up and making it prettier..
*/
#include "..\..\script_macros.hpp"
params ["_option", "_state"];

private _mode = (_state isEqualTo 1);

switch (_option) do {
    case "tags": {
        if (_mode) then {
            life_settings_tagson = true;
            profileNamespace setVariable ["life_settings_tagson",true];
        } else {
            life_settings_tagson = false;
            profileNamespace setVariable ["life_settings_tagson",false];
        };
    };

    case "objects": {
        if (_mode) then {
            life_settings_revealObjects = true;
            profileNamespace setVariable ["life_settings_revealObjects",true];
            LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
        } else {
            life_settings_revealObjects = false;
            profileNamespace setVariable ["life_settings_revealObjects",false];
            [LIFE_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
        };
    };

    case "sidechat": {
        if (_mode) then {
            profileNamespace setVariable ["life_enableSidechannel",true];
            life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",true];
        } else {
            profileNamespace setVariable ["life_enableSidechannel",false];
            life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel",false];
        };
        [player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC",RSERV];
    };

    case "broadcast": {
        profileNamespace setVariable ["life_enableNewsBroadcast", _mode];
        PHX_hideHUD = profileNamespace getVariable ["life_enableNewsBroadcast", _mode];
    };

    case "intro": {
        profileNamespace setVariable ["life_settings_intro", _mode];
        life_settings_intro = profileNamespace getVariable ["life_settings_intro", _mode];
    };

    case "hud": {
        profileNamespace setVariable ["life_settings_hud", _mode];
        PHX_hideHUD = profileNamespace getVariable ["life_settings_hud", _mode];
        [] call PHX_fnc_hudUpdate;
    };

    case "player": {
        profileNamespace setVariable ["life_settings_player", _mode];
        life_settings_player = profileNamespace getVariable ["life_settings_player", _mode];
    };

    case "group": {
        profileNamespace setVariable ["PHX_settings_disableGroupIcons", _mode];
        PHX_settings_disableGroupIcons = profileNamespace getVariable ["PHX_settings_disableGroupIcons", _mode];
    };

    case "alliance": {
        profileNamespace setVariable ["PHX_settings_ignoreRequests", _mode];
        PHX_settings_ignoreRequests = profileNamespace getVariable ["PHX_settings_ignoreRequests", _mode];
    };

    case "notify": {
        profileNamespace setVariable ["PHX_settings_notify", _mode];
        PHX_settings_notify = profileNamespace getVariable ["PHX_settings_notify", _mode];
    };

    case "invisible": {
        if ((backpack player) isEqualTo "") exitWith {NOTIFY("You don't have a backpack!","red"); CONTROL(23000,24326) cbSetChecked !(_state isEqualTo 1)};
        if (_mode) then {
            profileNamespace setVariable["PHX_invisibleBackpack",true];
            PHX_settings_invisibleBackpack = profileNamespace getVariable ["PHX_invisibleBackpack",true];
            (unitbackpack player) setObjectTexture [0,""];
        } else {
            profileNamespace setVariable["PHX_invisibleBackpack",false];
            PHX_settings_invisibleBackpack = profileNamespace getVariable ["PHX_invisibleBackpack",false];
            (unitbackpack player) setObjectTexture [0,(getArray(configFile >> "cfgVehicles" >> (backpack player) >> "hiddenSelectionsTextures")) select 0];
        };
    };

    case "lowdetail": {
        if (_state isEqualTo 1) then {
            PHX_lowDetail = true;
            profileNamespace setVariable ["PHX_lowDetail",true];
            setTerrainGrid 50;
            enableEnvironment [false, false];
        } else {
            PHX_lowDetail = false;
            profileNamespace setVariable ["PHX_lowDetail",false];
            setTerrainGrid 25;
            enableEnvironment [true, true];
        };
    };

    case "streamer": {
        disableSerialization;
        if (_state isEqualTo 1) then {
            profileNamespace setVariable ["PHX_settings_streamerMode",true];
            PHX_settings_streamerMode = profileNamespace getVariable ["PHX_settings_streamerMode",true];

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
        } else {
            profileNamespace setVariable ["PHX_settings_streamerMode",false];
            PHX_settings_streamerMode = profileNamespace getVariable["PHX_settings_streamerMode",false];

            // Add me from NHS Channels...
            switch (playerSide) do {
                case west: {
                    [player,"apcToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
                };
                case east: {
                    [player,"havToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
                };
                case independent: {
                    [player,"apcToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
                    [player,"havToNHS"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
                };
            };

            if (FETCH_CONST(life_adminlevel) > 0) then {
                [player,"staff"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV];
            };

            // Show house markers
            {
                private _markerName = format["house_%1",_x getVariable "uid"];
                _markerName setMarkerAlphaLocal 1;
            } forEach (life_houses + life_gang_houses);
        };
    };

	case "preloadSpawn": {
        if (PHX_preload isEqualTo false) then {
            PHX_preload = true;
            CONTROL(38500,38511) ctrlSetTextColor [0, 255, 0, 1];
			ctrlShow[38511,false];
			ctrlShow[38511,true];
        } else {
            PHX_preload = false;
			CONTROL(38500,38511) ctrlSetTextColor [1, 1, 1, 1];
			ctrlShow[38511,false];
			ctrlShow[38511,true];
        };
    };
};