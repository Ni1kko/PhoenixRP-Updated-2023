/*
*   @File: fn_collectSmuggle.sqf
*   @Author: Zyn
*   @Description: Smuggle collection
*/

#include "..\..\script_macros.hpp"

params [
  ["_stand", cursorObject, [objNull]],
  ["_caller", player, [objNull]],
  ["_actionID", -1, [0]],
  ["_params", [], []]
];

_params params [
	["_location","",[""]]
];

if !(isNil "PHX_smuggleDest" || {_location isEqualTo PHX_smuggleDest}) exitWith {NOTIFY("You are at the wrong location!","red")};

private _vehicles = (nearestObjects[getPosATL _stand,["Ship","Submarine"],70]);
if (_vehicles isEqualTo []) exitWith {NOTIFY("The boat must be the nearest to the sign!","red")};

private _index = life_vehicles find (_vehicles select 0);
private _vehicle = life_vehicles select _index;
private _trunk = _vehicle getVariable ["Trunk",[[],0]];

if (_vehicle getVariable ["trunk_in_use",false]) exitWith {NOTIFY("The trunk is in use!","red")};
life_action_inUse = true;
_vehicle setVariable ["trunk_in_use",true,true];
private _level = PROF_LVL("Prof_Smuggling");

if !(
    [
        (format["Unloading cargo from %1",([(typeOf(_vehicle))] call life_fnc_fetchVehInfo) select 3]),
        120,
        [
            "player distance (_this select 0) < 10", 
            [_caller], true, 
            "['You must remain within 10m of the sign','red'] call PHX_fnc_notify;"
        ],
        ([0.01,(0.01 + (_level / 2500))] select (_level > 0)),
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; _vehicle setVariable ["trunk_in_use",false,true]; };

life_action_inUse = false;
_vehicle setVariable ["trunk_in_use",false,true];

private _num = (_trunk select 0) select (["stolen_cargo",(_trunk select 0)] call LIFE_fnc_index) select 1;
private _weight = (["stolen_cargo"] call life_fnc_itemWeight) * _num;
(_trunk select 0) deleteAt (["stolen_cargo",(_trunk select 0)] call LIFE_fnc_index);

//--- Refresh the variable
_trunk = _vehicle getVariable ["Trunk",[[],0]];
_vehicle setVariable ["Trunk",[(_trunk select 0),(_trunk select 1) - _weight],true];

private _price = (_num * (ITEM_SELLPRICE("stolen_cargo")));

if ((ONLINE(call compile(getText(missionConfigFile >> "CfgSmuggle" >> worldName >> "Deliver" >> PHX_smuggleDest >> "side")))) < 5) then {
    _price = _price * 0.75;
};

[_price, 0, 0, "Delivered Cargo"] call PHX(handleMoney);
[(format["You have received £%1 for delivering the cargo!",[_price] call life_fnc_numberText]),"green"] call PHX_fnc_notify;
["Prof_Smuggling",1,50] call PHX(increaseProfession);

[player, format ["%1 (%2) delivered cargo for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_price] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
PHX_smuggleDest = nil;