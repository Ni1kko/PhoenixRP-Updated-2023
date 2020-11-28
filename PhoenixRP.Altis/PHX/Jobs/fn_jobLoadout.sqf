/*
	@File: fn_jobLoadout.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gives our player the given job loadout...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgJobs"
if !(params [["_job", "", [""]]]) exitWith {call LIFE(civLoadout)}; // Default to civilian gear...

if !(isClass (CFG >> _job)) exitWith {call LIFE(civLoadout)};

private _gear = (getArray(CFG >> _job >> "uniform"));

if !(_gear params [
	["_uniform", "", [""]],
	["_headgear", "", [""]],
	["_vest", "", [""]],
	["_backpack", "", [""]],
	["_uItems", [], [[]]],
	["_vItems", [], [[]]],
	["_bItems", [], [[]]],
	["_gItems", [], [[]]],
	["_vItems", [], [[]]]
]) exitWith {call LIFE(civLoadout)};

call LIFE(stripDownPlayer);

if !(_uniform isEqualTo "") then {[_uniform,true,false,false,false] call LIFE(handleItem)};
if !(_headgear isEqualTo "") then {[_headgear,true,false,false,false] call LIFE(handleItem)};
if !(_vest isEqualTo "") then {[_vest,true,false,false,false] call LIFE(handleItem)};
if !(_backpack isEqualTo "") then {[_backpack,true,false,false,false] call LIFE(handleItem)};

{[_x,true,false,false,false] call LIFE(handleItem)} forEach _gItems;

{player addItemToUniform _x;} forEach _uItems;
{player addItemToVest _x;} forEach _vItems;
{player addItemToBackpack _x;} forEach _bItems;

{[true,(_x select 0),(_x select 1)] call LIFE(handleInv)} forEach _vItems;

[] call PHX(playerSkins);
[] call LIFE(saveGear);