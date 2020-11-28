/*
	@File: fn_mapMarkers.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Hanlde the displaying of our markers...
*/
scopeName "markerHandler";
#include "..\..\script_macros.hpp"
#define MARKER "mil_triangle"
#define INJUREDMARKER "pictureHeal"
params [
    ["_isOpen",false,[false]]
];

if (_isOpen) then {
	private _markers = [];

	if (player getVariable ["isAdmin", false]) exitWith {};
	
	// Get units...
	private _units = (playableUnits select { isPlayer _x && { !(isNil { _x getVariable "realname" }) }});
	_units = switch true do {
		case (playerSide isEqualTo west): { (_units select { (side _x) isEqualTo west || { ((ONLINE(independent) < 1) && { (isDowned(_x)) }) } || { isCID(_x) && (_x getVariable ["showBadge", false]) }  }) };
		case (playerSide isEqualTo east): { (_units select { (side _x) isEqualTo east || { isHSS(_x) } }) };
		case (playerSide isEqualTo independent): { (_units select { (side _x) isEqualTo independent || { isDowned(_x) } }) };
		default { ([player, _units] call PHX(alliedUnits)) };
	};

	{
		private _colour = switch (side _x) do {
            case east: {"colorOPFOR"};
            case west: {"colorBLUFOR"};
            case independent: {"colorIndependent"};
            default {"colorCivilian"};
		};

		private _prefix = switch (side _x) do {
			case civilian: {[_x] call PHX_fnc_getPrefix};
			case independent: {[_x] call PHX_fnc_getPrefix};
			case west: {format["%1.",([_x] call PHX_fnc_getRank) select 2]};
			case east: {format["[%1.]",([_x] call PHX_fnc_getRank) select 2]};
			default {""};
		};

        _marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
		_marker setMarkerAlphaLocal 0;
        _marker setMarkerColorLocal _colour;
        _marker setMarkerTypeLocal MARKER;
        _marker setMarkerTextLocal format ["%1 %2", _prefix,name _x];

        _markers pushBack [_marker, _x, _colour];
    } forEach _units;

	for "_i" from 0 to 1 step 0 do {
		if !(visibleMap) exitWith {};

		if ([player, "gps"] call PHX(hasItem) && !(player getVariable ["isAdmin", false])) then {
			{
				_x params ["_mark", "_unit", "_dColour"];

				if ([_unit, "gps"] call PHX(hasItem) || { (playerSide isEqualTo independent && (isDowned(_unit))) || { (playerSide isEqualTo west && {(ONLINE(independent) < 1)} && { (isDowned(_unit)) }) } }) then {
					_mark setMarkerAlphaLocal 1;
					_mark setMarkerPosLocal (visiblePosition _unit);
					_mark setMarkerDirLocal (getDir _unit);
					_mark setMarkerColorLocal ([_dColour, "ColorRed"] select (isDowned(_unit)));
					_mark setMarkerTypeLocal ([MARKER, "loc_hospital"] select (isDowned(_unit)));
				} else {
					_mark setMarkerAlphaLocal 0;
				};
			} forEach _markers;
		} else {
			{
				(_x select 0) setMarkerAlphaLocal 0;
			} forEach _markers;
		};

		sleep 0.01;
	};

	{ deleteMarkerLocal (_x select 0) } forEach _markers;
};