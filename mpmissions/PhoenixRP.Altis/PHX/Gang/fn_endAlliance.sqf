/*
	@File: fn_endAlliance.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Ends an alliance we have with a group...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"

private _group = grpPlayer;

private _curSel = lbCurSel IDC_GANG_ALLIES;
if (_curSel isEqualTo -1) exitWith { ["You need to select a gang first","red"] spawn PHX(notify) };

private _selAr = lbData[IDC_GANG_ALLIES, _curSel];
_selAr = parseSimpleArray _selAr;
_selAr params ["_selName", "_selID"];

if (isNil "_selID" || { _selID isEqualTo "" }) exitWith {}; // Should never happen...

private _action = [
	format["Are you sure you wish to end your alliance with %1?", _selName],
	"Alliance Confirmation",
	"Yes",
	"No"
] call PHX_fnc_confirmBox;

if (_action) then {
	private _gangs = [_group];

	private _allyMember = (playableUnits findIf {
		side _x isEqualTo civilian && 
		{ (_x getVariable ["gang_uid", -1]) isEqualTo _selID }
	});

	if (_allyMember > -1) then {
		private _allyGroup = (group (playableUnits select _allyMember));

		[format["%1 has ended their alliance with your group", _group getVariable "gang_name"],"cyan"] remoteExec ["PHX_fnc_notify", (units _allyGroup)];

		_gangs pushBack _allyGroup;
	};

	[format["Your group has ended their alliance with %1", _selName],"cyan"] remoteExec ["PHX_fnc_notify", (units _group)];

	{
		private _allies = _x getVariable "gang_allies";
		_allies = _allies - [[_selName, _selID]];
		_x setVariable ["gang_allies",_allies,true];
	} forEach _gangs;
	
	[8, _group, [_selID, true]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
	[8, _group, [_selID, false]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

	[24000, "Group"] call PHX(switchApp);
};