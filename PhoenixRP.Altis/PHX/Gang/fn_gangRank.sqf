/*
	@File: fn_gangRank.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows us to demote or promote a member of our group...
*/
scopeName "rankChange";
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"

if !([player, "promote"] call PHX(canDo)) exitWith { ["Your rank does not provide you with the ability to preform this action","red"] spawn PHX(notify) };

private _group = grpPlayer;

private _curSel = lbCurSel IDC_GANG_MEMBERS;
if (_curSel isEqualTo -1) exitWith { ["You need to select a person first","red"] spawn PHX(notify) };

private _selAr = lbData[IDC_GANG_MEMBERS, _curSel];
_selAr = parseSimpleArray _selAr;
_selAr params ["_selName", "_selID", "_rkIndex"];

if (isNil "_selID" || { _selID isEqualTo "" }) exitWith {}; // What?
if ((getPlayerUID player) isEqualTo _selID) exitWith { ["You're unable to alter your own rank","red"] spawn PHX(notify) };

private _unit = _selID call PHX(unitByUID);

private _curSelRK = lbCurSel IDC_GANG_RANK_DROPDOWN;
if (_curSelRK isEqualTo -1) exitWith { ["You need to select a rank first","red"] spawn PHX(notify) };

private _members = _group getVariable ["gang_members", []];
private _ranks = _group getVariable ["gang_ranks", []];

private _memIndex = (_members findIf { (_x select 1) isEqualTo (getPlayerUID player) });
if (_memIndex isEqualTo -1) exitWith {};

private _localRank = ((_members select _memIndex) select 2);

if (_localRank <= _curSelRK) exitWith {  ["You can't promote this perks equal to or above yourself","red"] spawn PHX(notify) };

if (_rkIndex >= _localRank) exitWith { 
	["You can't promote someone above or equal to your rank","red"] spawn PHX(notify); 
	breakOut "rankChange";
};

if (_rkIndex isEqualTo _curSelRK) exitWith { 
	["You can't change someones rank to their current rank","red"] spawn PHX(notify); 
	breakOut "rankChange";
};

private _selRK = lbData[IDC_GANG_RANK_DROPDOWN, _curSelRK];
_selRK = parseSimpleArray _selRK;
_selRK params ["_rkName", "_level", "_isLeader"];

if (_isLeader) exitWith { ["This rank is system protected and so you're unable to change someones rank to this level","red"] spawn PHX(notify) };

private _action = [
    format ["Changing this member of your group to the rank of %1 might add or remove some of their powers. Are you sure you wish to do this?", _selName],
    format ["Change %1's rank", _selName],
    "Yes",
    "Cancel"
] call PHX_fnc_confirmBox;

if (_action) then {
	if (_selID isEqualTo "") exitWith { ["An error occured while changing this persons rank","red"] spawn PHX(notify) };

	private _modAt = (_members findIf { (_x select 1) isEqualTo _selID});
	_members set [_modAt, [_selName, _selID, _curSelRK]];

	_group setVariable ["gang_members", _members, true];

	[10, _group, [_selID, _curSelRK]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

	[format["You've changed %1's rank to %2...", _selName, _rkName],"green"] spawn PHX(notify);
	[24000, "Group"] call PHX(switchApp);

	// They're online... Let's handle it...
	if !(isNull _unit) then {
		[format["%1 has changed your rank to %2", (player getVariable ["realname", name player]), _rkName],"cyan"] remoteExec ["PHX_fnc_notify", _unit];
	};
};