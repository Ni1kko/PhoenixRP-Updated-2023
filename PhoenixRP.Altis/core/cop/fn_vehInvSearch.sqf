/*
    File: fn_vehInvSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the vehicle for illegal items.
*/

#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgItems"

params [
    ["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle || {!(_vehicle isKindOf "AllVehicles")}) exitWith {};

private _displayName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

life_action_inUse = true;

if !(
    [
        format["Searching %1",_displayName],
        60,
        [
            "player distance (_this select 0) < 10", 
            [_vehicle], true, 
            "[""You must remain within 10m of the vehicle"",""red""] call PHX_fnc_notify;"
        ],
        0.01,
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

private _vehicleInfo = _vehicle getVariable ["Trunk",[]];
if (count _vehicleInfo isEqualTo 0) exitWith {NOTIFY("This vehicle is empty!","red")};

private _value = 0;
private _price = 0;
private _half = 0;

{
    _x params [
        ["_var","",[""]],
        ["_val",0,[0]]
    ];

    if (ITEM_ILLEGAL(_var)) then {

        _price = getNumber(CFG >> _var >> "sellPrice");

        if (_price isEqualTo -1) then {
            if (isClass (CFG >> _var >> "processedItem")) then {
                _half = getText(CFG >> _var >> "processedItem");
                _price = getNumber(CFG >> _half >> "sellPrice");
            } else {
                _price = 0
            };
        };
        
        _value = _value + (round(_val * _price));
    };
} forEach (_vehicleInfo select 0);

if (_value > 0) then {
    [0,format["%1 has seized £%4 worth of contraband from %2's %3",player getVariable ["realname",name player],((_vehicle getVariable ["vehicle_info_owners", []]) select 0 select 1),_displayName,[_value] call life_fnc_numberText],false] remoteExecCall ["life_fnc_broadcast",RCLIENT];
    [round(_value * 0.1), 0, 1, "Contraband Seizure Reward"] call PHX(handleMoney);
    [player, format ["%1 (%2) seized contraband from %3 (%4) vehicle and was given %5",profileName,getPlayerUID player,((_vehicle getVariable ["vehicle_info_owners", []]) select 0 select 1),((_vehicle getVariable ["vehicle_info_owners", []]) select 0 select 0),[_value] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    _vehicle setVariable ["Trunk",[[],0],true];
} else {
    NOTIFY("Nothing illegal has been found in this this vehicle","cyan");
};