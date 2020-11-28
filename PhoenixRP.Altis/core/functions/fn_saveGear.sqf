#include "..\..\script_macros.hpp"
/*
    File: fn_saveGear.sqf
    Author: Bryan "Tonic" Boardwine
    Full Gear/Y-Menu Save by Vampire
    Edited: Itsyuka

    Description:
    Saves the players gear for syncing to the database for persistence..
*/
if (player getVariable ["isAdmin", false] || { !(isNull (findDisplay 3100)) }) exitWith {};

if !(PHX_saveGear) exitWith {
    SETGEAR([]);
    life_gear = [];
};

private _return = (getUnitLoadout player);
_return pushBack (PHX_saveableItems select {ITEM_VALUE(_x) > 0} apply {[_x, ITEM_VALUE(_x)]});

SETGEAR(_return);
life_gear = _return;