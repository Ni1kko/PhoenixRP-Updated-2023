/*
	@File: fn_administerBlood.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Administers blood...
*/
#include "..\..\script_macros.hpp"
if !(params [["_unit", objNull, [objNull]]]) exitWith {};

if (isNull _unit) exitWith {};
if !(isDowned(_unit)) exitWith { NOTIFY("You can only administer blood to injured players","red") };
if (player distance _unit > 5) exitWith { NOTIFY("You are not close enough to the injured player","red") };
if (dialog) then { closeDialog 0 };

life_interrupted = false;
life_action_inUse = true;

//Setup our progress bar.
if !(
    [
        format ["Administering Blood to %1...", _unit getVariable ["realname", name _unit]],
        27,
        [
            "player distance (_this select 0) < 5 || { (_this select 0) getVariable [""isIncapacitated"", false] }", 
            [_unit], true, 
            "[""You must remain within 5 of the target or the target has been revived..."",""red""] call PHX_fnc_notify;"
        ]
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

[false,"blood_bag",1] call LIFE(handleInv); // Take the blood bag...
life_action_inUse = false;

[format["You've administered blood to %1", (_unit getVariable ["realname", name _unit])],"green"] call PHX_fnc_notify;

[player,(HAS_PERK("medicalStudent"))] remoteExecCall ["PHX_fnc_bloodAdministered", _unit]; // Tell the injured person they've recieved some blood...