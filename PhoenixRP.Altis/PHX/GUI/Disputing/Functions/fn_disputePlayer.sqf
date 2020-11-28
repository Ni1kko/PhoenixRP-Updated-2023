/*
	@File: fn_disputePlayer.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Dispute our target...
*/
#include "..\..\..\..\script_macros.hpp"
disableSerialization;

// Get our target...
private _curSel = CONTROL_DATA(9001);
if (_curSel isEqualTo "") exitWith { ["You need to select someone to dispute","red"] spawn PHX(notify) };

private _unit = call compile _curSel;

if (isNull _unit || { !(isPlayer _unit) }) exitWith { ["There was an issue while compiling your selection","red"] spawn PHX(notify) };
if (_unit isEqualTo player) exitWith { ["You can't dispute yourself","red"] spawn PHX(notify) };

// Get our reason...
private _reason = ctrlText 9003;
if ((count (toArray(_reason))) > 20) exitWith { ["You have a max reason length of 20 characters","red"] spawn PHX(notify) };
if (_reason isEqualTo "") then { _reason = "No Reason Entered" };

// Send the dispute...

private _dispute = [
	(player getVariable ["realname", name player]),
	(getPlayerUID player),
	(_unit getVariable ["realname", name _unit]),
	(getPlayerUID _unit),
	_reason
];

_dispute RemoteExecCall ["PHX_fnc_recieveDispute", _unit];

PHX_Disputes pushBack [(_dispute select 2), (_dispute select 4)];
true call PHX(switchDisputes); // Switch to our sent disputes...

_dispute RemoteExecCall (["fnc_logDispute", "PHXSRV"] call SOCK_fnc_getRemoteDestination); // Log it for Staff Panel etc...

// Kyle is a smart boi, wouldn't have thought of this...
CONTROL(9000, 9001) lbSetCurSel -1;
ctrlSetText [9003, ""];