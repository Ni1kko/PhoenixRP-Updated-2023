/*
	@File: fn_checkOut.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Yes
*/
#include "..\..\..\..\script_macros.hpp"
params [
	["_buyButton", controlNull, [controlNull]]
];

private _display = ctrlParent _buyButton;
if (isNull _display) exitWith {};

if (PHX_CartTotal > CASH) exitWith { [format["You can't afford to pay for this cart..."]] spawn PHX(notify) };

private _cart = [];
private _totalP = 0;

private _cartUI = (_display displayCtrl 7404);

for "_i" from 0 to ((lbSize _cartUI) - 1) do {
	_cart pushBack [(lbData [7404, _i]), (lbValue [7404, _i])];
};

private _notAdded = ({
	_x params ["_item", "_price"];

	if ([_item, false] call PHX(handleGear)) then {
		_totalP = _totalP + _price;
		false
	} else {
		true
	};
} count (_cart select { 
	!((_x select 0) isEqualTo "") && 
	{ (_x select 1) >= 0 }
}));

if !(_notAdded isEqualType 0) then { _notAdded = 0 };
if (_notAdded >= (lbSize _cartUI)) exitWith { [format["Your inventory is full..."]] spawn PHX(notify) };

[_totalP, 1, 0, "Purchase At A Weapon Store"] call PHX(handleMoney);
[] call DB(updateRequest);
closeDialog 0;
[format["Purchase Completed for £%1!", [_totalP] call LIFE(numberText)]] spawn PHX(notify);

[player, format ["%1 (%2) bought %3 for %4. Bank Balance: %5 On Hand Balance: %6",player getVariable ["realname", name player],(getPlayerUID player),_cart,[_totalP] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

if (_notAdded > 0) then { [format["Your inventory is full so some items were returned without charge..."]] spawn PHX(notify) };