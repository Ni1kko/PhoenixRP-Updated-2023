disableSerialization;
/*
    File: fn_disconnectToLobby.sqf
    Author: Kyle Dorans

    Description:
    Broadcasts in chat when a player disconnects to lobby and logs of the user
*/

private _display = (findDisplay 49);
(_display displayCtrl 104) ctrlEnable false;

if !(life_firstSpawn) then {
    [] call SOCK_fnc_updateRequest;
};

[0,format ["%1 disconnected to Lobby",name player]] remoteExecCall ["life_fnc_broadcast",-2];

uiNamespace setVariable ["showBars", false];

player allowDamage false;
disableUserInput true;
showChat false;

life_settings_tagson = false;

1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;

[player] remoteExec ["TON_fnc_cleanupRequest",2];
disableUserInput false;
["Goodbye",true,1] call BIS_fnc_endMission;