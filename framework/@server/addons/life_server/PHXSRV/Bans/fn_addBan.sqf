/*
	Author: Ni1kko
	Description: Ban player from server
*/

private _steamID = param [0, "",[""]];
private _reason = param [1, ""];

if(_reason isEqualTo "")then{
	_reason = "No reason given!";
};

//-- Insert to database `Table : phxbans`
[format["INSERT INTO phxbans (steamID, reason) VALUES ('%1', '%2')",_steamID,str _reason], 1] call DB_fnc_asyncCall;

//-- Check if ban was successful and kick
if([-1,_steamID] call PHXSVR_fnc_kickBanned) exitWith{
	diag_log format["%1 has been kicked for %2!",_steamID,_reason];
	true
};

false