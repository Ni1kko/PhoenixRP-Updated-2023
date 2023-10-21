/*
    File: fn_impoundAction.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Impounds the vehicle
*/
#include "..\..\script_macros.hpp"

if !(params [["_vehicle", objNull, [objNull]]]) exitWith {};

private _filters = ["AllVehicles"];

if !([_vehicle,_filters] call PHX(isKindOf)) exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {NOTIFY("This vehicle is NPC protected","red")};

private _vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo []) exitWith {deleteVehicle _vehicle};
private _vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
private _price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");
[0,format["%1 your %2 is being impounded.", ((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
life_action_inUse = true;

private _level = PROF_LVL("Prof_Impounding");
private _time = 9;
if (player getVariable["isAdmin", false]) then { _time = 0 };

if !(
    [
        "Impounding Vehicle",
        _time,
        [
            "player distance (_this select 0) < 10", 
            [_vehicle], true, 
            "['You must remain within 10m of the vehicle at all times','red'] call PHX_fnc_notify;"
        ],
        ([0.01,(0.01 + (_level / 2500))] select (_level > 0)),
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

if ((crew _vehicle) isEqualTo [] || { _vehicle isKindOf "B_UAV_01_F" }) then {
    if !([_vehicle, _filters] call PHX(isKindOf)) exitWith { life_action_inUse = false };
    private _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

    life_impound_inuse = true;
    [_vehicle,true,player] remoteExecCall (["fnc_vehicleStore","TON"] call SOCK_fnc_getRemoteDestination);

    waitUntil {!life_impound_inuse};
    if (playerSide isEqualTo west || playerSide isEqualTo independent) then {
        private _value = LIFE_SETTINGS(getNumber,"vehicle_impound_price");
        if (HAS_PERK("paidCleaner")) then {_value = _value * 1.3;};
        [0, format["%2 your %3 has been impounded.", profileName,((_vehicleData select 0) select 1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        [player, format ["%1 (%2) impounded a %4 owned by %3.", player getVariable "realname", getPlayerUID player, ((_vehicleData select 0) select 1), _vehicleName], ["https://rcon.phoenixrp.co.uk/api/v1/log/police", "https://rcon.phoenixrp.co.uk/api/v1/log/medic"] select (playerSide isEqualTo independent)] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
        if (_vehicle getVariable ["isAPC",false] && playerSide isEqualTo west || {_vehicle getVariable ["isNHS",false] && playerSide isEqualTo independent}) then {
            [(format ["You were paid nothing for impounding your own vehicle %1.", _type]),"red"] call PHX_fnc_notify;
        } else {
            [(format ["You have impounded a %1. You have received £%2 for cleaning up the streets!",_type,[_value] call life_fnc_numberText]),"green"] call PHX_fnc_notify;
            [_value, 0, 1, (format["Impounded a %1",_type])] call PHX(handleMoney);
            [player, format ["%1 (%2) impounded a vehicle for %3",profileName,getPlayerUID player,[_value] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
            ["Prof_Impounding",1,50] call PHX(increaseProfession);
        };
    };
} else {
    NOTIFY("Impounding has been cancelled","red");
};

life_action_inUse = false;
