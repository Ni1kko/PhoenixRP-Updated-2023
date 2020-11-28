/*
    File: fn_drink.sqf
    Author: Zyn
    Description: Sets a value as to how drunk the player is
*/

params [
    ["_item","",[""]]
];

if (_item isEqualTo "") exitWith {};

private _drunk = switch _item do {
	case "beer": {6};
	case "moonshine": {75};
  case "gin": {37};
  case "vodka": {40};
  case "whiskey": {40};
  case "cider": {5};
};

PHX_drink = PHX_drink + _drunk;

switch true do {
  case (PHX_drink < 10): { ["It's strange how 8 bottles of water seems impossible, but this is so damn easy!", "cyan"] call PHX_fnc_notify; };
  case (PHX_drink >= 10): { ["You are over the legal limit. Better call a taxi!", "cyan"] call PHX_fnc_notify; };
  case (PHX_drink >= 50): { [] spawn PHX_fnc_overDose; };
};