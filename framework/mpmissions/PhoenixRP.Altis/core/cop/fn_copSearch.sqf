/*
    File: fn_copSearch.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Returns information on the search.
*/

#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgItems"

params [
    ["_civ",objNull,[objNull]],
    ["_inv",[],[[]]]
];

if (isNull _civ) exitWith {};

private _items = "";

if (count _inv > 0) then {
    {
        _x params [
            ["_var","",[""]],
            ["_val",0,[0]]
        ];

        if (ITEM_ILLEGAL(_var)) then {

            _price = getNumber(CFG >> _var >> "sellPrice");

            if (_price isEqualTo -1) then {
                if (isClass (CFG >> _var >> "proccessedItem")) then {
                    _half = getText(CFG >> _var >> "proccessedItem");
                    _price = getNumber(CFG >> _half >> "sellPrice");
                } else {
                    _price = 0
                };
            };
            
            _value = _value + (round(_val * _price));
        };
        _items = _items + format ["%1 %2<br/>",(_x select 1),(_x select 0)];
    } forEach _inv;
} else {
    _items = "No items";
};

if (!alive _civ || {player distance _civ > 5}) exitWith {[format ["Couldn't search %1",_civ getVariable ["realname",name _civ]],"red"] call PHX_fnc_notify};

hint parseText format ["<t color='#FF0000' size='1.7'>%1</t><br/><t color='#FFD700' size='1.5'><br/>Illegal Items</t><br/>%2<br/><br/><br/><t color='#FF0000'>%3</t>",(_civ getVariable ["realname",name _civ]),_items];

[player, format ["%1 (%2) searched %3 (%4) and found %5 worth of contraband.", profileName, getPlayerUID player, _civ getVariable ["realname", name _civ], getPlayerUID _civ, [_value] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);