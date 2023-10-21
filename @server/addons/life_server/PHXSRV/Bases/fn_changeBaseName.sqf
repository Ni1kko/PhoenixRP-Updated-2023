/*
	@File: fn_changeBaseName.sqf

	@Author: Jack "Scarso" Farhall
	@Modified: Zyn
	
	@Description: Changes the name of a marker
*/
params [
	["_markerName", "", [""]]
];

private _dataName = switch true do {
	case (_markerName isEqualTo "gang_base"): {"gbase_SW"};
	case (_markerName isEqualTo "gang_base_1"): {"gbase_NW"};
	case (_markerName isEqualTo "gang_base_2"): {"gbase_NE"};
	default {""};
};

private _query = format["SELECT value FROM serversettings WHERE name = '%1'", _dataName];
_results = [_query, 2] call DB_fnc_asyncCall;

private _query = format["SELECT name FROM phxgangs WHERE id = '%1'", (_results select 0)];
_name = [_query, 2] call DB_fnc_asyncCall;

if (_markerName isEqualTo "" || {_name isEqualTo ""} || {((_results select 0) isEqualTo -2)}) exitWith {};

if (!(_dataName isEqualTo "") && {!((_name select 0) isEqualTo "<null>")} ) then { 
	_markerName setMarkerText (format["%1's Gang Base",(_name select 0)]);
};