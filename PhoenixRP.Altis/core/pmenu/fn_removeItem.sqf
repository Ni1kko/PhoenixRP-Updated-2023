/*
    File: fn_removeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes the selected item & amount to remove from the players
    virtual inventory.
*/
#include "..\..\script_macros.hpp"
disableSerialization;

private _data = lbData[23202,(lbCurSel 23202)];
private _value = ctrlText 23205;

if (_data isEqualTo "") exitWith {NOTIFY("You did not select anything to remove.","red");};
if (!([_value] call LIFE_fnc_isNumber)) exitWith {NOTIFY("You didn't enter an actual number format.","red");};
if (parseNumber(_value) <= 0) exitWith {NOTIFY("You need to enter an actual amount you want to remove.","red");};
if (ITEM_ILLEGAL(_data) && ([west,visiblePosition player,100] call life_fnc_nearUnits)) exitWith {NOTIFY("This is an illegal item and the police are near by. You cannot dispose of the evidence.","red")};
if !(isNull objectParent player) exitWith {NOTIFY("You cannot remove an item when you are in a vehicle.","red")};
if (!([false,_data,(parseNumber _value)] call life_fnc_handleInv)) exitWith {NOTIFY("You don't have that many items!","red");};

[format ["You have successfully removed %1 %2 from your inventory.",(parseNumber _value),(ITEM_NAME(_data))],"green"] call PHX_fnc_notify;

["Inventory"] call PHX(onLoad);