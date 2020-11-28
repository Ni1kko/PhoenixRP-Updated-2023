/*
    File: fn_updateGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Updates the gang information?
*/
scopeName "gangUpdate";
params [
    ["_mode",0,[0]],
    ["_group",grpNull,[grpNull, objNull]],
    ["_data", "", ["", []]]
];

if (isNull _group) exitWith { breakOut "gangUpdate" };
if !(_group isEqualType grpNull) exitWith { diag_log format["Conner this is fucking aids. %1 ? %2 ? 3", _mode, _group, _data] };

private _groupID = _group getVariable ["gang_id", -1];

if (_groupID isEqualTo -1) exitWith {};

private _query = "";
private _owner = "";

switch (_mode) do {
    case 0: {
        private _bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
        private _maxMembers = _group getVariable ["gang_maxMembers",8];
        _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};

        _query = format ["UPDATE phxgangs SET bank='%1', maxmembers='%2', owner='%3' WHERE id='%4'",_bank,_maxMembers,_owner,_groupID];
    };

    case 1: {
        _query = format ["UPDATE phxgangs SET bank='%1' WHERE id='%2'",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
    };

    case 2: {
        _query = format ["UPDATE phxgangs SET maxmembers='%1' WHERE id='%2'",(_group getVariable ["gang_maxMembers",8]),_groupID];
    };

    case 3: {
        _owner = _group getVariable ["gang_owner",""];
        if (_owner isEqualTo "") exitWith {};
        _query = format ["UPDATE phxgangs SET owner='%1' WHERE id='%2'",_owner,_groupID];
    };

    // Remove offline members...
    case 4: {
        _query = format ["UPDATE phxclients SET gangid='-1' WHERE playerid='%1' AND gangid='%2' LIMIT 1", _data, _groupID];
    };

    case 5: {
        private _queryResult = [format ["SELECT id FROM phxgangs WHERE name='%1' AND active='1'", _data],2] call DB_fnc_asyncCall;

        //Check to see if the gang name already exists.
        if !(_queryResult isEqualTo []) exitWith {
            ["There is already a gang created with that name please pick another name."] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
            breakOut "gangUpdate";
        };

        _query = format ["UPDATE phxgangs SET name='%1' WHERE id='%2'",([_data] call DB_fnc_mresString),_groupID];
        _group setVariable ["gang_name", _data, true];
        _group setGroupIDGlobal [_data];

        [format["Your group has been renamed to %1", _data]] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
    };

    case 6: {
        _query = format ["UPDATE phxgangs SET tag='%1' WHERE id='%2'",_data,_groupID];
    };

    // Add new Alliance
    case 7: {
        _data params ["_grpName", "_grpID"];
        _query = format ["INSERT INTO phxalliances (gangID, allyID) VALUES('%1', '%2')", _groupID, _grpID];
    };

    // Remove Alliance
    case 8: {
        _data params ["_id", "_self"];

        if (_self) then {
            _query = format ["UPDATE phxalliances SET active='0' WHERE gangID='%1' AND allyID='%2' AND active='1'", _groupID, _id];
        } else {
            _query = format ["UPDATE phxalliances SET active='0' WHERE gangID='%1' AND allyID='%2' AND active='1'", _id, _groupID];
        };
    };

    // save rank array
    case 9: {
        {
            private _rank = _x;

            for "_i" from 2 to ((count _rank) - 1) do {
                _rank set[_i, [(_rank select _i), 0] call DB_fnc_bool];
            };

            _data set[_forEachIndex, _rank];
        } forEach _data;

        _query = format ["UPDATE phxgangs SET ranks='%1' WHERE id='%2'",([_data] call DB_fnc_mresArray), _groupID];
    };

    // set gang level
    case 10: {
        _data params ["_playerid", "_rankindex"];
        _query = format ["UPDATE phxclients SET ganglevel='%1' WHERE playerid='%2'",([_rankindex] call DB_fnc_numberSafe), _playerid];
    };

    case 11: {
        _query = format ["UPDATE phxgangs SET message='%1' WHERE id='%2'",([_data] call DB_fnc_mresString),_groupID];
    };

    case 12: {
        _query = format ["UPDATE phxgangs SET tax='%1' WHERE id='%2'",([(_group getVariable ["gang_tax",0])] call DB_fnc_numberSafe), _groupID];
    };

    case 13: {
        _query = format ["UPDATE phxgangs SET perks='%1' WHERE id='%2'",([(_group getVariable ["gang_perks",[]])] call DB_fnc_mresArray), _groupID];
    };

    case 14: {
        _query = format ["UPDATE phxgangs SET level='%1' WHERE id='%2'",([(_group getVariable ["gang_level",1])] call DB_fnc_numberSafe), _groupID];
    };

    case 15: {
        _query = format ["UPDATE phxgangs SET xp='%1' WHERE id='%2'",([(_group getVariable ["gang_xp",0])] call DB_fnc_numberSafe), _groupID];
    };
};

if (!isNil "_query") then {
    [_query,1] call DB_fnc_asyncCall;
};
