/*
    File: fn_drugs.sqf
    Author: Zyn
    Description: Handles the effects and overdoes ect..
*/

params [
    ["_item","",[""]]
];

if (_item isEqualTo "") exitWith {};

switch _item do {
	case "heroin_processed": {[] spawn PHX_fnc_coke;};
	case "ecstasy": {[] spawn PHX_fnc_coke;};
	case "cocaine_processed": {[] spawn PHX_fnc_coke;};
	case "marijuana": {[] spawn PHX_fnc_weed;};
	case "meth_processed": {[] spawn PHX_fnc_coke;};
	case "fentanyl": {[] spawn PHX_fnc_fentanyl;};
	case "morphine": {[] spawn PHX_fnc_morphine;};
};

private _drug = switch _item do {
	case "heroin_processed": {40};
	case "ecstasy": {20};
	case "cocaine_processed": {15};
	case "marijuana": {10};
	case "meth_processed": {30};
	case "fentanyl": {10};
	case "morphine": {15};
};

PHX_drugs = PHX_drugs + _drug;

if (PHX_drugs >= 50 && PHX_drugs < 100) then {
	["You are starting to tremor, better take a chill pill!", "cyan"] call PHX_fnc_notify;
} else {
	if (PHX_drugs >= 100) then {
		["You over dosed, off to the heavens!", "cyan"] call PHX_fnc_notify;
		[] spawn PHX_fnc_overDose;
	};
};