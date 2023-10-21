/*
	@File: fn_handleMoney.sqf

	@Author: Jerico
	@Editor: Conner Merlin
	@Editor: Jack "Scarso" Farhall

	@Description: Preforms checks on money when adding / subtracting...

	@Parameter(s):
		0: Number	- 0 = Ammount
		1: Number	- 0 = Add / 1 = Subtract / 2 = Replace
		2: Number	- 0 = Cash / 1 = ATM
		3: Bool		- true = Wont update database (just for checks) / false = will update database, default on.

	@Usage:
		[PRICE, 1, 0] call PHX_fnc_handleMoney; // Subtract PRICE from CASH...
		[PRICE, 0, 0] call PHX_fnc_handleMoney; // Add PRICE to CASH...
*/
#include "..\..\script_macros.hpp"
params [
	["_amount", 0, [0]],
	["_operation", 0, [0]],
	["_source", 0, [0]],
	["_reason", "", [""]],
	["_suppressDBUpdate", false, [false]]
];

private _return = true;
private _error = false;
private _newRealMoney = 0;

// Checking...
private _realMoney = ([BANK, CASH] select (_source isEqualTo 0));
private _CalculatedMoney = ([(PHX_Cash_681 + PHX_Cash_145),(PHX_Cash_434 + PHX_Cash_785)] select (_source isEqualTo 0));

private _Remainder = _CalculatedMoney - _realMoney;

_return = ((_Remainder <= 10000) && (_Remainder >= -10000));
_error = !_return; // Error is the opposite of return...

// If an error has been found here then stop here...
if ((_error) && (!_suppressDBUpdate)) then {
	// Wipe their account...
	PHX_Cash = 0;
	PHX_ATMCash = 0;
	[] call DB(updateRequest);
	[player, format ["Money Log: %1 (%7) was kicked for money verification failure (Current Cash = %2, Calculated Cash = %3, Amount to Modify = %4) - (CASH when wiped: %5, BANK when wiped: %6", profileName, [_RealMoney] call LIFE_fnc_numberText, [_CalculatedMoney] call LIFE_fnc_numberText, [_Amount] call LIFE_fnc_numberText, [PHX_Cash] call LIFE_fnc_numberText, [PHX_ATMCash] call LIFE_fnc_numberText, getPlayerUID player], "https://rcon.phoenixrp.co.uk/api/v1/log/cheat"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

	// Notify + Kick...
	[0,format["%1 kicked due to failed money verification",profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
	failmission "Money Verification Failed";
} else {
	//--- Operations
	if (_return && { _operation < 3 }) then {

		//--- 0 = Add / 1 = Subtract / 2 = Replace
		switch (_operation) do {
			case 0: { //--- Add
				_newRealMoney = _realMoney + _amount;
			};
			case 1: { //--- Subtract
				if (_amount <= _realMoney) then {
					_newRealMoney = _realMoney - _amount;
				} else {
					_return = false;
				};
			};
			case 2: { //--- Replace
				_newRealMoney = _amount;
			};
		};

		private _rand = 0;
		if !(_newRealMoney isEqualTo 0) then {
			_rand = random ( _newRealMoney + 1 );
		};

		if (_source isEqualTo 0) then {
			PHX_Cash = _newRealMoney;
			PHX_Cash_434 = _rand;
			PHX_Cash_785 = _newRealMoney - _rand;
		} else {
			PHX_ATMCash = _newRealMoney;
			PHX_Cash_681 = _rand;
			PHX_Cash_145 = _newRealMoney - _rand;
		};
	};

	if (_return && { !_suppressDBUpdate }) then { [_source] call DB(updatePartial) }; // Sync Data...
};

[_reason,_source,_amount,_operation] call PHX_fnc_handleTransaction;

_return