/*
	@File: fn_getGovernor.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns the details of the current Governor...
*/

private _query = [format ["SELECT array FROM serversettings WHERE name='governor_details'"], 2] call DB_fnc_asyncCall;

if (_query isEqualType "" || { _query isEqualTo [] }) exitWith {[]};

private _new = [(_query select 0)] call DB_fnc_mresToArray;
_new