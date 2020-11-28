/*
	@File: fn_changeGangPerks.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Toggles the selected perk one and off...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
#define CFG missionConfigFile >> "CfgGangs"
scopeName "gangPerks";
_this params [
	["_btn", controlNull, [controlNull]],
	["_perk", "", [""]]
];

if (player getVariable ["isAdmin", false]) exitWith {};
if !(isClass (CFG >> "Perks" >> _perk)) exitWith {};

_btn ctrlEnable false;

private _group = grpPlayer;

if !((_group getVariable "gang_owner") isEqualTo (getPlayerUID player)) exitWith { ["Only the gang leader can modify perks...", "green"] call PHX_fnc_notify };

private _perkName = getText(CFG >> _perk >> "name");
private _perks = (_group getVariable ["gang_perks", []]);
private _perkLimit = (getNumber(CFG >> "maxPerks"));

private _display = findDisplay IDD_TABLET_MAIN;
private _activePerkTitle = _display displayCtrl IDC_GANG_PERKS_ACTIVE_TITLE;

if (HAS_GANG_PERK(_perk, _group)) then {
	private _removalCost = getNumber(CFG >> "perkSwitchPrice");

	// Checks...
	if ((_group getVariable ["gang_bank", 0]) < _removalCost) exitWith {[format["You don't have the required £%1 in gang funds to remove a perk...", [_removalCost] call LIFE(numberText)],"red"] call PHX_fnc_notify; _btn ctrlEnable true; breakOut "gangPerks"; };

	private _action = [
		format["Are you sure you wish to remove this perk? It will cost: £%1", [_removalCost] call LIFE(numberText)],
		"Gang Perk Confirmation", "Yes", "No"
	] call PHX_fnc_confirmBox;

	if (_action) exitWith {
		_perks deleteAt (_perks findIf { _x isEqualTo _perk });

		_group setVariable ["gang_perks", _perks , true];
		_group setVariable ["gang_bank", (round ((_group getVariable ["gang_bank", 0]) - _removalCost)), true];

		[format["The gang perk %1 was succesfully deactivated for a cost of £%2!", _perkName, [_removalCost] call LIFE(numberText)],"green"] call PHX_fnc_notify;

		_btn ctrlSetStructuredText parseText "Select";
		_btn ctrlSetBackgroundColor [0,0.3,0,1];
		_btn ctrlCommit 0;
	};

	_btn ctrlEnable true;
	breakOut "gangPerks";
} else {
	if ((count(_perks)) >= _perkLimit) exitWith { [format["You've already reached your max gang perk limit of %1", _perkLimit],"red"] call PHX_fnc_notify; _btn ctrlEnable true; breakOut "gangPerks"; };

	_perks pushBackUnique _perk; // Add the perk to our array...

	_group setVariable ["gang_perks", _perks, true];
	[format["The gang perk %1 was succesfully activated!", _perkName],"green"] call PHX_fnc_notify;

	_btn ctrlSetStructuredText parseText "Remove";
	_btn ctrlSetBackgroundColor [0,0.1,0,0.5];
	_btn ctrlCommit 0;
};

_activePerkTitle ctrlSetStructuredText parseText format["Gang Perks <t align='right'>(%1/%2)</t>", (count(_perks)), (getNumber(CFG >> "maxPerks"))];

[1, _group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
[13, _group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

_btn ctrlEnable true;