/*
    @File: fn_insertCapture.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Inserts the capture!
*/
params [
	["_gangID", -1, [0]],
	["_cartel", "", [""]]
];

if (_cartel isEqualTo "" || {_gangID isEqualTo -1}) exitWith {}; // Stop false values...

[format["INSERT INTO cartel_captures (gangID, cartel) VALUES ('%1', '%2')", _gangID, _cartel], 1] call DB_fnc_asyncCall;