/*
	@File: fn_canDo.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks whether we're able to do something within the gang...
*/
scopeName "canDo";
#include "..\..\script_macros.hpp"
if !(params [["_unit", objNull, [objNull]], ["_mode", "", [""]]]) exitWith {false};

private _members = (group _unit) getVariable ["gang_members", []];

private _memIndex = (_members findIf { (_x select 1) isEqualTo (getPlayerUID player) });
if (_memIndex isEqualTo -1) exitWith {false};

private _rank = (((group _unit) getVariable "gang_ranks") select ((_members select _memIndex) select 2));
_rank params ["_name", "_level", ["_isLeader", false, [true]], ["_invite", false, [true]], ["_kick", false, [true]], ["_promote", false, [true]], ["_upgrade", false, [true]], ["_tax", false, [true]]];

if (_isLeader || { ((group _unit) getVariable "gang_owner") isEqualTo (getPlayerUID _unit) }) exitWith {true}; // We're god...

switch (true) do {
	case (_mode isEqualTo "invi" && { _invite }): {true breakOut "canDo"};
	case (_mode isEqualTo "kick" && { _kick }): {true breakOut "canDo"};
	case (_mode isEqualTo "promote" && { _promote }): {true breakOut "canDo"};
	case (_mode isEqualTo "upgrade" && { _upgrade }): {true breakOut "canDo"};
	default {false breakOut "canDo"};
};