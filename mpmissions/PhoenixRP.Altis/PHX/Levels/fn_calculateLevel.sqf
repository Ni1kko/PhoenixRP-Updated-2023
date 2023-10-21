/*
	@File: fn_calculateLevel.sqf
	@Author: Zyn
	@Description: Calculates the level and XP when XP is given
*/
#include "..\..\script_macros.hpp"
params [
	["_xp", 0, [0]]
];

private _level = PHX_Level;
private _loop = true;
private _required = 0;

while {_loop} do {
	_required = (getNumber(missionConfigFile >> "CfgLevels" >> format["level_%1", _level] >> "expRequired"));

	if (_required < _xp) then {
		_xp = _xp - _required;
		_level = _level + 1;
	} else {
		_loop = false;
	};
};

[_level,_xp]