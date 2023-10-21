/*
	@File: fn_gangKick.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Kicks a member from the gang... (Offline and Online)
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
params [
    ["_remoted", false, [true]],
    ["_group", (grpPlayer), [grpNull]]
];

if (isNull _group) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(gangKick) };

if (_remoted) then {
    if !(grpPlayer isEqualTo _group) exitWith {}; // What?
    if (PHX_curApp in ["Group", "Create Group"]) then { [23100, "Home"] call PHX_fnc_switchApp };

    {
        [_x, true] call PHX_fnc_gangHousing;
    } forEach life_gang_houses;

    [player] joinSilent (createGroup civilian);

    player setVariable ["gang_uid", nil, true];
    [9] call SOCK_fnc_updatePartial;
    
    ["You have been kicked out of your group","red"] spawn PHX(notify);
    player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
    life_gangData = [];
} else {
    if !([player, "kick"] call PHX(canDo)) exitWith { ["Your rank does not provide you with the ability to preform this action","red"] spawn PHX(notify) };
    private _curSel = lbCurSel IDC_GANG_MEMBERS;
    if (_curSel isEqualTo -1) exitWith { ["You need to select a person first","red"] spawn PHX(notify) };

    private _selAr = lbData[IDC_GANG_MEMBERS, _curSel];
    _selAr = parseSimpleArray _selAr;
    _selAr params ["_selName", "_selID", "_rkIndex"];

    if (isNil "_selID" || { _selID isEqualTo "" }) exitWith {}; // What?
    if ((getPlayerUID player) isEqualTo _selID) exitWith { ["You can't kick the gang leader","red"] spawn PHX(notify) };
    if ((_group getVariable ["gang_owner", _selID]) isEqualTo _selID) exitWith { ["You can't kick yourself","red"] spawn PHX(notify) };

    private _unit = _selID call PHX(unitByUID);
    private _unitID = _selID;
    
    if !(isNull _unit) then { _unitID = getPlayerUID _unit };

    private _action = [
        format["Are you sure you wish to kick %1 from your group?", _selName],
        "Kick Confirmation",
        "Yes",
        "No"
    ] call PHX_fnc_confirmBox;

    if (_action) then {
        if (_unitID isEqualTo "") exitWith { ["An error occured while transfering ownership","red"] spawn PHX(notify) };

        if !(isNull _unit) then {
            [true, _group] remoteExec ["PHX_fnc_gangKick", _unit];
        };

        private _members = _group getVariable "gang_members";
        _members = _members - [[_selName, _selID, _rkIndex]];
        _group setVariable ["gang_members",_members,true];

        [4, _group, _unitID] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

        [format["You've kicked %1 out of the group", _selName],"red"] spawn PHX(notify);
        [24000, "Group"] call PHX(switchApp);
    };
};