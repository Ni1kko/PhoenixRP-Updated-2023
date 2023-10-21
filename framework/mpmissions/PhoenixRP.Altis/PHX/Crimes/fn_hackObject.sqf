/*
    @File: fn_hackObject.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Cuts the power for a given job...
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
private _side = (call compile (getText(_cfg >> "side")));
private _online = 5;
private _isMajorCrime = (getNumber(_cfg >> "major"));

if ((_isMajorCrime isEqualTo 1) && { serverTime <= (getNumber(missionConfigFile >> "CfgSettings" >> "crime_delay")) }) exitWith { ["You can't hack this object until 15 minutes has passed since last server restart.", "red"] spawn PHX(notify) };

private _sideText = switch (_side) do {
    case west: {"Police Officers"};
    default {"HAVOC Members"};
};

if (ONLINE(_side) < _online && { isNil { _laptop getVariable "override" } }) exitWith {
    [format["There needs to be at least %1 %2 on-duty to break in...", _online, _sideText], "red"] spawn PHX(notify);
};

(_object getVariable ["state", [false, false]]) params ["_hacked", "_power"];

if (_laptop getVariable ["inUse", false]) exitWith {["This laptop is already being hacked...", "red"] spawn PHX(notify) };
if (_hacked) exitWith {["You've already hacked and disabled the vault security...", "red"] spawn PHX(notify) };
if (ITEM_VALUE("hackingdevice") < 1) exitWith {["You need a hacking device to start hacking the vault!", "red"] spawn PHX(notify) };

_laptop setVariable ["inUse", true, true];

[
    format["The %1 is under attack!", _title],
    format["The %1 is under attack! All civilians and medics should stay away until the situation can be resolved!", _title],
    "AAN News"
] remoteExec ['life_fnc_AAN', -2];

private _sleep = 600;
if (_crime isEqualTo "Destroyer") then {
    _sleep = 140;
} else {
    if (_power) then { _sleep = 800 };
};

life_action_inUse = true;

if !(
    [
        format["Hacking into %1", _title],
        _sleep,
        [
            format["params ['_laptop', '_object']; player distance _laptop < 5 && { !((_object getVariable ['state', [false, false]]) select 0) }"], 
            [_laptop, _object], true, 
            { ["You need to remain close to the laptop or the system has already been hacked...", "red"] spawn PHX(notify) }
        ], 0.01, ""
    ] call PHX(handleProgress)
) exitWith { _laptop setVariable ["inUse", nil, true]; life_action_inUse = false; };

_object setVariable ["state", [true, _power], true];
_laptop setVariable ["inUse", nil, true];
life_action_inUse = false;

[format ["You have successfully hacked and disabled the vaults security!"], "green"] spawn PHX(notify);

if (_isMajorCrime isEqualTo 1) then {
    [75, format["Hacking into %1", _title]] spawn PHX(handleGangXP);
};

if (_crime isEqualTo "HM") exitWith { [] remoteExecCall (["fnc_getHMValue", "PHXSRV"] call SOCK_fnc_getRemoteDestination); };
if (_crime isEqualTo "Evidence") exitWith { [] remoteExecCall (["fnc_getLockupValue", "PHXSRV"] call SOCK_fnc_getRemoteDestination); };
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
                _building setVariable [format ["bis_disabled_Door_%1",_x],0,true];
            } forEach _doorsToLock;
        };
    } forEach (getArray(_desCfg >> "classname"));
};