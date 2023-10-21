/*
 *  @File: fn_placeablePlace.sqf
 *  @Author: Maximum
 *	@Modified: blackfisch, Zyn
 *
 *  Description:
 *  Handles placing the object
*/

params [
	["_hk", false, [true]]
];

if (count PHX_barrier_placed >= 30) exitWith {
	["You have reached your maximum amount of barriers, please remove already placed barriers to place more","red"] call PHX_fnc_notify;
	waitUntil { closeDialog 0; !dialog };
};

if (_hk && {isNil "PHX_barrier_object"}) exitWith {["You must place an object before using the hotkey","red"]};

private _object = objNull;

if (_hk) then {
	_object = PHX_barrier_object createVehicle (position player);
} else {
	private _display = findDisplay 20000;
	private _placeables = _display displayCtrl 20001;
	private _className = lbData[20001, lbCurSel (20001)];
	waitUntil { closeDialog 0; !dialog };
	_object = _className createVehicle (position player);
};

PHX_barrier_active = _object;
PHX_barrier_object = typeOf(_object); //--- Used for the hotkey

private _attachPos = [0, 3, 0.5];
_object attachTo [player, _attachPos];
_object enableSimulationGlobal false;

private _originalPos = position _object;
private _playerOriginalPos = position player;
_object allowDamage false;
_object enableSimulation false;

waitUntil{
	if (PHX_barrier_active distance _originalPos > 50 || {player distance _playerOriginalPos > 50}) then {
		[true] call PHX_fnc_placeableCancel;
    };
    sleep 1;
    isNil "PHX_barrier_active";
};
