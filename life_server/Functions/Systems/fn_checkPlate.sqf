/*
	@File: fn_checkPlate.sqf

	@Author: Jack "Scarso" Farhall
	
	@Description: Checks if our plate is unique...
*/
scopeName "plateCheck";
params [
    ["_mode",true,[true]],
	["_plate", "", [""]]
];

#define MAX_LOOPS 5

private _results = [];
private _attempts = 0;
private _isUnique = false;

if (!(_mode) && (_plate isEqualTo "")) then { _plate = format["RL%1", round(random(100000))] };

// If we don't have a custom plate set we'll sort all that here...
if (_plate isEqualTo "") then { 
	for "_i" from 0 to 1 step 0 do {
		_plate = format["%1", round(random(1000000))];

		_results = [format["SELECT plate FROM phxcars WHERE plate = '%1'", _plate], 2] call DB_fnc_asyncCall;

		if (_results isEqualType []) then {
			if (count _results isEqualTo 0) exitWith { _isUnique = true };
			_attempts = _attempts + 1;
		};

		if (_isUnique) exitWith {};
		if (_attempts > MAX_LOOPS) exitWith {};
	};
};

if !(_isUnique) then {
	if (_attempts > MAX_LOOPS) exitWith { ["A plate registration issue occured...", "red"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner]; breakOut "plateCheck"; };

	_results = [format["SELECT plate FROM phxcars WHERE plate = '%1'", _plate], 2] call DB_fnc_asyncCall;
	if !(_results isEqualType []) exitWith { breakOut "plateCheck" };
	
	if !(count _results isEqualTo 0) exitWith { ["That plate is already in use!", "red"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner]; breakOut "plateCheck"; };
};

[_mode, true, _plate] remoteExec ["life_fnc_vehicleShopBuy", remoteExecutedOwner];