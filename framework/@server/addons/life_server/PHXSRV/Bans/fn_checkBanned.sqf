/*
	Author: Ni1kko
	Description: This script is used to check if a player is banned from the server.
*/

private _steamID = param [0, "",[""]];
private _ownerID = param [1, -1];

//-- Developer dont ban!
//if(_steamID in getArray (missionConfigFile >> "enabledDebugConsole")) exitWith {false};

//check db for bans and kick if banned `Table : phxbans`
private _query = [format["SELECT id FROM phxbans WHERE steamID = '%1'",_steamID], 2] call DB_fnc_asyncCall;

//-- Not banned
if (_query in ["",[]])exitWith{false};
if (count _query == 0)exitWith{false};

//-- Kick player if banned
[_ownerID,_steamID] call PHXSVR_fnc_kickBanned;

true