/*
    File: fn_mresToArray.sqf

    Author: Bryan "Tonic" Boardwine"
    Edited: Jack "Scarso" Farhall & Siggy
    
    Description:
    Acts as a mres (MySQL Real Escape) for arrays so they
    can be properly inserted into the database without causing
    any problems. The return method is 'hacky' but it's effective.
*/
if !(params [["_array", "", ["", []]]]) exitWith {[]};

if (_array isEqualType []) exitWith {
    diag_log format["This array is a fucking bitch as well %1", _array];
    _array
};

private _array = call compile (format ["%1", toString (toArray(_array) apply {[_x, 39] select (_x isEqualTo 96)})]);
if (_array isEqualType "") then { _array = parseSimpleArray _array };
_array