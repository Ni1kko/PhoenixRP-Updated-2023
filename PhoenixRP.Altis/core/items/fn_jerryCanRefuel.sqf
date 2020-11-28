#include "..\..\script_macros.hpp"
/*
    File: fn_jerryCanRefuel.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Jesse "tkcjesse" Schultz

    Description:
    Refuels the empty fuel canister at a gas pump. Based off the jerryRefuel/lockpick scripts by Tonic.
*/

life_interrupted = false;

if (life_inv_fuelEmpty isEqualTo 0 || {life_action_inUse} || {!(isNull objectParent player)}) exitWith {};
if (count(nearestObjects [player,["Land_FuelStation_Feed_F","Land_fs_feed_F"],3.5]) isEqualTo 0) exitWith { NOTIFY("You must be closer to the fuel pump!","red");};
if (isRestrained(player)) exitWith {NOTIFY("You cannot do this while you are restrained.","red");};
if (player getVariable "playerSurrender") exitWith {NOTIFY("You cannot do this while you are surrendered.","red");};
private _fuelCost = LIFE_SETTINGS(getNumber,"fuelCan_refuel");

life_action_inUse = true;

private _action = [
    format ["Spend £%1 to refuel your empty fuel canister?",[_fuelCost] call life_fnc_numberText],
    "Fuel Station Pump",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;

if (_action) then {

    if (CASH < _fuelCost) exitWith {NOTIFY("You don't have that much money!","red"); life_action_inUse = false;};

        if !(
            [
                "Refuelling Fuel Canister...",
                20
            ] call PHX(handleProgress)
        ) exitWith { life_action_inUse = false; };

        if (!([false,"fuelEmpty",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

        [_fuelCost, 1, 0, "Purchased Fuel"] call PHX(handleMoney);
        [player, format ["%1 (%2) paid %3 for fuel.",profileName,getPlayerUID player,[_fuelCost] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
        [true,"fuelFull",1] call life_fnc_handleInv;
        NOTIFY("You have successfully refuelled the fuel canister!","green");
        
} else {
    NOTIFY("Action Cancelled.","red");
    closeDialog 0;
};

life_action_inUse = false;