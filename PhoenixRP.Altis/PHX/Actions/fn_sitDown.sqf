/*
*   @File: fn_chair.sqf
*   @Author: Sig
*	@Editor: Conner Merlin
*
*   Description: Sits the players fat ass down on the chair
*
*   Usage:
*     [""init"", [this, player]] call PHX_fnc_chair;
*     If using find and replace in sqm, remember to use double quotes around "init"
*/

#include "..\..\script_macros.hpp"
#define THISFNC PHX_fnc_sitDown
#define CHAIRANIM "Crew"

params [
  ["_mode", "init", [""]],
  ["_params", [], [[]]]
];


switch _mode do {

  //////////////////////////////////////////////////////////////////////////////////////////////////////////
  case "init": {

    _params params [["_chair", cursorObject, [objNull]], ["_unit", player, [objNull]]];
    _chair addAction ["Sit Down", {["sitDown", _this] call THISFNC}, [], 0, true, true, "", "!(_target getVariable [""occupied"", false]) && { isNil ""isSitting"" }", 2];

  };

  //////////////////////////////////////////////////////////////////////////////////////////////////////////
  case "sitDown": {
    if !(isNil "isSitting") exitWith {};
    isSitting = true;

    _params params [["_chair", cursorObject, [objNull]], ["_player", player, [objNull]]];

    _chair setVariable ["occupied", true, true];
    [player, CHAIRANIM] remoteExecCall ["life_fnc_animSync", RCLIENT];

    _player setPos (getPosATL _chair);
    _player setDir ((getDir _chair) - 180);
    _player setPosATL [getPosATL _player # 0, getPosATL _player # 1, (getPosATL _player # 2)];

    _player addAction ["Stand Up", {(_this # 3) params ["_chair", "_player"]; ["standUp", [_chair, _player, _this # 2]] call THISFNC}, [_chair, _player]];

  };

  /////////////////////////////////////////////////////////////////////////////////////////////////////////
  case "standUp": {

    _params params [["_chair", cursorObject, [objNull]], ["_player", player, [objNull]], ["_actionID", -1, [0]]];

    _player switchMove "";
    _player removeAction _actionID;
    _chair setVariable ["occupied", false, true];
    isSitting = nil;

  };

};
