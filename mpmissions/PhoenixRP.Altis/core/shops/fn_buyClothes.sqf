/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/
#include "..\..\script_macros.hpp"
scopeName "buyClothes";
if ((lbCurSel 3101) isEqualTo -1) exitWith {["You didn't choose the clothes you wanted to buy.","red"] call PHX_fnc_notify;};

private _price = 0;
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach life_clothing_purchase;

if !(isCID(player)) then {
    if (_price > CASH) exitWith {["Sorry, you don't have enough money to buy those clothes.","red"] call PHX_fnc_notify; breakOut "buyClothes";};
    [_price, 1, 0, "Purchased Clothes"] call PHX(handleMoney);
};

[player, format ["%1 (%2) bought clothes totaling to %3. Bank Balance: %4 On Hand Balance: %5",profileName,(getPlayerUID player),[_price] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

life_clothesPurchased = true;
[] call PHX(playerSkins);
closeDialog 0;
