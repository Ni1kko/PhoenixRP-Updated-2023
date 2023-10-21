#include "..\..\script_macros.hpp"
/*
    File: fn_gutAnimal.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Guts the animal?
*/
private ["_animalCorpse","_upp","_ui","_progress","_pgText","_cP","_displayName","_item"];
_animalCorpse = param [0,objNull,[objNull]];
if (isNull _animalCorpse) exitWith {}; //Object passed is null?

life_interrupted = false;
if (player distance _animalCorpse > 3.5) exitWith {}; //WTF need check with nearest objects I love Arma
life_action_inUse = true;

switch (typeOf _animalCorpse) do {
    case "Hen_random_F": {_displayName = "Chicken"; _item = "raw_hen";};
    case "Cock_random_F": {_displayName = "Rooster"; _item = "raw_rooster";};
    case "Goat_random_F": {_displayName = "Goat"; _item = "raw_goat";};
    case "Sheep_random_F": {_displayName = "Sheep"; _item = "raw_sheep";};
    case "Rabbit_F": {_displayName = "Rabbit"; _item = "raw_rabbit";};
    default {_displayName = ""; _item = "";};
};

if (_displayName isEqualTo "") exitWith {life_action_inUse = false;};

if !(
    [
        format ["Gutting %1...", _displayName],
        15,
        [
            "isNull (_this select 0)", 
            [_animalCorpse]
        ]
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

if ([true,_item,1] call life_fnc_handleInv) then {
    deleteVehicle _animalCorpse;
    [format [("You have collected some raw %1 meat."),_displayName],"green"] call PHX_fnc_notify;
} else {
    NOTIFY("Your inventory space is full.","red");
};