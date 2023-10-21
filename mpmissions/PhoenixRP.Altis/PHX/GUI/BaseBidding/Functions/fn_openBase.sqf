/*
	@File: fn_openBase.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens the base bidding...
*/
#include "..\..\..\..\script_macros.hpp"
if !(params[["_bid", [], [[]]],["_base", "", [""]]]) exitWith {};

if !(playerSide isEqualTo civilian) exitWith {};
if !(PHX_isWaring) exitWith { ["Base Wars must be active before you can bid on one..."] spawn PHX(notify) };
if (isNil {grpPlayer getVariable "gang_owner"}) exitWith { ["You must be in a gang to bid on a gang base"] spawn PHX(notify) };
if (dialog) exitWith {};

disableSerialization;

createDialog "RscBase";

private _display = findDisplay 13000;
if (isNull _display) exitWith {};

ctrlSetText[13001, format["%1's Bidding", _base]];

BASENAME = _base;
BASEID = -2;
BASEVAL = (LIFE_SETTINGS(getArray,"bidLimits") select 0);

if !(_bid isEqualTo []) then {
	BASEID = _bid select 0;
	BASEVAL = _bid select 1;
};

(_display displayCtrl 13002) ctrlSetStructuredText parseText format["<t align='center' size='1.5' color='#8cff9b'>£%1</t>", [BASEVAL] call LIFE(numberText)];