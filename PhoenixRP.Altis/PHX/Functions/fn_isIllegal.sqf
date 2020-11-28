/*
    @File: fn_isIllegal.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Checks if a given item is illegal...
*/
scopeName "isIllegal";
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgItems"

// Checks...
if !(params [["_item", "", [""]]]) exitWith {false}; // _item should be the classname...
if !(isClass (CFG >> _item)) exitWith {false};

private _legality = CFG >> _item >> "illegal";

// Check if the item is database based or config based...
if (isNumber _legality) then { 
	if ((getNumber (_legality)) isEqualTo 1) then { true breakOut "isIllegal" }; 
} else {
	if ((getText (_legality)) in PHX_IllegalItems) then { true breakOut "isIllegal" }; 
};

false