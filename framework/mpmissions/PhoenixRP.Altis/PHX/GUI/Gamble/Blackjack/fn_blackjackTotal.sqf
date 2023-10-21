#include "..\..\..\..\script_macros.hpp"
/*
@    File: fn_blackjackTotal.sqf
@    Author: Zyn
@	 Credit: Sig
@    Description: Calculates the total
*/

params [
    ["_array",[],[[]]]
];

private _total = 0;
private _aces = {_x isEqualTo 1} count _array;

{
	_total = _total + (_x min 10);
} forEach _array;

for "_i" from 0 to (_aces - 1) do {
	if (_total + 10 <= 21) then {
		_total = _total + 10
	};
};

_total