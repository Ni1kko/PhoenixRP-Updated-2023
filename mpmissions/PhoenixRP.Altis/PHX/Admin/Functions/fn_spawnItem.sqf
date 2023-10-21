
/*
	@File: fn_spawnItem.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows us to spawn a virtual item...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

private _listBox = (_display displayCtrl IDC_MARKET_LIST);

private _item = (_listBox lnbData[ lnbCurSelRow _listBox, 0 ]);
if (_item isEqualTo "") exitWith { ["You must select an item to spawn in first..."] spawn PHX(notify) };

private _amount = ctrlText IDC_MARKET_AMOUNTTXT;
if !([_amount] call LIFE_fnc_isNumber) exitWith { ["The value you're entering must only contain numbers","red"] spawn PHX(notify) };

_amount = parseNumber _amount;
if (_amount < 1) exitWith { ["You must enter a number above 0", "red"] spawn PHX(notify) };

if !([true, _item, _amount] call LIFE(handleInv)) exitWith {
    [format["Only some of the %1 were able to be spawned as your inventory is full...", ITEM_NAME(_item)]] spawn PHX(notify);
};

[format["You've spawn in %1 x %2...", _amount, ITEM_NAME(_item)]] spawn PHX(notify);
[player, format ["%1 (%2) spawned in (%3) %4",profileName,(getPlayerUID player),_amount,(ITEM_NAME(_item))], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);