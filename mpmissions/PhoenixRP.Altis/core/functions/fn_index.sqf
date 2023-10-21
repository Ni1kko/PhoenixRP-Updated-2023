/*
    File: index.sqf
    Author: Bryan "Tonic" Boardwine

*/

params [
	"_item",
	["_stack",[],[[]]]
];
    
_stack findIf {_item in _x};