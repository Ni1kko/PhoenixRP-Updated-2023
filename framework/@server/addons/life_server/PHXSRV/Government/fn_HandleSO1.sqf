/*
	@File: fn_HandleSO1.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns the details of the current Governor...
*/
if !(params [
	["_player", objNull, [objNull]],
	["_target", objNull, [objNull]],
    ["_mode", "", [""]]
]) exitWith {};

private _query = "";

switch (_mode) do {
    case "add": {
        _query = format["UPDATE phxclients SET isSO1='1' WHERE playerid='%1'", (getPlayerUID _target)];

        // Do the license you mong...
        ["license_civ_SO1", true] remoteExecCall ["PHX_fnc_remoteLicense", _target];
        _target setVariable ["PHX_isSO1", true, true];

        // Notify...
        [format["You've given %1 SO1 Authorisation...", (name _target)]] remoteExec ["PHX_fnc_notify", _player];
        [format["You've been given SO1 Authorisation by %1...", (name _player)]] remoteExec ["PHX_fnc_notify", _target];
    };
    case "remove": {
        _query = format["UPDATE phxclients SET isSO1='0' WHERE playerid='%1'", (getPlayerUID _target)];

        // Do the license you mong...
        ["license_civ_SO1", false] remoteExecCall ["PHX_fnc_remoteLicense", _target];
        _target setVariable ["PHX_isSO1", nil, true];

        // If they're on-duty, get them off!
        if (_target getVariable ["isSO1", false]) then {
			["SO1", false] remoteExecCall ["PHX_fnc_jobHandling", _target];
        };

        // Notify...
        [format["You've removed %1's SO1 Authorisation...", (name _target)]] remoteExec ["PHX_fnc_notify", _player];
        [format["You've had your SO1 Authorisation removed by %1...", (name _player)]] remoteExec ["PHX_fnc_notify", _target];
    };
};

 [_query,1] call DB_fnc_asyncCall; // Actually make the change...