/*
    File: fn_Initialization.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master client initialization file
*/
#include "..\..\script_macros.hpp"
scopename "LIFE_INIT";

waitUntil { !(isNull player) && { !((getPlayerUID player) isEqualTo "") } }; // Wait for Player to exist??
player switchMove "HubSpectator_stand";

private _startTime = diag_tickTime;

["Initialization", "Started"] call PHX(logIt);

profileNamespace setVariable ["GUI_BCG_RGB_R", 0.09];
profileNamespace setVariable ["GUI_BCG_RGB_G", 0.09];
profileNamespace setVariable ["GUI_BCG_RGB_B", 0.09];
profileNamespace setVariable ["GUI_BCG_RGB_A", 1];
saveProfileNamespace;

[] call compile preprocessFileLineNumbers "core\clientValidator.sqf";

[] call compile preprocessFileLineNumbers "core\configuration.sqf";

// Make sure admins are hidden...
{
    if (_x getVariable ["isInvisibile", false]) then {
        [_x, true] call PHX(changeVisibility); // Hides the player...
    };
    
    [_x, true] call PHX(playerSkins);
} forEach allPlayers;

["Setting up Eventhandlers...", 0.3] call PHX(setLoadingStage);
[] call PHX(setupEVH);

["Setting up user actions...", 0.4] call PHX(setLoadingStage);
[] call PHX(setupActions);

["Waiting for the server to be ready...", 0.5] call PHX(setLoadingStage);

waitUntil {!isNil "life_server_isReady"};
waitUntil {!isNil "HC_Active" && {!isNil "life_server_extDB_notLoaded"}};

if (life_server_extDB_notLoaded) exitWith {
    ["extDB failed to load. Please contact the Management Team.", 1] call PHX(setLoadingStage);
};

waitUntil {life_server_isReady};

["Setting up map...", 0.6] call PHX(setLoadingStage);
[] call PHX_fnc_atmMarkers;

private _query = [] spawn PHX_fnc_queryPlayerInfo;
waitUntil { scriptDone _query };

if (isNil "PHX_Data_Complete" || { !PHX_Data_Complete }) exitWith {}; // Something went wrong, it'll be handled by other scripts...

["Finishing client setup procedure...", 0.8] call PHX(setLoadingStage);

waitUntil {!(isNull (findDisplay 46))};

{
	_x displayAddEventHandler ["KeyDown", {
		_this call {
			params ["","_key","_shift"];
			if (_key isEqualTo 74 && {_shift}) exitWith {
				if !(userInputDisabled) then {
					disableUserInput true;
					if (userInputDisabled) then {
						disableUserInput false;
					};
				};
				true
			};
		};
	}];
} forEach allDisplays;

["Loading side inits...", 0.9] call PHX(setLoadingStage);
switch (playerSide) do {
    case west: {call PHX(initPolice)};
    case civilian: {call PHX(initCivilian)};
    case independent: {call PHX(initMedic)};
    case east: {call PHX(initHAVOC)};
};

if (LIFE_SETTINGS(getNumber,"enableUndercover") isEqualTo 1) then {
    [getPlayerUID player] remoteExecCall ["PHXSRV_fnc_getUndercover", RSERV];
    waitUntil { PHX_SideChosen };
};

life_paycheck = [] call PHX_fnc_getPaycheck;

if (FETCH_CONST(life_adminlevel) > 0) then { [player, "staff"] remoteExecCall ["PHXSRV_fnc_handleChat", RSERV] };

player setVariable ["restrained",sideUnknown,true];
player setVariable ["Escorting",false,true];
player setVariable ["playerSurrender",false,true];
player setVariable ["isTazed", false, true];
player setVariable ["isKnockedOut", false, true];
player setVariable ["isSpeaking", false, true];
player setVariable ["hideName", false, true];
player setVariable ["nameColour", PHX_NameColour, true];
player setVariable ["iconSel", PHX_iconSel, true];
player setVariable ["titleSel", PHX_Title, true];

[] execFSM "core\fsm\client.fsm";

waitUntil {!(isNull (findDisplay 46))};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"]; 
(findDisplay 46) displayAddEventHandler ["KeyUp", "private _handled = false; if ((_this select 1) isEqualTo 57  && { PHX_canRespawn }) then { PHX_bleedFaster = false; _handled = true; }; _handled"];

[player,life_settings_enableSidechannel,playerSide] remoteExecCall ["TON_fnc_manageSC", RSERV];
0 cutText ["","BLACK IN"];

/* Set up frame-by-frame handlers */
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];

if (["Belle Delphine", profileName] call life_fnc_inString) then {
    ["fangirl"] spawn PHX(unlockAchievement);
};

life_fnc_moveIn = compileFinal "
    life_disable_getIn = false;
    player moveInCargo (_this select 0);
    life_disable_getOut = true;
";

[] spawn life_fnc_survival;

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {(!isNull (findDisplay 49)) && {(!isNull (findDisplay 602))}}; // Check if Inventory and ESC dialogs are open
        (findDisplay 49) closeDisplay 2; // Close ESC dialog
        (findDisplay 602) closeDisplay 2; // Close Inventory dialog
    };
};

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil { sleep 0.5; [(position player)] call PHX_fnc_isRedZone };
        [] spawn PHX(enteranceText); // Notify we've entered...
        [] call PHX(combatZone);
        sleep 3;
        waitUntil { sleep 0.5; !([(position player)] call PHX_fnc_isRedZone) };
        ["<t align='center'>You've left a <t color='#cc0001'>Combat Zone</t></t>"] spawn PHX(enteranceText); // Notify we've left...
        [] call PHX(combatZone);
        sleep 3;
    };
};

addMissionEventHandler ["EachFrame", {
    private _isSpeaking = !isNull findDisplay 55;
    if !(player getVariable ["isSpeaking", false] isEqualTo _isSpeaking) then { player setVariable ["isSpeaking", _isSpeaking, true] };
}];

if (LIFE_SETTINGS(getNumber,"player_fatigue") isEqualTo 0) then {player enableFatigue false;};

if (LIFE_SETTINGS(getNumber,"pump_service") isEqualTo 1) then {
    [] execVM "PHX\Initialization\Setup\fn_setupStationService.sqf";
};

[getPlayerUID player,player getVariable ["realname",name player]] remoteExecCall (["fnc_wantedProfUpdate","life"] call SOCK_fnc_getRemoteDestination);

PHX_saveGear = true;

// Christmas vibes
if (LIFE_SETTINGS(getNumber,"enableSnow") isEqualTo 1) then {
    [] spawn PHX_fnc_snow;
};

["Initialization", "Ended", format["Time: %1s", (diag_tickTime - _startTime)]] call PHX(logIt);

["RscTitleLoading"] call PHXUI_fnc_destroyLayer;

if (playerSide in [east, civilian] && { life_is_arrested_police || life_is_arrested_havoc }) then {
	player switchMove "";

    life_firstSpawn = false;
    life_is_arrested = false;

    [player, life_jail_time, west] spawn life_fnc_jail;
} else {
	// [] call life_fnc_spawnMenu;
	[] call PHX_fnc_mainMenu;
};
