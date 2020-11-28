#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopSell.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Sells the selected vehicle off.
*/
disableSerialization;
private _control = CONTROL(39400,39402);
private _price = _control lbValue (lbCurSel _control);
private _vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
private _nearVehicles = nearestObjects [getMarkerPos life_chopShop,["AllVehicles"],25];
_vehicle = (_nearVehicles select _vehicle);
private _displayName = FETCH_CONFIG2(getText,"CfgVehicles",typeOf _vehicle, "displayName");
private _vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (isNull _vehicle || {life_action_inUse}) exitWith {};

//--- Checking if the vehicle is a rental
private _vInfo = _vehicle getVariable["dbInfo",[]];
if ((_vInfo isEqualTo []) && { !(_vehicle getVariable ["isAPC",false]) } && { !(_vehicle getVariable ["isHAV",false]) }) exitWith {
    ["That vehicle is a rental and cannot be stored in your garage","red"] call PHX_fnc_notify;
};

if ((time - life_action_delay) < 5) exitWith {["Action Cancelled.", "red"] call PHX_fnc_notify;};
life_action_delay = time;

life_action_inUse = true;
closeDialog 0;

private _time = 300;
_time = _time * (1 + (((_vehicle getVariable ["vehicle_upgrades",[]]) select 2) / 100));

if !(
    [
        format["Chopping %1",_displayName],
        _time,
        [
            "player distance (_this select 0) < 15 && (alive (_this select 0))", 
            [_vehicle], true, 
            "[""You must remain within 15m of the sign at all times"",""red""] call PHX_fnc_notify;"
        ],
        0.01,
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

life_action_inUse = false;

private _chance = [0,20] select (HAS_PERK("uncertainPersonality"));

if ((floor (random 100)) <= _chance && { !(_vehicle getVariable ["isAPC",false]) && !(_vehicle getVariable ["isHAV",false]) }) then {
    private _action = [
        format ["Do you want to keep the %1 or do you want to sell the %1? If you choose to keep it, the vehicle will be added straight to your garage. If you choose sell, we will scrap the vehicle and give you %2",_displayName,_price],
         "Chop Shop",
         "Keep",
         "Sell"
    ] call PHX_fnc_confirmBox;

    if (_action) then {

        [format["You have stolen a %1! The vehicle has been added to your garage!",_displayName],"green"] call PHX_fnc_notify;
        [player,_vehicle] remoteExecCall ["TON_fnc_chopShopSteal",RSERV];
        [((_vehicleData select 0) select 0), (getPlayerUID player), (_vInfo select 2)] remoteExecCall (["fnc_changeOwner", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
        _vehicle setVariable ["dbInfo",[(STEAMID),(_vInfo select 1),(_vInfo select 2)],true];
        [player, format ["%1 (%2) - Has stolen (%7) %6's %3",profileName,(getPlayerUID player),_displayName,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText,((_vehicleData select 0) select 1),((_vehicleData select 0) select 0)], "https://rcon.phoenixrp.co.uk/api/v1/log/vehicle"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    
    } else {

        [format["You have chopped %2 for £%1",[_price] call life_fnc_numberText,_displayName],"green"] call PHX_fnc_notify;
        [_vehicle,_price] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
        [player, format ["%1 (%2) - chopped (%7) %6's %3 for %4 on hand cash(pre-chop): %5",profileName,(getPlayerUID player),_displayName,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText,((_vehicleData select 0) select 1),((_vehicleData select 0) select 0)], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
        [_price,0,0, (format["Chopped a %1",_displayName])] call PHX_fnc_handleMoney;
    };

} else {

    [format["You have chopped %2 for £%1",[_price] call life_fnc_numberText,_displayName],"green"] call PHX_fnc_notify;
    [_vehicle,_price] remoteExecCall ["TON_fnc_chopShopSell",RSERV];
    [player, format ["%1 (%2) - chopped (%7) %6's %3 for %4 On Hand Cash(pre-chop): %5",profileName,(getPlayerUID player),_displayName,[_price] call life_fnc_numberText,[CASH] call life_fnc_numberText,((_vehicleData select 0) select 1),((_vehicleData select 0) select 0)], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    [_price,0,0,(format["Chopped a %1",_displayName])] call PHX_fnc_handleMoney;
};

life_action_inUse = false;
closeDialog 0;