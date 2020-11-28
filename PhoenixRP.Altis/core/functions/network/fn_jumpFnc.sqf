/*
    File: fn_jumpFnc.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Makes the target jump.
*/
#include "..\..\..\script_macros.hpp"
#define MAX_VEL 60

if (!params [["_unit", objNull, [objNull]]] || isNull _unit) exitWith {};
private _oldpos = getPosATL _unit;

if (animationState _unit isEqualTo "AovrPercMrunSrasWrflDf") exitWith {};

if (local _unit) then {

    private _v1 = 3.82;
    private _v2 = .4;
    private _dir = direction player;
    private _vel = velocity _unit;
    _unit setVelocity[(_vel select 0)+(sin _dir*_v2),(_vel select 1)+(cos _dir*_v2),(_vel select 2)+_v1];
    
};

_unit switchMove "AovrPercMrunSrasWrflDf";