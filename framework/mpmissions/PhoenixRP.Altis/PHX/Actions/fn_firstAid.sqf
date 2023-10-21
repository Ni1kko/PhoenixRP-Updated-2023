/*
 *  @File: fn_firstAid.sqf
 *  @Author: Zyn
 *
 *  Description:
 *  Handles the heal action
*/

#include "..\..\script_macros.hpp"

private _type = switch true do {
	case (life_inv_firstaidkit_virtual > 0): {"firstaidkit_virtual"};
	case (life_inv_medikit_virtual > 0): {"medikit_virtual"};
	default {false};
};

if (!(vehicle player isEqualTo player) || {!(_type isEqualType "")}) exitWith {};
_cursorTarget = cursorTarget;

//--- (_this select 3) is the parameter from setupActions (only 1 passed)
private _player = [player,cursorTarget] select (_this select 3);

//--- Gets the amount to heal
private _amount = switch true do {
	case (HAS_PERK("firstAider")): {0};
	case (_type isEqualTo "medikit_virtual"): {0};
	default {.25};
};

_amount = [_amount,(damage _player)] select ((damage _player) <= _amount);

life_action_inUse = true;

private _state = switch true do {
	case !(_player isEqualTo player): {"AinvPknlMstpSlayWnonDnon_medicother"};
	case (stance player isEqualTo "PRONE"): {"ainvppnemstpslaywrfldnon_medic"};
	default {"AinvPknlMstpSlayWnonDnon_medic"};
};

waitUntil {!isNil "_state"};
player playMoveNow _state;

if !(
    [
        ["Healing Person","Healing"] select (player isEqualTo _player),
        7,
        [
            "!((inputAction 'GetOver') isEqualTo 1)"
        ],
		0.01,
		""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; player switchMove (["amovpknlmstpsnonwnondnon","amovppnemstpsnonwnondnon"] select (_state isEqualTo "ainvppnemstpslaywrfldnon_medic")); };

//--- Sets the health
_player setDamage _amount;
life_action_inUse = false;

{
    _player setHitPointDamage [_x, _amount];
} forEach ["hitHead","hitBody","hitHands","hitLegs"];

if (_type isEqualTo "firstaidkit_virtual") then {
	([false,_type,1] call life_fnc_handleInv);
};