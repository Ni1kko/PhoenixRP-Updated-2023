/*
    File: fn_queryPlayerGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Queries to see if the player belongs to any gang.
*/
params [
    ["_uid", "", [""]],
    ["_gangID", -1, [0, ""]]
];

private _queryResult = [format ["SELECT phxgangs.id, phxgangs.owner, phxgangs.name, phxgangs.tag, phxgangs.maxmembers, phxgangs.bank, phxgangs.message, PHXClients.ganglevel, phxgangs.tax, phxgangs.perks, phxgangs.level, phxgangs.xp, phxgangs.ranks FROM phxgangs INNER JOIN phxclients WHERE phxgangs.active='1' AND phxgangs.id='%1' AND PHXClients.playerid = '%2'", _gangID, _uid],2] call DB_fnc_asyncCall;

if !(_queryResult isEqualTo []) then {
    _queryResult params ["_id"];

    _queryResult set[9, ([(_queryResult select 9)] call DB_fnc_mresToArray)];

    private _new = [(_queryResult select 12)] call DB_fnc_mresToArray;

    // Convert numbers to bools...
    {
        private _rk = _x;

        for "_i" from 2 to ((count _rk) - 1) do {
            _rk set [_i, ([(_rk select _i), 1] call DB_fnc_bool)];
        };
        
        _new set [_forEachIndex, _rk]; // Update this rank...
    } forEach _new;
    
    _queryResult set[12, _new];

    private _allies = [format["SELECT phxgangs.name, PHXAlliances.allyID FROM phxalliances INNER JOIN phxgangs WHERE PHXAlliances.gangID = '%1' AND phxgangs.active = '1' AND PHXAlliances.active = '1' AND PHXAlliances.allyID = phxgangs.id", _id], 2, true] call DB_fnc_asyncCall;
    _queryResult set [13, _allies];
    
    private _members = [format["SELECT name, playerid, ganglevel FROM phxclients WHERE gangid = '%1'", _id], 2, true] call DB_fnc_asyncCall;
    _queryResult set [14, _members];

    private _ranks = [format["SELECT name, level, isLeader, invite, kick, promote, upgrade, taxExempt FROM phxranks WHERE gangid = '%1' AND active='1' ORDER BY level ASC", _id], 2, true] call DB_fnc_asyncCall;
};

_queryResult