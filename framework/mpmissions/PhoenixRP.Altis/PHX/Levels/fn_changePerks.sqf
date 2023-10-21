/*
	@File: fn_changePerks.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Handles the changing of our active perks...

	@Parameters:
		0 - TYPE: STRING - DES: The config name for the perk we're changing...
		1 - TYPE: BOOL - DES: True means we're removing, false means we're adding the perk...
*/
scopeName "changePerks";
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
#define CFG missionConfigFile >> "CfgPerks"
params [
	["_perk", "", [""]],
	["_type", false, [true]]
];

if (player getVariable ["isAdmin", false]) exitWith {};
if (_perk isEqualTo "") exitWith { systemChat "Perk is Blank..." }; // What?
if !(isClass (CFG >> _perk)) exitWith { systemChat format["%1 is not a perk...", _perk] }; // Alright then...

private _perkName = getText(CFG >> _perk >> "displayName");

if (_type) then {
	// The type is true, this means we're going to remove a perk...

	private _removalCost = LIFE_SETTINGS(getNumber, "perk_removal");

	// Checks...
	if (BANK < _removalCost) exitWith {[format["You don't have the required £%1 to remove a perk...", [_removalCost] call LIFE(numberText)],"red"] call PHX_fnc_notify; breakOut "changePerks"; }; // We can't afford the removal cost...
	if !(HAS_PERK(_perk)) exitWith { [format["The perk %1 is not currently active...", _perkName],"red"] call PHX_fnc_notify; breakOut "changePerks"; }; // Ensure we actually have the perk active...

	private _action =  [
		format["Are you sure you wish to remove this perk? It will cost: £%1", _removalCost],
		"Perk Confirmation", "Yes", "No"
	] call PHX_fnc_confirmBox;

	if (_action) exitWith {
		PHX_Perks deleteAt (PHX_Perks findIf { _x isEqualTo _perk }); // Delete at the index of the perk we're removing...
		[_removalCost, 1, 1, "Perk Removal Fee"] call PHX(handleMoney);
		[player, format ["%1 (%2) removed a perk for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_removalCost] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

		[format["The perk %1 was succesfully deactivated for a cost of £%2!", _perkName, [_removalCost] call LIFE(numberText)],"green"] call PHX_fnc_notify;
	};

	breakOut "changePerks";
} else {
	// The type is false, this means we're going to add the perk...

	private _perkLimit = [] call PHX(getPerkLimit);

	// Checks...
	if (HAS_PERK(_perk)) exitWith { [format["The perk %1 is already active...", _perkName],"red"] call PHX_fnc_notify; breakOut "changePerks"; }; // Ensure we don't already have the perk active...
	if ((count(PHX_Perks)) >= _perkLimit) exitWith { [format["You've already reached your max perk limit of %1", _perkLimit],"red"] call PHX_fnc_notify; breakOut "changePerks"; }; // We already have our max num of active perks...

	PHX_Perks pushBackUnique _perk; // Add the perk to our array...
	[format["The perk %1 was succesfully activated!", _perkName],"green"] call PHX_fnc_notify;
};

[] call PHX(updatePerks); // Update UI if it's active...

[8] call SOCK_fnc_updatePartial; // Update our perks...