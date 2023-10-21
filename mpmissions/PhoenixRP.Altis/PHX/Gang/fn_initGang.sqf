/*
    File: fn_initGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main initialization for gangs.
*/
#include "..\..\script_macros.hpp"

// Checks...
if !(playerSide isEqualTo civilian) exitWith {}; //What in the hell?
if ((isCID(player)) || { (isHSS(player)) }) exitWith {};
[player] join (createGroup civilian);
if (life_gangData isEqualTo []) exitWith {}; //Dafuq?

//Loop through to make sure there is not a group already created with the gang.
private _group = grpNull;
{
  if ((life_gangData select 0) isEqualTo (_x getVariable ["gang_id", -2])) exitWith { _group = _x };
} forEach allGroups select {!isNil {_x getVariable "gang_name"}};

private _ranks = [];

if !(isNull _group) then {
    [player] join _group;

    // I am the leader, give me my gang...
    if ((life_gangData select 1) isEqualTo (getPlayerUID player)) then {
        _group selectLeader player;
        player setRank "COLONEL";
    };
} else {
    _group = group player;
    _group setVariable ["gang_id",(life_gangData select 0),true];
    _group setVariable ["gang_owner",(life_gangData select 1),true];
    _group setVariable ["gang_name",(life_gangData select 2),true];
    _group setVariable ["gang_tag",(life_gangData select 3),true];
    _group setVariable ["gang_maxMembers",(life_gangData select 4),true];
    _group setVariable ["gang_bank",(life_gangData select 5),true];
    // RESERVED FOR GANG MESSAGE (6)
    // RESERVED FOR OUR GANG RANK (7)
    _group setVariable ["gang_tax",(life_gangData select 8),true];
    _group setVariable ["gang_perks",(life_gangData select 9),true];
    _group setVariable ["gang_level",(life_gangData select 10),true];
    _group setVariable ["gang_xp",(life_gangData select 11),true];
    // RESERVED FOR GANG RANKS (12)
    _group setVariable ["gang_allies",(life_gangData select 13),true];
    _group setVariable ["gang_members",(life_gangData select 14),true];

    if ((life_gangData select 12) isEqualTo []) then {
        {
            private _rank = _x;

            private _rkName = getText(_rank >> "name");
            private _level = getNumber(_rank >> "level");
            private _isLeader = getNumber(_rank >> "isLeader");
            private _invite = getNumber(_rank >> "invite");
            private _kick = getNumber(_rank >> "kick");
            private _promote = getNumber(_rank >> "promote");
            private _upgrade = getNumber(_rank >> "upgrade");
            private _taxExempt = getNumber(_rank >> "taxExempt");

            // Convert the booleans...
            _invite = [_invite, 1] call PHX_fnc_bool;
            _kick = [_kick, 1] call PHX_fnc_bool;
            _isLeader = [_isLeader, 1] call PHX_fnc_bool;
            _promote = [_promote, 1] call PHX_fnc_bool;
            _upgrade = [_upgrade, 1] call PHX_fnc_bool;
            _taxExempt = [_taxExempt, 1] call PHX_fnc_bool;

            _ranks pushBack [_rkName, _level, _isLeader, _invite, _kick, _promote, _upgrade, _taxExempt];
        } forEach ("true" configClasses (missionConfigFile >> "CfgGangs" >> "Ranks"));

        life_gangData set [12,_ranks];

        [9, _group, _ranks] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
    };

    _group setVariable ["gang_ranks",(life_gangData select 12),true];
    _group setGroupIDGlobal [(life_gangData select 2)];
};

if ((life_gangData select 1) isEqualTo (getPlayerUID player)) then {
    private _members = _group getVariable ["gang_members", []];
    private _ranks = _group getVariable ["gang_ranks", []];

    private _memIndex = (_members findIf { (_x select 1) isEqualTo (getPlayerUID player) });
    if (_memIndex isEqualTo -1) exitWith {};

    private _rank = (_members select _memIndex);
    private _trueIndex = (count _ranks - 1);

    if !((_rank select 2) isEqualTo _trueIndex) then {
        _rank set [2, _trueIndex];

        _members set [_memIndex, _rank];

        _group setVariable ["gang_members", _members, true];
        [10, _group, [(getPlayerUID player), _trueIndex]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
    };
};


player setVariable ["gang_uid", (_group getVariable "gang_id"), true];

player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];
PHX_gangMessage = (life_gangData select 6);

["initGang", "Gang Created / Joined"] call PHX(logIt);