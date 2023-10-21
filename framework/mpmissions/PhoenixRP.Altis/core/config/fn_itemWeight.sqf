/*
    File: fn_itemWeight.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Gets the items weight and returns it.
*/
#include "..\..\script_macros.hpp"
if !(params[["_item", "", [""]]]) exitWith {};

[
    ([_item] call PHX(gearWeight)),
    ITEM_WEIGHT(_item)
] select (isClass(missionConfigFile >> "CfgItems" >> _item));