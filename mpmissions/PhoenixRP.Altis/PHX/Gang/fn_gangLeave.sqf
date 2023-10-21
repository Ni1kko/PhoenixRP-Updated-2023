/*
	@File: fn_gangLeave.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Leaves our current gang...
*/
#include "..\..\script_macros.hpp"
private _group = grpPlayer;
private _steamID = getPlayerUID player;

if (_steamID isEqualTo (_group getVariable "gang_owner")) exitWith { ["You cannot leave the group without appointing a new leader first!","red"] spawn PHX(notify) };

private _action = [
    "Are you sure you wish to leave your group?",
    "Leave Group",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;

if (_action) then {
    private _members = _group getVariable "gang_members";

    if (isNil "_members" || { !(_members isEqualType []) }) exitWith {};

    private _delAt = (_members findIf { (_x select 1) isEqualTo _steamID});
    _members deleteAt _delAt;

    _group setVariable ["gang_members", _members, true];

    // Delete all gang housing...
    {
        [_x, true] call PHX_fnc_gangHousing;
    } forEach life_gang_houses;

    [player] joinSilent (createGroup civilian);

    [23100, "Home"] call PHX(switchApp);
    
    player setVariable ["gang_uid", nil, true];
    player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
    life_gangData = [];
    [9] call SOCK_fnc_updatePartial;
};