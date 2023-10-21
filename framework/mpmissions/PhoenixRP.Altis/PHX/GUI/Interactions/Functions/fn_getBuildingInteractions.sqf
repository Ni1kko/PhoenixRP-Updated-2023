/*
	@File: fn_getBuildingInteractions.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets the interactions for buildings created through CfgMap.hpp
*/
#include "..\..\..\..\script_macros.hpp"

private _buttons = [];

if !(isNil { life_vInact_curTarget getVariable "bType" }) then {
	if ((life_vInact_curTarget getVariable "bType" ) in ["HM_Treasury_Power", "HM_Treasury_Offices", "HM_Treasury_Vaults", "HM_Prison", "Evidence_Locker"]) then {
		if (!(playerSide isEqualTo west) && { !(player getVariable ["isAdmin", false]) }) exitWith {};

		private _door = [life_vInact_curTarget] call LIFE(nearestDoor);

		if (_door > 0) then {
			if ((life_vInact_curTarget getVariable [format ["bis_disabled_Door_%1", _door], 0]) isEqualTo 0) then {
				_buttons pushBack ["Repair Door", "[life_vInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;"];
			} else {
				_buttons pushBack ["Open / Close Door", format["[life_vInact_curTarget, ""rot"", %1] call life_fnc_doorAnimate; closeDialog 0;", _door]];
			};
		};
	} else {
		if (!(playerSide isEqualTo east) && { !(player getVariable ["isAdmin", false]) }) exitWith {};
		
		private _door = [life_vInact_curTarget] call LIFE(nearestDoor);

		if (_door > 0) then {
			if ((life_vInact_curTarget getVariable [format ["bis_disabled_Door_%1", _door], 0]) isEqualTo 0) then {
				_buttons pushBack ["Repair Door", "[life_vInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;"];
			} else {
				_buttons pushBack ["Open / Close Door", format["[life_vInact_curTarget, ""rot"", %1] call life_fnc_doorAnimate; closeDialog 0;", _door]];
			};
		};
	};
};

_buttons