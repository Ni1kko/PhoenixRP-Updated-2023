/*
    @File: fn_revertHack.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Allows you to fix a hacked device...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgMap"
params [
    ["_laptop", objNull, [objNull]], "", "", 
    ["_crime", "", [""]]
];

if (isNull _laptop) exitWith {};

if !(isClass (CFG >> "Jobs" >> _crime)) exitWith {};

private _cfg = CFG >> "Jobs" >> _crime;

private _object = missionNamespace getVariable [(getText(_cfg >> "object")), objNull];
if (isNull _object) exitWith {};

private _title = (getText(_cfg >> "title"));

(_object getVariable ["state", [false, false]]) params ["_hacked", "_power"];

if (_laptop getVariable ["inUse", false]) exitWith {["This laptop is already being repaired or hacked...", "red"] spawn PHX(notify) };
if !(_hacked) exitWith {["This computer has no malicious software active...", "red"] spawn PHX(notify) };

_laptop setVariable ["inUse", true, true];

life_action_inUse = true;

if !(
    [
        format["Repairing %1's Systems", _title],
        26,
        [
            format["params ['_laptop', '_object']; player distance _laptop < 5 && { ((_object getVariable ['state', [true, false]]) select 0) }"], 
            [_laptop, _object], true, 
            { ["You need to remain close to the laptop or the system has already been fixed...", "red"] spawn PHX(notify) }
        ], 0.01, ""
    ] call PHX(handleProgress)
) exitWith { _laptop setVariable ["inUse", nil, true]; life_action_inUse = false; };

_object setVariable ["state", [false, _power], true];
_laptop setVariable ["inUse", nil, true];
life_action_inUse = false;

[format ["You have successfully removed the malicious software from this computer!"], "green"] spawn PHX(notify);

if (_crime isEqualTo "HM") exitWith { fed_bank setVariable ["Trunk", nil, true] };
if (_crime isEqualTo "Evidence") exitWith {
	clearWeaponCargoGlobal evidence_locker;
	clearMagazineCargoGlobal evidence_locker;
	clearItemCargoGlobal evidence_locker;
	clearBackpackCargoGlobal evidence_locker;
    evidence_locker setVariable ["Trunk", nil, true];
};
if (_crime isEqualTo "Destroyer") exitWith {
    private _desCfg = CFG >> "JobBuildings" >> "Destroyer";

    private _pos = (getArray(_desCfg >> "position"));
    private _doors = (getArray(_desCfg >> "doorsToLock"));
    private _objectsToMove = (getArray(_desCfg >> "moveObjects"));
    private _objectsToName = (getArray(_desCfg >> "nameObjects"));

    {
        private _building = nearestObject [(_pos select _forEachIndex), _x];
        private _doorsToLock = _doors select _forEachIndex;
        private _name = _objectsToName select _forEachIndex;

        if !(_doorsToLock isEqualTo []) then {
            {
                _building setVariable [format ["bis_disabled_Door_%1",_x],1,true];
            } forEach _doorsToLock;
        };
    } forEach (getArray(_desCfg >> "classname"));
};