/**
 * @File: fn_alliedUnits.sqf
 * @Author: Sig
 * ----------------------------------
 * Description: Retrieves the allied units to the passed player
 */
#include "..\..\script_macros.hpp"
params [["_player", player, [objNull]], ["_unitsList", playableUnits, [[]]]];

private _units = units (group _player);
private _allies = ((group _player) getVariable ["gang_allies", []]) apply {_x # 1};

if (isCID(_player)) then { _units append (_unitsList select {side _x isEqualTo west}) }; // If MI5 then add Police...
if (isHSS(_player)) then { _units append (_unitsList select {side _x isEqualTo east}) }; // If HSS then add HAVOC...

_unitsList select {((((group _x) getVariable ["gang_id", -1]) in _allies) || {(_x in _units)}) && !(_x getVariable ["isAdmin",false])}