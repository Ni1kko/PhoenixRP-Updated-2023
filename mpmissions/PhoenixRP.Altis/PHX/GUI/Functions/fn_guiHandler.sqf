/*
    File: fn_guiHandler.sqf
    Author: Zyn
    Description: Just called to do GUI shit
*/

params [
    ["_ui", "", [""]],
	["_idd", 0, [0]]
];

waitUntil {!isNull (findDisplay _idd)};

switch _ui do {
	case "RscRoulette": {ctrlEnable [15006,false]; ctrlEnable [15007,false]; ctrlEnable [15008,false]};
	case "RscScratchCard": {PHX_scratchTotal = 0; PHX_scratchArray = nil};
	case "RscBlackjack": {ctrlEnable [14005,false]; ctrlEnable [14006,false]};
	case "RscHigherOrLower": {ctrlShow [13017,false]; ctrlEnable [13015,false]; ctrlEnable [13016,false]};
};