/*
	@File: fn_handlePrgoress.sqf
  
	@Author: Jack "Scarso" Farhall
	@Credit: Sig - Based upon his script...
  
	@Description: Handles our progress bar...
*/
scopeName "progressBar";
#include "..\..\..\..\script_macros.hpp"
params [
	["_text", "Preforming Unknown Action...", [""]],
	["_time", 30, [0]],
	["_customConditions", [], [[]]],
	["_increase", 0.01, [0]],
	["_animation", "AinvPknlMstpSnonWnonDnon_medic_1", [""]],
	["_progress", 0, [0]],
	["_inVehicle", false, [true]]
];

_customConditions params [
  ["_condition", "true", ["", {}]],
  ["_params", [], []],
  ["_dontMove", true, [false]],
  ["_failAction", "", ["", {}]]
];

if (_condition isEqualType "") then { _condition = compile _condition };
if (_failAction isEqualType "") then { _failAction = compile _failAction };

disableSerialization;

life_interrupted = false;
PHX_isInterruptable = true;
private _ret = false;

"progressBar" cutRsc ["life_progress","PLAIN"];
private _ui = uiNamespace getVariable "life_progress";
(_ui displayCtrl 38202) ctrlSetText format ["%1", _text];

for "_i" from 0 to 1 step 0 do {
	if (_progress >= 1) exitWith {_ret = true};
	if ([true, _dontMove, _inVehicle] call PHX(canUse)) exitWith {NOTIFY("Action cancelled","red")};
	if !(_params call _condition) exitWith {[] call _failAction};

	if (animationState player != _animation && {!(_animation isEqualTo "")}) then {
		[player, _animation, true] remoteExecCall ["life_fnc_animSync", RCLIENT];
		if (_animation isEqualTo "AinvPknlMstpSnonWnonDnon_medic_1") then {
			player switchMove _animation;
		};
		player playMove _animation;
	};

	_progress = _progress + _increase;
	if (_progress >= 1) then { _progress = 1 };
	
	(_ui displayCtrl 38201) progressSetPosition _progress;
	(_ui displayCtrl 38203) ctrlSetText format ["%1%2",floor(_progress * 100),"%"];

	uiSleep (_time / 100);
};

"progressBar" cutText ["","PLAIN"];

PHX_isInterruptable = false;
life_interrupted = false;
	
if !(_animation isEqualTo "") then {
	player playActionNow "stop";
};

_ret