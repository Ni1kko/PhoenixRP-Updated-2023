#include "..\..\script_macros.hpp"
/*
    File: fn_loadGear.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads saved civilian gear, this is limited for a reason and that's balance.
*/
params [
    ["_itemArray", false, [[]]]
];

if !(_itemArray isEqualType []) then { _itemArray = GETGEAR };

waitUntil {!(isNull (findDisplay 46))};

if (_itemArray isEqualTo []) exitWith {call PHX(getDefaultLoadout)};

private _gear = _itemArray;
private _vItems = _itemArray param [((count _itemArray) - 1),[],[[]]];
if ((_vItems select 0) isEqualTypeParams ["",1]) then {_vItems = _vItems} else {_vItems = []};

call PHX(clearItems);

if (count _gear > 10) then {_gear resize ((count _gear) - 1)};

if ([_gear] call PHX(checkLoadout)) then {
    player setUnitLoadout _gear;
} else {
    call life_fnc_stripDownPlayer;

    _itemArray params [
        "_uniform",
        "_vest",
        "_backpack",
        "_goggles",
        "_headgear",
        ["_items",[]],
        "_prim",
        "_seco",
        ["_uItems",[]],
        ["_uMags",[]],
        ["_bItems",[]],
        ["_bMags",[]],
        ["_vItems",[]],
        ["_vMags",[]],
        ["_pItems",[]],
        ["_hItems",[]],
        ["_vItems",[]]
    ];

    if !(_goggles isEqualTo "") then {[_goggles,true,false,false,false] call life_fnc_handleItem};
    if !(_headgear isEqualTo "") then {[_headgear,true,false,false,false] call life_fnc_handleItem};
    if !(_uniform isEqualTo "") then {[_uniform,true,false,false,false] call life_fnc_handleItem};
    if !(_vest isEqualTo "") then {[_vest,true,false,false,false] call life_fnc_handleItem};
    if !(_backpack isEqualTo "") then {[_backpack,true,false,false,false] call life_fnc_handleItem};

    {[_x,true,false,false,false] call life_fnc_handleItem} forEach _items;

    {player addItemToUniform _x;} forEach (_uItems);
    {(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uMags);
    {player addItemToVest _x;} forEach (_vItems);
    {(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vMags);
    {player addItemToBackpack _x;} forEach (_bItems);
    {(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bMags);

    if !(_prim isEqualTo "") then {[_prim,true,false,false,false] call life_fnc_handleItem};
    if !(_seco isEqualTo "") then {[_seco,true,false,false,false] call life_fnc_handleItem};

    {player addPrimaryWeaponItem _x} forEach (_pItems select { !(_x isEqualTo "") });
    {player addHandgunItem _x} forEach (_hItems select { !(_x isEqualTo "") });
};

private _increase = [1, 1.25] select (HAS_PERK("muscleman"));

life_maxWeight = floor((LIFE_SETTINGS(getNumber,"default_maxWeight")) * _increase);

if !(backpack player isEqualTo "") then {
    life_maxWeight = life_maxWeight + round(FETCH_CONFIG2(getNumber,"CfgVehicles",(backpack player),"maximumload") / 4)
};

{[true,(_x select 0),(_x select 1)] call life_fnc_handleInv} forEach (_vItems);

[] call PHX(playerSkins);