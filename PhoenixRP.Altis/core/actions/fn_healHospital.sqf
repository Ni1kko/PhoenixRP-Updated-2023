#include "..\..\script_macros.hpp"
/*
    File: fn_healHospital.sqf
    Author: Bryan "Tonic" Boardwine
    Reworked: Jesse "TKCJesse" Schultz

    Description:
    Prompts user with a confirmation dialog to heal themselves.
    Used at the hospitals to restore health to full.
    Note: Dialog helps stop a few issues regarding money loss.
*/

if (life_action_inUse) exitWith {};
if ((damage player) < 0.01) exitWith {NOTIFY("You do not need to receive first aid!","red")};
private _healCost = LIFE_SETTINGS(getNumber,"hospital_heal_fee");
if (HAS_PERK("medicalCover")) then { _healCost = _healCost  * 0.7 };
if (CASH < _healCost) exitWith {[format ["You do not have £%1 to receive first aid.",[_healCost] call life_fnc_numberText],"red"] call PHX_fnc_notify;};

private _action = [
    format ["Spend £%1 to recieve first aid?",[_healCost] call life_fnc_numberText],
    "Doctor",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;

life_action_inUse = true;

if !(_action) exitWith {NOTIFY("Action cancelled","red"); life_action_inUse = false;};

if !(
    [
        "Receiving Medical Attention",
        10,
        [
            "player distance (_this select 0) < 10", 
            [(_this select 0)], true, 
            "[""You must remain within 10m of the processor!"",""red""] call PHX_fnc_notify;"
        ],
         0.01,
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

NOTIFY("You are now fully healed!","green");
player setDamage 0;
[_healCost, 1, 0, "Hospital Fee"] call PHX(handleMoney);
[player, format ["%1 (%2) fulled healed at a hospital for %3",profileName,getPlayerUID player,[_healCost] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
life_action_inUse = false;