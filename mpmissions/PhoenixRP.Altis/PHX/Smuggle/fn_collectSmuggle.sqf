/*
*   @File: fn_collectSmuggle.sqf
*   @Author: Zyn
*   @Description: Smuggle collection
*/

#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgSmuggle" >> worldName

params [
  ["_stand", cursorObject, [objNull]],
  ["_caller", player, [objNull]],
  ["_actionID", -1, [0]],
  ["_params", [], []]
];

_params params [
	["_location","",[""]]
];

//--- Fills the trunk
private _vehicles = (nearestObjects[getPosATL _stand,["Ship","Submarine"],70]);
if (_vehicles isEqualTo []) exitWith {NOTIFY("The boat must be the nearest to the sign and in your keychain!","red")};

private _index = life_vehicles find (_vehicles select 0);
private _vehicle = life_vehicles select _index;
private _trunk = _vehicle getVariable ["Trunk",[[],0]];
private _weight = ([_vehicle] call life_fnc_vehicleWeight);
private _space = (_weight select 0) - (_weight select 1);

private _amount = floor(_space / (ITEM_WEIGHT("stolen_cargo")));
if (_amount isEqualTo 0) exitWith {NOTIFY("There is no space in the vehicle!","red")};
if (_vehicle getVariable ["trunk_in_use",false]) exitWith {NOTIFY("The trunk is in use!","red")};

life_action_inUse = true;
_vehicle setVariable ["trunk_in_use",true,true];

if !(
    [
        (format["Loading %1 with cargo",([(typeOf(_vehicle))] call life_fnc_fetchVehInfo) select 3]),
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

private _inv = (_trunk select 0);
private _index = (["stolen_cargo",(_trunk select 0)] call LIFE_fnc_index);
if (_index isEqualTo -1) then {
	_inv pushBack ["stolen_cargo",_amount];
} else {
	_val = _inv select _index select 1;
	_inv set [_index,["stolen_cargo",_val + _amount]];
};

_vehicle setVariable ["Trunk",[_inv,(_trunk select 1) + _space],true];

life_action_inUse = false;
_vehicle setVariable ["trunk_in_use",false,true];

PHX_smuggleDest = selectRandom (getArray(CFG >> "Collect" >> _location >> "locations"));
private _dest = getText(CFG >> "Deliver" >> PHX_smuggleDest >> "name");

life_cur_task = player createSimpleTask [PHX_smuggleDest];
life_cur_task setSimpleTaskDescription [format ["You are to smuggle the contents of the %1 to %2.",(([(typeOf(_vehicle))] call life_fnc_fetchVehInfo) select 3),_dest],"Smuggle Cargo",""];
life_cur_task setTaskState "Assigned";
life_cur_task setSimpleTaskDestination getPos (call compile PHX_smuggleDest);
player setCurrentTask life_cur_task;

[format ["You are to smuggle the contents of the %1 to %2.",(([(typeOf(_vehicle))] call life_fnc_fetchVehInfo) select 3),_dest],"cyan"] call PHX_fnc_notify;