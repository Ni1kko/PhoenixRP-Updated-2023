/*
	@File: fn_gatherItem.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Handles gather zones...
*/
scopeName "Gathering";
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgGathering"

// Initial Checks...
if (life_action_inUse) exitWith {};
if !(isNull objectParent player) exitWith {};
if (isRestrained(player)) exitWith { NOTIFY("You cannot do this while you are restrained.","red") };
if (player getVariable ["playerSurrender", false]) exitWith { NOTIFY("You cannot do this while you are surrendered.","red") };

life_action_inUse = true;

// Initial Variable Definition...
private _zone = "";
private _gConfigs = CFG;

// Get the zone we're currenlty in...
for "_i" from 0 to (count(_gConfigs) - 1) do {
	private _curConfig = _gConfigs select _i;
	private _zoneSize = getNumber(_curConfig >> "zoneSize");

	{
		if ((player distance(getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = (configName _curConfig);
        };
	} forEach (getArray(_curConfig >> "zones"));
};

if (_zone isEqualTo "") exitWith { life_action_inUse = false }; // Ensure we've got a zone...

// Zone Variable Definition...
private _myZone = CFG >> _zone;
private _chance = (floor random 100) + 1;
private _gatherItem = getText(_myZone >> "gathered");
private _maxGather = getNumber(_myZone >> "amount");
private _requiredItem = getText(_myZone >> "item");

// Check if we have the required item...
if !(_requiredItem isEqualTo "") then {
	if !(ITEM_VALUE(_requiredItem) > 0) then {
		private _itemName = M_CONFIG(getText,"CfgItems",_requiredItem,"displayName");

		[format["This zone requires the use of a %1.", _itemName], "red"] call PHX_fnc_notify;
		
		life_action_inUse = false;
		breakOut "Gathering";
	};
};

// More Variable Definition...
private _title = getText(_myZone >> "text");
private _amount = round(random(_maxGather)) + 1;
private _profession = getArray(_myZone >> "profession");

// Split the profession array...
private _profZone = _profession select 0;
private _profRequirement = _profession select 1;
private _profXP = _profession select 2;
private _profChance = _profession select 3;

if (PROF_LVL(_profZone) < _profRequirement) exitWith { NOTIFY("You don't meet the profession requirement for this zone.","red") };

// Check if we can fit the items...
private _diff = [_gatherItem, _amount, life_carryWeight, life_maxWeight] call LIFE(calWeightDiff);
if (_diff isEqualTo 0) exitWith {

	if (PHX_gatherNot) then {
    	NOTIFY("Your inventory space is full.","red");

		[] spawn {
			PHX_gatherNot = false;
			sleep 3;
			PHX_gatherNot = true;
		};
	};

    life_action_inUse = false;
};

// Progress Bar!
private _level = PROF_LVL(_profZone);

player action ["SwitchWeapon", player, player, 100];

if !(
    [
        _title,
        50,
        [],
        ([0.01,(0.01 + (_level / 2500))] select (_level > 0)),
		"AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false };

if ([true,_gatherItem,_diff] call life_fnc_handleInv) then {
    private _itemName = M_CONFIG(getText,"CfgItems",_gatherItem,"displayName");

    [_profZone,_profXP,_profChance] call PHX(increaseProfession);

    [format ["You have gathered %2 %1(s).",_itemName,_diff],"green"] call PHX_fnc_notify;
};

if !((getArray(_myZone >> "gems")) isEqualTo []) then {
	private _gem = ((getArray(_myZone >> "gems") select 0) selectRandomWeighted (getArray(_myZone >> "gems") select 1));

	if !(_gem isEqualTo "nothing") then {
		[true,_gem,1] call life_fnc_handleInv;
		[format ["You have also found an %1",(ITEM_NAME(_gem))],"green"] call PHX_fnc_notify;
	};
};

life_action_inUse = false;