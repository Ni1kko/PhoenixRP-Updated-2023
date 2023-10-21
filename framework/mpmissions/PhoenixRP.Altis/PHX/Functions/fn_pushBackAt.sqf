/*
	@File: fn_pushBackAt.sqf
	@Author: Jack "Scarso" Farhall
	@Description: like pushBack but allows us to input at an index...
*/
if !(params [["_array", [], [[]]], ["_element", "", [[], "", 0]], ["_index", -1, [0]]]) exitWith {};

if (_array isEqualTo []) exitWith { _array pushBack _element };

_array pushBack (_array select ((count _array) - 1));

for "_i" from ((count _array) - 2) to _index step -1 do {
	_array set [(_i + 1), (_array select _i)];
};

_array set [_index, _element];