/*
    @File: fn_startAlliance.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Starts an alliance we have with a group...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
params [
    ["_remoted", false, [true]],
    ["_group", (grpPlayer), [grpNull]],
	["_unit",objNull,[objNull]]
];

if (isNull _group || { isNil { _group getVariable "gang_owner" } }) exitWith {
	if (_remoted) then {
		["An error occured while requesting this alliance","red"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
	};
};

if !(canSuspend) exitWith { _this spawn PHX(gangAlliance) };

if (_remoted) then {
	if (PHX_settings_ignoreRequests) exitWith {};
	private _myGroup = grpPlayer;

	private _myGangName = _myGroup getVariable "gang_name";
	private _gangName = _group getVariable "gang_name";

	private _action = [
		format [
			"%1 from %2 has requested that your group, %1, join theirs in an alliance. This will share the locations of both groups to eachother. Are you sure you wish to accept an alliance?",
			(_unit getVariable ["realname",name _unit]),
			_myGangName,
			_gangName
		],
		"Alliance Invitation",
		"Yes",
		"No"
	] call PHX_fnc_confirmBox;

	if (_action) then {
		if (isNil { _myGroup getVariable "gang_owner" }) exitWith { ["Your group appears to no longer exist. If this is an error report it to staff.","red"] spawn PHX(notify) };
		if (isNil { _group getVariable "gang_owner" }) exitWith { ["This group no longer exists and so your request expired","red"] spawn PHX(notify) };

		private _gangInfo = [_gangName, (_group getVariable "gang_id")];
		private _myGangInfo = [_myGangName, (_myGroup getVariable "gang_id")];

		private _allies = _group getVariable "gang_allies";
		private _myAllies = _myGroup getVariable "gang_allies";
		
		_allies pushBack _myGangInfo;
		_myAllies pushBack _gangInfo;

		_group setVariable ["gang_allies", _allies, true];
		_myGroup setVariable ["gang_allies", _myAllies, true];

		[7, _myGroup, _gangInfo] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
		[7, _group, _myGangInfo] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

		[format["Your group has now started an alliance with %1", _gangName],"green"] remoteExec ["PHX_fnc_notify", (units (_myGroup))];
		[format["%1 has accepted your alliance request", _myGangName],"green"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
	} else {
		[format["%1 has declined your alliance request", _myGangName],"cyan"] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
	};
} else {
	private _curSel = CONTROL_DATA(IDC_GANG_SELLIST);
	if (_curSel isEqualTo "") exitWith { ["Please select a group to request an alliance with","red"] spawn PHX(notify) };
	if (PHX_coolDown) exitWith { NOTIFY("You can only send an alliance request every 10 minutes!","red")};
	_curSel = parseSimpleArray _curSel;

	_curSel params ["_grpName", "_grpID"];

	if (_grpID isEqualTo (_group getVariable "gang_id")) exitWith { ["You can't request an alliance with your group","red"] spawn PHX(notify) };

	private _targetGrp = (_grpID call PHX(groupByID));
	if (isNil "_targetGrp" || { isNull _targetGrp }) exitWith { ["Please select a group to request an alliance with","red"] spawn PHX(notify) };
	if (isNil {_targetGrp getVariable "gang_name"}) exitWith { ["This group appears to not exist","red"] spawn PHX(notify) };

	private _target = ((_targetGrp getVariable "gang_owner") call PHX(unitByUID));
	if (isNil "_target" || { isNull _target }) exitWith { ["The owner of this group is currently offline and so can't accept your request","red"] spawn PHX(notify) };

	private _action = [
		format ["Your about to request an alliance with the group known as %1. This will give them access to the locations of your members. Are you sure you wish to request an alliance?", _grpName],
		"Alliance Invitation",
		"Yes",
		"No"
	] call PHX_fnc_confirmBox;

	if (_action) then {
		[true, _group, player] remoteExec ["PHX_fnc_startAlliance", _target];
		[format ["You have sent an alliance request to %1", _grpName],"green"] spawn PHX(notify);
		[] spawn {
			PHX_coolDown = true;
			sleep 10;
			PHX_coolDown = false;
		};
	};
};