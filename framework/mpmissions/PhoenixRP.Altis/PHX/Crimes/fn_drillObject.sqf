/*
    @File: fn_drillObject.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Literally like hacking with different wording...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgMap"
params [
    ["_vault", objNull, [objNull]], "", "", 
    ["_crime", "", [""]]
];

if (isNull _vault) exitWith {};

if !(isClass (CFG >> "Jobs" >> _crime)) exitWith {};

private _cfg = CFG >> "Jobs" >> _crime;

private _object = missionNamespace getVariable [(getText(_cfg >> "object")), objNull];
if (isNull _object) exitWith {};

private _title = (getText(_cfg >> "title"));
private _side = (call compile (getText(_cfg >> "side")));
private _online = (getNumber(_cfg >> "online"));
private _isMajorCrime = (getNumber(_cfg >> "major"));

if ((_isMajorCrime isEqualTo 1) && { serverTime <= (getNumber(missionConfigFile >> "CfgSettings" >> "crime_delay")) }) exitWith { ["You can't drill into this object until 15 minutes has passed since last server restart.", "red"] spawn PHX(notify) };

if (ONLINE(_side) < _online && { isNil { _vault getVariable "override" } }) exitWith {
    [format["There needs to be at least %1 HAVOC members on-duty to break in...", _online], "red"] spawn PHX(notify);
};

(_object getVariable ["state", [false, false]]) params ["_hacked", "_drilled"];

if (_vault getVariable ["inUse", false]) exitWith {["This vault is already being broken into...", "red"] spawn PHX(notify) };
if (_drilled) exitWith {["The lock on this vault has already been broken...", "red"] spawn PHX(notify) };
if (ITEM_VALUE("drill") < 1) exitWith {["You need an Industrial Drill to start breaking into the vault!", "red"] spawn PHX(notify) };

_vault setVariable ["inUse", true, true];

[
    format["The %1 is under attack!", _title],
    format["The %1 is under attack! All civilians and medics should stay away until the situation can be resolved!", _title],
    "AAN News"
] remoteExec ['life_fnc_AAN', -2];

life_action_inUse = true;

if !(
    [
        format["Drilling into %1", _title],
        750,
        [
            format["params ['_vault', '_object']; player distance _vault < 5 && { !((_object getVariable ['state', [false, false]]) select 1) }"], 
            [_vault, _object], true, 
            { ["You need to remain close to the vault or the vault has already been broken into...", "red"] spawn PHX(notify) }
        ], 0.01, ""
    ] call PHX(handleProgress)
) exitWith { _vault setVariable ["inUse", nil, true]; life_action_inUse = false; };

[false,"drill",1] call life_fnc_handleInv;

_object setVariable ["state", [_hacked, true], true];
_vault setVariable ["inUse", nil, true];
life_action_inUse = false;

[format ["You have successfully drilled into this vault!"], "green"] spawn PHX(notify);

if (_isMajorCrime isEqualTo 1) then {
    [75, format["Drilling into %1", _title]] spawn PHX(handleGangXP);
};

if (_crime isEqualTo "Armoury") then { [] remoteExecCall (["fnc_fillArmoury", "PHXSRV"] call SOCK_fnc_getRemoteDestination); };
if (_crime isEqualTo "Destroyer") exitWith { [] remoteExecCall (["fnc_getDestroyerValue", "PHXSRV"] call SOCK_fnc_getRemoteDestination); };