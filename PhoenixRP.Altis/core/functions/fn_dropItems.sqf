/*
    File: fn_dropItems.sqf
    Author: Bryan "Tonic" Boardwine

    Editor: Jack "Scarso" Farhall (Changed: All vItems are grouped into a sack, hehe sack...)
    
    Description:
    Called on death, player drops any 'virtual' items they may be carrying.
*/
#include "..\..\script_macros.hpp"
if !(params [
    ["_unit", objNull, [objNull]],
    ["_pos", (getPos _unit), [[]]]
]) exitWith {false};

private _allItems = []; // We'll add all the items we have here then just use the code tonic uses for vehicle trunks cuz lazy.
private _totalWeight = 0; // Total weight of our vItems

// First we'll do the item bag. Money can be done after...
{
    private _item = if !(_x isEqualType "") then {configName _x} else {_x};
    private _value = ITEM_VALUE(_item);
    private _itemName = ITEM_VARNAME(_item);

    if (_value > 0) then {
        _weight = ([_itemName] call life_fnc_itemWeight) * _value;
        
        _allItems pushBack [_item, _value]; // Save the var as well as how many we had
        missionNamespace setVariable[_itemName,0];
        _totalWeight = _totalWeight + _weight;

    };
} forEach (("true" configClasses (missionConfigFile >> "CfgItems")));

life_carryWeight = 0;

// Now we actually create the bag...
if(count(_allItems) > 0) then {
    private _obj = "Land_Bodybag_01_black_F" createVehicle _pos;
    [_obj] remoteExecCall ["life_fnc_simDisable", RCLIENT];
    _obj setDir (getDir _unit);
    _obj setVehiclePosition [_pos, [], 0, "CAN_COLLIDE"];
    _obj allowDamage false;
    _obj setVariable["Trunk",[_allItems,_totalWeight],true];
};

// NOW we create the money pile
if (CASH > 0) then {
    private _obj = "Land_Money_F" createVehicle _pos;
    [_obj] remoteExecCall ["life_fnc_simDisable", RCLIENT];

    _obj setVariable ["item", ["money", (missionNameSpace getVariable ["PHX_Cash", 0])], true];
    _obj setVariable ["phx_realCash", true, true];
    [CASH, 1, 0, "Death"] call PHX(handleMoney);
    _obj setPos _pos;
};