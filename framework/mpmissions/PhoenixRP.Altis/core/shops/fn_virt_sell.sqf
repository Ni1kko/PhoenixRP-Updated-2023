#include "..\..\script_macros.hpp"
/*
    File: fn_virt_sell.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Sell a virtual item to the store / shop
*/

#define CFG missionConfigFile >> "CfgCartel" >> "Altis" >> "Cartels"

params [
    ["_multi",false,[true]]
];

if ((time - life_action_delay) < 2) exitWith {};
life_action_delay = time;

if ((lbCurSel 2402) isEqualTo -1) exitWith {};
private _type = lbData[2402,(lbCurSel 2402)];
private _price = M_CONFIG(getNumber,"CfgItems",_type,"sellPrice");
if (_price isEqualTo -1) exitWith {};

private _amount = [parseNumber(ctrlText 2405),5] select (_multi);
if (!([str(_amount)] call LIFE_fnc_isNumber)) exitWith {NOTIFY("You didn't enter an actual number","red");};

if (_amount > (ITEM_VALUE(_type))) exitWith {NOTIFY("You don't have that many items to sell!","red")};

_price = [
    (M_CONFIG(getNumber,"CfgItems",_type,"buyPrice")),
    _price,
    (ITEM_ILLEGAL(_type) isEqualTo 1),
    true,
    _amount
] call PHX(calSellPrice);

_price = (_price * _amount);

private _name = M_CONFIG(getText,"CfgItems",_type,"displayName");
private _givesXP = M_CONFIG(getNumber,"CfgShops",life_shop_type,"gangXP");

if ([false,_type,_amount] call life_fnc_handleInv) then {
    [] call life_fnc_virt_update;
    if (playerSide in [east, civilian]) then {
        [format ["You sold %1 %2 for £%3.",_amount,_name,[_price] call life_fnc_numberText],"green"] call PHX_fnc_notify;
        [_price, 0, 0,(format["Sold %1 %2(s)",_amount,_name])] call PHX(handleMoney);

        if (_givesXP isEqualTo 1 && { [player] call PHX(isNearGang) } && { _amount >= 2 }) then {
            [ceil(_amount * 0.5), format["Selling %1 x %2 with Group Members Nearby", _name, _amount]] spawn PHX(handleGangXP);
        };
    } else {
        NOTIFY("As a public servant, the government has taken the profits from your sale.","cyan");
    };
};

// Shop Specific Code
switch (true) do {
    case (life_shop_type in ["drug_dealer", "turtle_dealer", "moonshine_dealer"]) : {
        private _array = life_shop_npc getVariable ["sellers",[]];
        private _ind = [getPlayerUID player,_array] call LIFE_fnc_index;
        
        if !(_ind isEqualTo -1) then {
            private _val = ((_array select _ind) select 2);
            _val = _val + _price;
            _array set[_ind,[getPlayerUID player,profileName,_val]];
            life_shop_npc setVariable ["sellers",_array,true];
        } else {
            _array pushBack [getPlayerUID player,profileName,_price];
            life_shop_npc setVariable ["sellers",_array,true];
        };
    };

    case (life_shop_type isEqualTo "gold" && (LIFE_SETTINGS(getNumber,"atm_cooldown")) > 0) : {
        [] spawn {
            life_use_atm = false;
            sleep ((LIFE_SETTINGS(getNumber,"atm_cooldown")) * 60);
            life_use_atm = true;
        };
    };

    case (life_shop_type isEqualTo "hmp_rockmarket" && {life_is_arrested} && {life_jail_time > 10}) : {
        life_jail_time = life_jail_time - (10 * _amount);
        [(format["You have deducted %1 seconds from your sentence for transporting %2 rock(s)!",(10 * _amount),_amount])] spawn PHX(notify);
    };
};

[player, format ["%1 (%2) sold %3 %4 for %5. Bank Balance: %6 On Hand Balance: %7",profileName,getPlayerUID player,[_amount] call life_fnc_numberText,(_name),[_price] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

[3] call SOCK_fnc_updatePartial;