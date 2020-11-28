/*
	@File: fn_setClaimed.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Marks mail as claimed or decreases quantity...
*/
if !(_this params [
	["_id", -1, [0]],
	["_newQuantity", -1, [0]]
]) exitWith {};

if (_newQuantity > 0) then {
	[format["UPDATE phxmail SET quantity = '%2' WHERE id = '%1'", _id, _newQuantity], 1] call DB_fnc_asyncCall;
} else {
	[format["UPDATE phxmail SET claimed = '1' WHERE id = '%1'", _id], 1] call DB_fnc_asyncCall;
};