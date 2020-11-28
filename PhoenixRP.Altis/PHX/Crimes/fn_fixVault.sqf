/*
    @File: fn_fixVault.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Allows us to fix a vault that has been drilled...
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

(_object getVariable ["state", [false, false]]) params ["_hacked", "_drilled"];

if (_vault getVariable ["inUse", false]) exitWith {["This vault is already being repaired or drilled...", "red"] spawn PHX(notify) };
if !(_drilled) exitWith {["The lock on this vault is not damaged...", "red"] spawn PHX(notify) };

_vault setVariable ["inUse", true, true];

life_action_inUse = true;

if !(
    [
        format["Repairing %1", _title],
        26,
        [
            format["params ['_vault', '_object']; player distance _vault < 5 && { ((_object getVariable ['state', [true, false]]) select 0) }"], 
            [_vault, _object], true, 
            { ["You need to remain close to the vault or the vault has already been fixed...", "red"] spawn PHX(notify) }
        ], 0.01, ""
    ] call PHX(handleProgress)
) exitWith { _vault setVariable ["inUse", nil, true]; life_action_inUse = false; };

_object setVariable ["state", [_hacked, false], true];
_vault setVariable ["inUse", nil, true];
life_action_inUse = false;

[format ["You have successfully repaired the lock on this vault!"], "green"] spawn PHX(notify);

if (_crime isEqualTo "Destroyer") exitWith { havoc_box setVariable ["Trunk", nil, true] };
if (_crime isEqualTo "Armoury") exitWith {
	clearWeaponCargoGlobal hav_armoury;
	clearMagazineCargoGlobal hav_armoury;
	clearItemCargoGlobal hav_armoury;
	clearBackpackCargoGlobal hav_armoury;
};