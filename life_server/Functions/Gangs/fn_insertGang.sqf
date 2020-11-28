#include "\life_server\script_macros.hpp"
/*
    File: fn_insertGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Inserts the gang into the database.
*/
params [
    ["_unit",objNull,[objNull]],
    ["_uid","",[""]],
    ["_gangName","",[""]],
    ["_ranks", [], [[]]]
];

private _group = group _unit;

if (isNull _unit || {_uid isEqualTo ""} || {_gangName isEqualTo ""}) exitWith {}; //Fail

_gangName = [_gangName] call DB_fnc_mresString;

private _query = format ["SELECT id FROM phxgangs WHERE name='%1' AND active='1'",_gangName];
private _queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if the gang name already exists.
if !(_queryResult isEqualTo []) exitWith {
    [1,"There is already a gang created with that name please pick another name."] remoteExecCall ["life_fnc_broadcast",_unit];
    life_action_gangInUse = nil;
    _unit publicVariableClient "life_action_gangInUse";
};

_query = format ["SELECT id FROM phxgangs WHERE id='%1'",_uid];
_queryResult = [_query,2] call DB_fnc_asyncCall;

//Check to see if this person already owns or belongs to a gang.
if !(_queryResult isEqualTo []) exitWith {
    [1,"You are currently already active in a gang, please leave the gang first."] remoteExecCall ["life_fnc_broadcast",_unit];
    life_action_gangInUse = nil;
    _unit publicVariableClient "life_action_gangInUse";
};

[format ["INSERT INTO phxgangs (owner, name, perks, ranks) VALUES('%1','%2', '""[]""', '%3')", _uid, _gangName, ([_ranks] call DB_fnc_mresArray)], 1] call DB_fnc_asyncCall;

_group setVariable ["gang_name",_gangName,true];
_group setVariable ["gang_owner",_uid,true];
_group setVariable ["gang_perks",[],true];
_group setVariable ["gang_ranks",_ranks,true];
_group setVariable ["gang_bank",0,true];
_group setVariable ["gang_tax",0,true];
_group setVariable ["gang_level",0,true];
_group setVariable ["gang_xp",0,true];
_group setVariable ["gang_maxMembers",8,true];
_group setVariable ["gang_allies",[],true];
_group setGroupIDGlobal [_gangName];

uiSleep 0.35;
_query = format ["SELECT id FROM phxgangs WHERE owner='%1' AND active='1'",_uid];

_queryResult = [_query,2] call DB_fnc_asyncCall;

_group setVariable ["gang_id",(_queryResult select 0),true];
_group setVariable ["gang_members",[[(_unit getVariable ["realname", name _unit]), _uid, ((count (_ranks)) - 1)]],true];

[_group] remoteExecCall ["PHX_fnc_gangCreated",_unit];