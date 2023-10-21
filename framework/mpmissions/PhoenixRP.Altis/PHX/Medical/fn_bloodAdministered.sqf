/*
	@File: fn_bloodAdministered.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Tells us that someone has administered blood and that now we'll take longer to bleedout...
*/
#include "..\..\script_macros.hpp"
if !(params [["_helper", objNull, [objNull]],["_perk", false, [true]]]) exitWith {};

if !(isDowned(player)) exitWith {}; // How'd this even happen?

private _increase = 150;
if (_perk) then { _increase  = _increase * 2 };

[format ["%1 has administered blood extending the time you'll take to bleed out by %2 seconds...", (_helper getVariable ["realname", name _helper]),_increase],"green"] call PHX_fnc_notify;

PHX_endTime = PHX_endTime + _increase; //  Add the increase to our bleedout timer...