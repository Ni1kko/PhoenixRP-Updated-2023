/*
	@File: fn_lookupID.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Looks up an id...
*/
params [
	["_uid", "-1", [""]]
];

#define BT_TOGGLE [2, []] remoteExecCall ["PHX_fnc_RscIDLookup", remoteExecutedOwner]
#define rmsg(msg) [msg, "red"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner]

if (_uid isEqualTo "-1") exitWith {rmsg("An error occured while searching this id..."); BT_TOGGLE};
if !([_uid] call LIFE_fnc_isNumber) exitWith {rmsg("IDs must be numertic..."); BT_TOGGLE};

_uid = parseNumber _uid; // Covernt datatype...

private _id = [_uid, "uid"] call PHXSRV_fnc_getID; // Get the ID and related information...

if !(_id isEqualType []) exitWith {rmsg("No entry with the searched ID exists..."); BT_TOGGLE};

[1, _id] remoteExecCall ["PHX_fnc_RscIDLookup", remoteExecutedOwner];