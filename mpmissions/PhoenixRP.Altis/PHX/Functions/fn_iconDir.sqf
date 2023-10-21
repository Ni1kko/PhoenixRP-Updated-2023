/*
	@File: fn_iconDir.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Root root...
*/
params [["_dir", "", [""]], ["_root", 1, [0]]];

[
	_dir,
	format ["mpmissions\__CUR_MP.%1\%2", worldName, _dir]
] select (_root isEqualTo 1);