#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens & initializes the chop shop menu.
*/

if (life_action_inUse) exitWith {};
if !(playerSide isEqualTo civilian || playerSide isEqualTo east) exitWith {["Your faction is not allowed to chop vehicles!", "red"] call PHX_fnc_notify;};
disableSerialization;

private _nearVehicles = nearestObjects [getMarkerPos (_this select 3),["AllVehicles"],25];

life_chopShop = _this select 3;
if (count _nearVehicles isEqualTo 0) exitWith {["There are no vehicles near to sell.", "red"] call PHX_fnc_notify;};
if !(createDialog "Chop_Shop") exitWith {["There was a problem opening the chop shop menu.", "red"] call PHX_fnc_notify;};

private _control = CONTROL(39400,39402);
{
    if (alive _x) then {
        _className = typeOf _x;
        _classNameLife = _className;
        _displayName = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
        _picture = getText(configFile >> "CfgVehicles" >> _className >> "picture");

        if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
            _classNameLife = "Default";
        };

        private _color = ((M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures") select (_x getVariable "Life_VEH_color")) select 0);
        if (isNil "_color") then { _color = "" };
        private _text = format["(%1)",_color];
        if (_text isEqualTo "()") then { _text = "" };

        private _price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
        private _chopMultiplier = LIFE_SETTINGS(getNumber,"vehicle_chop_multiplier");

        _price = _price * _chopMultiplier;
        if (!isNil "_price" && count crew _x isEqualTo 0) then {
            _control lbAdd format["%1 %2", _displayName, _text];
            _control lbSetData [(lbSize _control)-1,str(_forEachIndex)];
            _control lbSetPicture [(lbSize _control)-1,_picture];
            _control lbSetValue [(lbSize _control)-1,_price];
        };
    };
} forEach _nearVehicles;
