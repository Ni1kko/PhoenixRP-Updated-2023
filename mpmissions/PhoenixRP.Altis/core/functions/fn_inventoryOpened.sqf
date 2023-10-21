#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryOpened.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    For the mean time it blocks the player from opening another persons backpack
*/
if !(params [["_unit", objNull, [objNull]], ["_container", objNull, [objNull]], ["_sContainer", objNull, [objNull]]]) exitWith {false};

if ((FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _container,"isBackpack")) isEqualTo 1) exitWith {
    ["You are not allowed to look into someone's backpack!", "red"] spawn PHX(notify);
    true;
};

if ([_container, ["LandVehicle", "Ship", "Air"]] call PHX(isKindOf)) exitWith {
    if (!(_container in life_vehicles) && (locked _container isEqualTo 2)) exitWith {
        ["You are not allowed to access this vehicle while its locked.", "red"] spawn PHX(notify);
        true;
    };

    if ((isRestrained(player)) || {(player getVariable ["playerSurrender", false])}) exitWith {
        ["You can't access vehicle stored while restrained, ziptied or surrendered", "red"] spawn PHX(notify);
        true;
    };
};

if (_container isKindOf "Man" && {!alive _container}) exitWith {
    ["You are not allowed to loot dead bodies.", "red"] spawn PHX(notify);
    true;
};

if ((vehicleVarName _container) isEqualTo "evidence_locker" && { !(player getVariable ["isAdmin", false]) }) exitWith {
    if !(((evidence_locker getVariable ["state", [false, false]]) select 0)) exitWith {
        ["You must first hack and disable the vaults security before accessing it...", "red"] spawn PHX(notify);
        true;
    };
};

if ((vehicleVarName _container) isEqualTo "hav_armoury" && { !(player getVariable ["isAdmin", false]) }) exitWith {
    if !(((hav_armoury getVariable ["state", [false, false]]) select 1)) exitWith {
        ["You must use an Industrial Drill to break into the vault!", "red"] spawn PHX(notify);
        true;
    };
};