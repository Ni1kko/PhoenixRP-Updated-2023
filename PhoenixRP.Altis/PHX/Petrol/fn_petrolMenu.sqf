#include "..\..\script_macros.hpp"
/*
*   @File: fn_collectPetrol.sqf
*   @Author: Zyn
*   @Description: Petrol collection
*/

if (life_action_inUse) exitWith {};
if !(playerSide isEqualTo civilian) exitWith {["Your faction is not allowed to do this!", "red"] call PHX_fnc_notify;};
disableSerialization;

private _nearVehicles = nearestObjects [position (_this select 0),["AllVehicles"],30];

if (count _nearVehicles isEqualTo 0) exitWith {["There are no vehicles near to pump.", "red"] call PHX_fnc_notify;};
if !(createDialog "RscPetrol") exitWith {["There was a problem opening the petrol menu.", "red"] call PHX_fnc_notify;};

private _control = CONTROL(8500,8504);
{
    if (alive _x && {(typeOf(_x) in (LIFE_SETTINGS(getArray,"fuelTankers")))}) then {
        _className = typeOf _x;
        _classNameLife = _className;
        _displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        _picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

        if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
            _classNameLife = "Default";
        };

        if (count crew _x isEqualTo 0) then {
            _control lbAdd format["%1", _displayName];
            _control lbSetData [(lbSize _control)-1,[_x] call BIS_fnc_objectVar];
            _control lbSetPicture [(lbSize _control)-1,_picture];
        };
    };
} forEach _nearVehicles;
