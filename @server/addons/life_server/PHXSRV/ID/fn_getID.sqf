/*
	@File: fn_getID.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gets our current ID information and passess it to the fn_queryRequest.sqf or fn_lookupID.sqf
*/
params [
	["_IDCard", -1, [0]],
	["_IDCol", "id", [""]], // Allows me to switch between the "ID" and "UID" Columns in the PHXIDCards table...
	["_isFake", -1, [0]]
];

if (_IDCard isEqualTo -1) exitWith {-1}; // They need to create an id...

private _endCheck = "";

if (_IDCol isEqualTo "uid") then { _endCheck = "AND isFake = '0'" };

private _results = [
	format["SELECT uid, realname, age, gender, ethnicity, isFake FROM phxids WHERE %2 = '%1' AND (active = '1' OR isFake = '%4') %3 LIMIT 1", 
		([_IDCard] call DB_fnc_numberSafe), 
		_IDCol,
		_endCheck,
		_isFake
	], 
	2
] call DB_fnc_asyncCall;

if (_results isEqualType "" || { _results isEqualTo [] }) exitWith {-1};

if ((_results select 5) isEqualType 0) then { _results set[5, ([(_results select 5), 1] call DB_fnc_bool)] };

_results