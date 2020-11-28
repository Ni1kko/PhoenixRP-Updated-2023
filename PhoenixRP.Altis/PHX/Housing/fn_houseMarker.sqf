/*
	@File: fn_houseMarker.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Creates or deletes the house marker...
*/
#include "..\..\script_macros.hpp"
params [
	["_house", objNull, [objNull]],
	["_mode", 0, [0]]
];

if (isNull _house || { isNil {_house getVariable "uid"}}) exitWith {};

private _uid = _house getVariable "uid";

switch (_mode) do {
	case 0: {
		(_house getVariable "house_owner") params ["_id", "_name", "_isGang"];
		
		private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

		if !((_house getVariable ["house_name", ""]) isEqualTo "") then {
			_houseName = format["%1 (%2)", (_house getVariable ["house_name", ""]), _houseName];
		};

		_marker = createMarkerLocal [format ["house_%1", _uid], getPosATL _house];
		_marker setMarkerTextLocal _houseName;
		_marker setMarkerColorLocal (["colorBLUFOR", "ColorIndependent"] select (_isGang));
		_marker setMarkerTypeLocal "loc_Lighthouse";
	};

	case 1: {
		deleteMarkerLocal format["house_%1", _uid];
	};

	case 2: {
		private _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

		if !((_house getVariable ["house_name", ""]) isEqualTo "") then {
			_houseName = format["%1 (%2)", (_house getVariable ["house_name", ""]), _houseName];
		};

		(format["house_%1", _uid]) setMarkerTextLocal _houseName;
	};
};