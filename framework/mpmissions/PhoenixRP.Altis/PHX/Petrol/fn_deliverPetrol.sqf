/*
*   @File: fn_deliverPetrol.sqf
*   @Author: Zyn
*   @Description: Deliver petrol
*/

#include "..\..\script_macros.hpp"

params [
  ["_stand", cursorObject, [objNull]],
  ["_caller", player, [objNull]],
  ["_actionID", -1, [0]]
];

if ((PHX_petrolVeh distance (getMarkerPos PHX_petrolDest)) > 30) exitWith {NOTIFY("You are not close enough to the pump!","red")};

private _vehicle = PHX_petrolVeh;
private _trunk = _vehicle getVariable ["Trunk",[[],0]];

if (_vehicle getVariable ["trunk_in_use",false]) exitWith {NOTIFY("The trunk is in use!","red")};
life_action_inUse = true;
_vehicle setVariable ["trunk_in_use",true,true];

if !(
    [
        "Pumping petroleum",
        120,
        [
            "player distance (_this select 0) < 10", 
            [_caller], true, 
            "['You must remain within 10m of the sign','red'] call PHX_fnc_notify;"
        ],
        0.01,
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; _vehicle setVariable ["trunk_in_use",false,true]; };

life_action_inUse = false;
_vehicle setVariable ["trunk_in_use",false,true];

private _num = (_trunk select 0) select (["petroleum",(_trunk select 0)] call LIFE_fnc_index) select 1;
private _weight = (["petroleum"] call life_fnc_itemWeight) * _num;
(_trunk select 0) deleteAt (["petroleum",(_trunk select 0)] call LIFE_fnc_index);

//--- Refresh the variable
_trunk = _vehicle getVariable ["Trunk",[[],0]];
_vehicle setVariable ["Trunk",[(_trunk select 0),(_trunk select 1) - _weight],true];

private _price = ((_num * (ITEM_SELLPRICE("petroleum"))) * ((player distance getMarkerPos "oil_reserve") / 10000));

[_price, 0, 0, "Delivered Petroleum"] call PHX(handleMoney);
[(format["You have received £%1 for delivering the petroleum!",[_price] call life_fnc_numberText]),"green"] call PHX_fnc_notify;

[player, format ["%1 (%2) delivered petroleum and received %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_price] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
PHX_petrolDest = nil;
PHX_petrolVeh = nil;