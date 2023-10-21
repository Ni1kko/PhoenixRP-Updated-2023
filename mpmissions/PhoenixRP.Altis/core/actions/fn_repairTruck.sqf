#include "..\..\script_macros.hpp"
/*
    File: fn_repairTruck.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main functionality for toolkits, to be revised in later version.
*/
private _veh = cursorObject;

if (isNull _veh || { !(alive _veh) }) exitWith {};
if !((_veh isKindOf "Car") || {(_veh isKindOf "Ship")} || {(_veh isKindOf "Air")}) exitWith { NOTIFY("You can't repair this type of vehicle!","red") };

private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _veh),"displayName");

if (!("ToolKit" in (items player)) && { !("ToolKit" in (itemCargo _veh)) }) exitWith { ["You require a toolkit to repair a vehicle", "red"] spawn PHX(notify) };

private _title = format ["Repairing %1",_displayName];
private _level = PROF_LVL("Prof_Repairing");
private _wasDamaged = (((selectMax ((getAllHitPointsDamage _veh) select 2))) > 0.01);

life_action_inUse = true;

if !(
    [
        _title,
        27,
        [
            "player distance (_this select 0) < 10", 
            [_veh], true, 
            "['You must remain within 10m of the vehicle at all times','red'] call PHX_fnc_notify;"
        ],
        ([0.01,(0.01 + (_level / 10000))] select (_level > 0))
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

if (!("ToolKit" in (items player)) && { !("ToolKit" in (itemCargo _veh)) }) exitWith { ["You require a toolkit to repair a vehicle", "red"] spawn PHX(notify) };

if !(HAS_PERK("generalMechanic")) then {
    player removeItem "ToolKit";
};

_veh setDamage 0;
[format["You successfully repaired the %1",_displayName],"green"] call PHX_fnc_notify;

if (_wasDamaged) then {
    [50,"Repaired a vehicle"] call PHX_fnc_handleXP;
    ["Prof_Repairing", 1, 50] call PHX(increaseProfession);
};

life_action_inUse = false;