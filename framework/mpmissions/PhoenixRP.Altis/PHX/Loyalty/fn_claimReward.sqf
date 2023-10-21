/*
	@File: fn_claimReward.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Claim my reward...
*/
scopeName "rewardClaim";
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
#define CFG missionConfigFile >> "CfgLoyalty"
disableSerialization;
if !(params [["_btn", controlNull, [controlNull]], ["_uiEls", [], [[]]], ["_index", -1, [0]]]) exitWith {};

_btn ctrlEnable false;

private _display = findDisplay IDD_TABLET_MAIN;

{
	_uiEls set [_forEachIndex, (_display displayCtrl _x)];
} forEach _uiEls;

// Setup Variables...
_index = _index - 1;
PHX_loyalty params ["_loyDays", "_loyRewards"];
_uiEls params ["_back", "_title", "_pic"];

// Initial Checks...
if !((count _loyRewards) isEqualTo _index) exitWith {["You must claim the previous reward before this one...", "red"] spawn PHX(notify); _btn ctrlEnable true};
if !(canSuspend) exitWith { _this spawn PHX(claimReward) };

// Decide our reward...
private _tier = (format ["call compile (getText (_x >> ""condition""))"] configClasses (CFG >> "Tiers")) select 0;
private _chance = random 100;

private _rewards = (getArray(_tier >> "rewards"));
private _reward = (_rewards select { call compile (_x select 2) }) select 0; // Gives our reward...

private _value = switch (true) do {
	case ((_reward select 0) in ["Virtual", "Physical", "Vehicle"]): { (_reward select 1) };
	default {
		(_reward select 1) params ["_firstVal", "_secVal"];

		round(random [_firstVal, ((_secVal + _firstVal) / 2), _secVal]);
	};
};

// Play an "animation"...
private _delay = 0.1;
private _last = [];

for "_i" from 0 to 1 step 0 do {
	// We must remain on the UI...
	if (isNull (findDisplay IDD_TABLET_MAIN) || { isNull _back }) exitWith {
		["Reward claim cancelled...", "red"] spawn PHX(notify);
		_btn ctrlEnable true;
		breakOut "rewardClaim"; 
	};

	private _show = (_rewards select { !(_x isEqualTo _last) });
	_show = selectRandom _show;
	_last = _show;
	_show params ["_type"];

	private _picDr = call compile (getText (CFG >> "Rewards" >> _type >> "picture"));
	if !(isClass (CFG >> "Rewards" >> _type)) then { _picDr = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\unknown_ca.paa" };

	playSound "FD_Timer_F";

	_pic ctrlSetText _picDr;
	_pic ctrlCommit 0;

	sleep _delay;
	_delay = _delay + 0.01; // Slow us down baby...
	if (_delay >= 0.25) exitWith {}; // We're finished...
};

private _prettyValue = switch (true) do {
	case ((_reward select 0) isEqualTo "Virtual"): {
		private _name = (_value select 0);

		if (isClass (missionConfigFile >> "CfgItems" >> (_value select 0))) then {
			_name = getText(missionConfigFile >> "CfgItems" >> (_value select 0) >> "displayName");
		};

		_name
	};
	case ((_reward select 0) in ["Physical", "Vehicle"]): {
		private _name = (_value select 0);

		private _itemInfo = [_name] call life_fnc_fetchCfgDetails;

		if !((_itemInfo) isEqualTo []) then {
			_name = _itemInfo select 1;
		};

		_name
	};
	default {[_value] call life_fnc_numberText};
};

private _arrayValue = _value;

if (_arrayValue isEqualType []) then { _arrayValue = _arrayValue select 0 };

// Save our reward...
_loyRewards pushBack [(_reward select 0), _arrayValue];
[(getPlayerUID player), _loyRewards] remoteExecCall (["fnc_saveRewards", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
PHX_loyalty set [1, _loyRewards];

// Update UI...
private _rewardInfo = [_index] call PHX_fnc_getRewardInfo;
_rewardInfo params ["_reTitle", "_rePic", "_reVal", "_onClaim", "_format"];

call compile _onClaim;

_pic ctrlSetText _rePic;
_pic ctrlCommit 0;

if !(_reTitle isEqualTo "") then { 
	{
		_x ctrlSetTooltip format["%1 (%2)", _reTitle, _reVal];
	} forEach _uiEls;
};

_btn ctrlSetStructuredText parseText "<t align='center' size='1'>Reward Claimed</t>";
_btn ctrlSetBackgroundColor [0,0.1,0,0.5];
_btn ctrlCommit 0;

[
	format[
		"You've claimed a Loyalty Reward.<br/><t color='#FF8C00'>Reward:<t color='#c4c4c4'><br/>   - %1<br/></t></t>", 
		(format[_format, _prettyValue])
	]
] spawn PHX_fnc_notify;