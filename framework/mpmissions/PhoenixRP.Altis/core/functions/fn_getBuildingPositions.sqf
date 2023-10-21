/*
    File: fn_getBuildingPositions.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Retrieves all 3D-world positions in a building and also restricts
    certain positions due to window positioning.
*/
#define CFG missionConfigFile >> "CfgHousing" >> worldName
params ["_building"];

private _arr = [];

if !(isClass (CFG >> (typeOf _building))) exitWith {[]};

private _restricted = (getArray(CFG >> (typeOf _building) >> "restrictedPos"));

for "_i" from 0 to 1 step 0 do {
    scopeName "checkLoop";

    if !(_i in _restricted) then {
        _pos = _building buildingPos _i;
        if (_pos isEqualTo [0,0,0]) exitWith { breakOut "checkLoop" };
        _arr pushBack _pos;
    };

    _i = _i + 1;
};

_arr