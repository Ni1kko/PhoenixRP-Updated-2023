/*
*   @File: fn_collectPetrol.sqf
*   @Author: Zyn
*   @Description: Petrol collection
*/

#include "..\..\script_macros.hpp"

params [
  ["_vehicle", "", [""]]
];

_vehicle = call compile _vehicle;
private _position = position player;
private _trunk = _vehicle getVariable ["Trunk",[[],0]];
private _space = ([(typeOf(_vehicle))] call life_fnc_vehicleWeightCfg) - (_trunk select 1);

private _amount = floor(_space / (ITEM_WEIGHT("petroleum")));
if (_amount isEqualTo 0) exitWith {NOTIFY("There is no space in the vehicle!","red")};
if (_vehicle getVariable ["trunk_in_use",false]) exitWith {NOTIFY("The trunk is in use!","red")};

life_action_inUse = true;
_vehicle setVariable ["trunk_in_use",true,true];

if !(
    [
        (format["Pumping %1 with petroleum",([(typeOf(_vehicle))] call life_fnc_fetchVehInfo) select 3]),
        120,
        [
            "player distance (_this select 0) < 10", 
            [_position], true, 
            "['You must remain within 10m of the sign','red'] call PHX_fnc_notify;"
        ],
        0.01,
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; _vehicle setVariable ["trunk_in_use",false,true]; };

private _inv = (_trunk select 0);
private _index = (["petroleum",(_trunk select 0)] call LIFE_fnc_index);
if (_index isEqualTo -1) then {
	_inv pushBack ["petroleum",_amount];
} else {
	_val = _inv select _index select 1;
	_inv set [_index,["petroleum",_val + _amount]];
};

_vehicle setVariable ["Trunk",[_inv,(_trunk select 1) + _space],true];

life_action_inUse = false;
_vehicle setVariable ["trunk_in_use",false,true];

PHX_petrolDest = selectRandom (LIFE_SETTINGS(getArray,"petrol_stations"));
PHX_petrolVeh = _vehicle;
private _name = markerText PHX_petrolDest;

life_cur_task = player createSimpleTask ["Petroleum Delivery"];
life_cur_task setSimpleTaskDescription [format ["You are to deliver the petroleum to %1.",_name],"Deliver Petroleum",""];
life_cur_task setTaskState "Assigned";
life_cur_task setSimpleTaskDestination getMarkerPos PHX_petrolDest;
player setCurrentTask life_cur_task;

[format ["You are to deliver the petrol to %1.",_name],"cyan"] call PHX_fnc_notify;