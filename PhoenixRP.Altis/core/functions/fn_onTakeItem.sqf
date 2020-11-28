/*
	@File: fn_onTakeItem.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Calls for HUD & Textures to be updated while also checking expliots and other issues...
*/
#include "..\..\script_macros.hpp"

_this params [
    ["_unit", objNull, [objNull]],
    ["_container", objNull, [objNull]],
    ["_item", "", [""]]
];

if (isNull _unit || { _item isEqualTo "" }) exitWith { systemChat "onTakeError"; true }; // Bad thingies?

// ArmA is actually a dog shit game, https://www.youtube.com/watch?v=Ns0ZlURbdsc&feature=youtu.be
if ((vest _unit) in ["V_RebreatherIR", "V_RebreatherIA", "V_RebreatherB"] && { ((getNumber (configFile >> "CfgWeapons" >> _item >> "itemInfo" >> "type")) isEqualTo 701) }) exitWith {
    private _items = vestItems player;

    removeVest _unit;
    _unit addVest _item;

    if !(isNil "_items") then {
        {
            [_x,true,false,false,true] spawn life_fnc_handleItem;
        } forEach _items;
    };

    true
};

[] call PHX(hudUpdate);
[] call PHX(playerSkins);