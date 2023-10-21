/*
 *  @File: fn_placeablesMenu.sqf
 *  @Author: Maximum
 *	@Modified: blackfisch, Zyn
 *
 *  Description:
 *  Handles the main menu for placeables
*/

if !(isNil "PHX_barrier_active") exitWith {
    ["You already have a barrier ready to be placed","red"] call PHX_fnc_notify;
	closeDialog 0;
};

createDialog "RscPlaceables";
waitUntil { !isNull(findDisplay 20000) };
private _display = findDisplay 20000;
private _placeables = _display displayCtrl 20001;
private _used = _display displayCtrl 20005;
lbClear _placeables;
lbClear _used;

private _name = "";
private _classname = "";
private _side = [];

{
	_name = getText(_x >> "name");
    _className = getText(_x >> "variable");
	_side = getArray(_x >> "side");
	if (count(_side) < 1) then {
		_placeables lbAdd _name;
		_placeables lbSetData [(lbSize _placeables) - 1, _className];
	} else {
		if (str(playerSide) in _side) then {
			_placeables lbAdd _name;
			_placeables lbSetData [(lbSize _placeables) - 1, _className];
		};
	};
} forEach ("true" configClasses(missionConfigFile >> "CfgPlaceables"));

{
	_name = getText(missionConfigFile >> "CfgPlaceables" >> typeOf(_x) >> "name");
    _used lbAdd _name;
    _used lbSetData [(lbSize _used) - 1, [_x] call BIS_fnc_objectVar];
	_used lbSetValue [(lbSize _used) - 1, _forEachIndex];
} forEach PHX_barrier_placed;