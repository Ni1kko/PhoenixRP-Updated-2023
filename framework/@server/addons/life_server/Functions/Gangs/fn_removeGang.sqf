#include "\life_server\script_macros.hpp"
/*
    File: fn_removeGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Removes gang from database
*/
if !(params [["_group", grpNull, [grpNull]]]) exitWith {};

private _groupID = _group getVariable ["gang_id",-1];
if (_groupID isEqualTo -1) exitWith {};

[format ["UPDATE phxgangs SET owner = 'null', active='0' WHERE id='%1'", _groupID],1] call DB_fnc_asyncCall;
[format ["UPDATE phxclients SET gangid = '-1', ganglevel = '0' WHERE gangid='%1'", _groupID],1] call DB_fnc_asyncCall;
[format ["UPDATE phxranks SET active = '0' WHERE gangID='%1'", _groupID],1] call DB_fnc_asyncCall;

uiSleep 3;

private _result = [format ["SELECT id FROM phxgangs WHERE active='1' AND id='%1'",_groupID],2] call DB_fnc_asyncCall;

if (_result isEqualTo []) then {
    [true, _group] remoteExec ["PHX_fnc_gangDisband",(units _group)];
    uiSleep 5;
    deleteGroup _group;
};

["CALL deleteOldGangs", 1] call DB_fnc_asyncCall;
["CALL deleteOldRanks", 1] call DB_fnc_asyncCall;