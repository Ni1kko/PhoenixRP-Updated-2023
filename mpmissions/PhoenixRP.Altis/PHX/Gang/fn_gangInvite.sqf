/*
	@File: fn_gangInvite.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Invites a player to the gang...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
params [
    ["_remoted", false, [true]],
    ["_group", (grpPlayer), [grpNull]],
	["_houses", [], [[]]]
];

if (isNull _group || { isNil { _group getVariable "gang_owner" } }) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(gangInvite) };

if (_remoted) then {
	private _myName = player getVariable ["realname", name player];
	private _gangName = _group getVariable "gang_name";

	private _action = [
		format [
			"You have been invited to a group called %1<br/>If you accept the invitation you will be a part of their gang and will have access to the group funds and controlled hideouts.",
			_gangName
		],
		"Group Invitation",
		"Yes",
		"No"
	] call PHX_fnc_confirmBox;

	if (_action) then {
		if (isNil { _group getVariable "gang_owner" }) exitWith { ["This group no longer exists and so your invite expired","red"] spawn PHX(notify) };

		[player] join _group;
	
		waitUntil { !(isNil { grpPlayer getVariable "gang_owner" }) };

		_members = _group getVariable "gang_members";
		_members pushBackUnique [_myName, (getPlayerUID player), 0];
		_group setVariable ["gang_members",_members,true];

		player setVariable ["gang_uid", (_group getVariable "gang_id"), true];
		[9] call SOCK_fnc_updatePartial;

		{
			[_x, false] call PHX_fnc_gangHousing;
		} forEach _houses;

		[format["You've joined the group known as %1", _gangName],"green"] spawn PHX(notify);
		[format["%1 has accepted your gang invite", _myName],"green"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];

		player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
	} else {
		[format["%1 has declined your gang invite", _myName],"red"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
	};
} else {
	if !([player, "invi"] call PHX(canDo)) exitWith { ["Your rank does not provide you with the ability to preform this action","red"] spawn PHX(notify) };
	if (count(_group getVariable ["gang_members",8]) isEqualTo (_group getVariable ["gang_maxMembers",8])) exitWith { ["Your group has reached its maximum allowed slots, please upgrade your group slot limit.","red"] spawn PHX(notify) };

	private _curSel = CONTROL_DATA(IDC_GANG_SELLIST);
	if (_curSel isEqualTo "") exitWith { ["Please select someone to invite first","red"] spawn PHX(notify) };
	_curSel = parseSimpleArray _curSel;

	private _target = ((_curSel select 1) call PHX(unitByUID));
	if (isNil "_target" || { isNull _target }) exitWith { ["Please select someone to invite first","red"] spawn PHX(notify) };
	if (isDowned(_target) && { (_target getVariable ["isTazed", false]) } && { (_target getVariable ["isKnockedOut", false]) }) exitWith { ["This person is unable to accept your invite","red"] spawn PHX(notify) };
	if !(isNil {(group _target) getVariable "gang_name"}) exitWith { ["This person is already in a group","red"] spawn PHX(notify) };
	if !((side _target) isEqualTo civilian) exitWith { ["You can't invite people when they're not a civlian","red"] spawn PHX(notify) };
	if (_target isEqualTo player) exitWith { ["You can't invite yourself","red"] spawn PHX(notify) };

	private _action = [
		format ["You are about to invite %1 to your group, if they accept the invite they will have access to the group's funds.",_target getVariable ["realname",name _target]],
		"Group Invitation",
		"Yes",
		"No"
	] call PHX_fnc_confirmBox;

	if (isCID(_target) || { isHSS(_target) }) exitWith {
		[format["%1 has declined your gang invite", _target getVariable ["realname",name _target]], "red"] spawn PHX(notify);
	};

	if (_action) then {
		[true, _group, life_gang_houses] remoteExec ["PHX_fnc_gangInvite", _target];
		[format ["You have sent an invite to %1", _target getVariable ["realname", name _target]],"green"] spawn PHX(notify);
	};
};