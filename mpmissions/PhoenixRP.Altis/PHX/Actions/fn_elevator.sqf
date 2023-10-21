#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgMap" >> "NHSLifts"
/*
  File: fn_elevator.sqf
  Author: Conner
  Description: Uses the elevator?
*/

(_this select 3) params [
    ["_location","",[""]],
    ["_direction","",[""]]
];

cutText ["", "BLACK OUT", 5];
cutText ["Using Lift", "BLACK FADED"];
life_action_inUse = true;

if (_direction isEqualTo "Up") then {
	private _mapCfg = CFG >> _location;
	private _pos = (getArray(_mapCfg >> "Upposition"));
	private _rot = (getNumber(_mapCfg >> "Uprotation"));
	player setpos _pos;
	player setDir _rot;
} else {
	private _mapCfg = CFG >> _location;
	private _pos = (getArray(_mapCfg >> "Downposition"));
	private _rot = (getNumber(_mapCfg >> "Downrotation"));
	player setpos _pos;
	player setDir _rot;
};

sleep 3;
titleCut [" ","BLACK IN",3];
life_action_inUse = false;
