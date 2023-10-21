/*
	@File: fn_gangNewLeader.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Transfers gang ownership (Offline and Online)
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
params [
    ["_remoted", false, [true]],
    ["_group", (grpPlayer), [grpNull]]
];

if (isNull _group) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(gangNewLeader) };

if (_remoted) then {
    if !((grpPlayer) isEqualTo _group) exitWith {}; // What?

    player setRank "COLONEL";
    _group setVariable ["gang_owner", (getPlayerUID player), true];

    ["You're now the owner of the group","green"] spawn PHX(notify);
} else {
    private _curSel = lbCurSel IDC_GANG_MEMBERS;
    if (_curSel isEqualTo -1) exitWith { ["You need to select a person first","red"] spawn PHX(notify) };

    private _selAr = lbData[IDC_GANG_MEMBERS, _curSel];
    _selAr = parseSimpleArray _selAr;
    _selAr params ["_selName", "_selID"];

    if (isNil "_selID" || { _selID isEqualTo "" }) exitWith {}; // What?
    if ((getPlayerUID player) isEqualTo _selID) exitWith { ["You can't set yourself as the leader","red"] spawn PHX(notify) };

    private _unit = _selID call PHX(unitByUID);
    private _unitID = _selID;
    
    private _action = [
        format ["You are about to transfer leadership over to %1 <br/>By transferring leadership you will no longer be in control of the group unless ownership is transferred back.", _selName],
        "Transfer Group Leadership",
        "Yes",
        "No"
    ] call PHX_fnc_confirmBox;

    if (_action) then {
        if (_unitID isEqualTo "") exitWith { ["An error occured while transfering ownership","red"] spawn PHX(notify) };

        _group setVariable ["gang_owner", _unitID, true];
        private _members = _group getVariable "gang_members";

        private _rankCnt = (count (_group getVariable "gang_ranks"));
        private _leaderIndex = (_rankCnt - 1);
        private _oldLeaderIndex = (_rankCnt - 2);

        {
            _x params ["_id", "_index"];
            private _modAt = (_members findIf { (_x select 1) isEqualTo _id});
            _members set [_modAt, [(_members select _modAt select 0), _id, _index]];
        } forEach [
            [(getPlayerUID player), _oldLeaderIndex], 
            [_selID, _leaderIndex]
        ];
        
        _group setVariable ["gang_members", _members, true];

        if !(isNull _unit) then {
            _group selectLeader _unit;
            [true, _group] remoteExec ["PHX_fnc_gangNewLeader", _unit];
        };

        [3, _group] remoteExecCall ["TON_fnc_updateGang",RSERV];
        [10, _group, [(getPlayerUID player), _oldLeaderIndex]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
        [10, _group, [_selID, _leaderIndex]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

        [format["You've transfered ownership of the gang to %1", _selName],"green"] spawn PHX(notify);
        [player, format ["%1 (%2) has set %3 (%4) to the new gang leader of %5.",name player,getPlayerUID player, name _unit, getPlayerUID _unit, _group getVariable "gang_name"], "https://rcon.phoenixrp.co.uk/api/v1/log/civilian"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
        [24000, "Group"] call PHX(switchApp);
    };
};