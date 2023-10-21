/*
	@File: fn_dropFishingNet.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Drops our fishing net, catchs a fish, pulls up our net...
*/
#include "..\..\script_macros.hpp"

if !((vehicle player) isKindOf "Ship") exitWith {};

private _zones = (getArray(missionConfigFile >> "CfgFishing" >> "fishingZones"));
private _pos = getPos player;

if ((_zones findIf { ((getMarkerPos _x) distance _pos) <= 250 }) isEqualTo -1) exitWith { ["You must be within a designated fishing zone","red"] spawn PHX_fnc_notify };
if ((ITEM_VALUE("fishingNet")) <= 0) exitWith { NOTIFY("You require a fishing net to preform this action","red") };
[false, "fishingNet", 1] call life_fnc_handleInv;

life_net_dropped = true;
life_action_inUse = true;

["Dropping fishing net","cyan"] spawn PHX_fnc_notify;

private _level = PROF_LVL("Prof_Fishing");

if !(
    [
        "Waiting for fish...",
        [(round(random [20, 35, 50])),(round(random [10, 15, 25]))] select (HAS_PERK("fisherman")),
        [
            "!isNull (objectParent player) && { (speed (vehicle player) < 2 && speed (vehicle player) > -1) }", 
            [], true, 
            "[""You must within the boat and keep the boat still!"",""red""] spawn PHX_fnc_notify"
        ],
        ([0.01,(0.01 + (_level / 2500))] select (_level > 0)),
        "",
        0,
        true
    ] call PHX(handleProgress)
) exitWith { [true, "fishingNet", 1] call life_fnc_handleInv; life_net_dropped = false; life_action_inUse = false };
[true, "fishingNet", 1] call life_fnc_handleInv;

private _fish = selectRandom (getArray(missionConfigFile >> "CfgFishing" >> "fishingItems"));
private _amount = round(random [1, 4, 8]);

if !([true,_fish,_amount] call life_fnc_handleInv) exitWith {
    ["You caught some fish but had to release them as your inventory is full","cyan"] spawn PHX_fnc_notify;
    life_net_dropped = false;
    life_action_inUse = false;
};

[
    format[
        "You've caught a %1 x %2",
        _amount,
        (M_CONFIG(getText,"CfgItems",_fish,"displayName"))
    ],
    "green"
] spawn PHX_fnc_notify;

["Prof_Fishing",1,50] call PHX(increaseProfession);

sleep 1;
life_net_dropped = false;
life_action_inUse = false;