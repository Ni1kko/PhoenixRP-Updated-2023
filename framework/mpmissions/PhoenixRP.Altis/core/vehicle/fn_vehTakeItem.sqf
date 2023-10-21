#include "..\..\script_macros.hpp"
#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
    File: fn_vehTakeItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in the vehicle trunk menu, takes the selected item and puts it in the players virtual inventory
    if the player has room.
*/

params [
    ["_mode", "Once", [""]]
];

disableSerialization;
if (isNull life_trunk_vehicle || !alive life_trunk_vehicle) exitWith {NOTIFY("The vehicle either doesn't exist or is destroyed.","red")};
if (!alive player || isDowned(player)) exitWith {closeDialog 0;};
if ((life_trunk_vehicle getVariable ["trunk_in_use_by",player]) != player) exitWith {  closeDialog 0; NOTIFY("This vehicle's trunk is in use, only one person can use it at a time.","red"); };

if ((lbCurSel 3502) isEqualTo -1) exitWith {NOTIFY("You did not select anything.","red");};
private _ctrl = ctrlSelData(3502);
if (_ctrl isEqualTo "stolen_cargo" || {_ctrl isEqualTo "petroleum"}) exitWith {NOTIFY("This item is unable to removed from the trunk!","red")};
private _num = ctrlText 3505;
if (!([_num] call LIFE_fnc_isNumber)) exitWith {NOTIFY("Invalid number format","red");};
_num = parseNumber(_num);
if (_num < 1) exitWith {NOTIFY("You can't enter anything below 1!","red");};

private _index = [_ctrl,((life_trunk_vehicle getVariable "Trunk") select 0)] call LIFE_fnc_index;
private _data = (life_trunk_vehicle getVariable "Trunk") select 0;
private _old = life_trunk_vehicle getVariable "Trunk";
if (_index isEqualTo -1) exitWith {};
private _value = _data select _index select 1;

if(_mode isEqualTo "All") then {
    _num = _value;
} else {
    _num = ctrlText 3505;
    if (!([_num] call LIFE_fnc_isNumber)) exitWith {["Invalid number format!", "red"] call PHX_fnc_notify;};
    _num = parseNumber(_num);
};

if (_num > _value) exitWith {NOTIFY("The vehicle doesn't have that many of that item.","red")};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {NOTIFY("Your inventory space is full.","red")};
private _weight = ([_ctrl] call life_fnc_itemWeight) * _num;

if ([true,_ctrl,_num] call life_fnc_handleInv) then {
    if (_num isEqualTo _value) then {
        _data deleteAt _index;
    } else {
        _data set[_index,[_ctrl,(_value - _num)]];
    };
    life_trunk_vehicle setVariable ["Trunk",[_data,(_old select 1) - _weight],true];
    [life_trunk_vehicle] call life_fnc_vehInventory;
} else {
    NOTIFY("Your inventory space is full.","red");
};
