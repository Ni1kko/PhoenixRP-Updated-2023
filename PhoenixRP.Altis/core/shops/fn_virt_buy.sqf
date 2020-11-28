#include "..\..\script_macros.hpp"
/*
    File: fn_virt_buy.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buy a virtual item from the store.
*/

params [
    ["_multi",false,[true]]
];

if ((lbCurSel 2401) isEqualTo -1) exitWith {NOTIFY("You need to select an item to buy","red")};

private _type = lbData[2401,(lbCurSel 2401)];
private _price = lbValue[2401,(lbCurSel 2401)];
private _amount = [parseNumber(ctrlText 2404),5] select (_multi);
private _isIllegal = ITEM_ILLEGAL(_type);

if (!([str(_amount)] call LIFE_fnc_isNumber)) exitWith {NOTIFY("You didn't enter an actual number","red");};

private _diff = [_type,_amount,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_diff <= 0) exitWith {NOTIFY("You don't have enough space for that amount!","red")};
_amount = _diff;

if ((_price * _amount) > CASH && {!(playerSide isEqualTo independent)}) exitWith {NOTIFY("You don't have that much money!","red")};
if ((time - life_action_delay) < 0.2) exitWith {NOTIFY("You're doing it too fast!","red");};
life_action_delay = time;

private _name = M_CONFIG(getText,"CfgItems",_type,"displayName");

if ([true,_type,_amount] call life_fnc_handleInv) then {
    if !(playerSide isEqualTo independent && {(life_shop_type in ["nhs_market","medical_supplies"])}) then {
        if ((_price * _amount) > CASH) exitWith {NOTIFY("You don't have that much money!","red"); [false,_type,_amount] call life_fnc_handleInv;};
        [] call life_fnc_virt_update;
        [(_price * _amount), 1, 0, (format["Purchased %1 %2(s)",_amount,_name])] call PHX(handleMoney);
    };
    [format ["You bought %1 %2 for £%3.",_amount,_name,[(_price * _amount)] call life_fnc_numberText],"green"] call PHX_fnc_notify;
    [player, format ["%1 (%2) bought %3 %4 for %5. Bank Balance: %6 On Hand Balance: %7",profileName,getPlayerUID player,[_amount] call life_fnc_numberText,(_name),[(_price * _amount)] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

[3] call SOCK_fnc_updatePartial;