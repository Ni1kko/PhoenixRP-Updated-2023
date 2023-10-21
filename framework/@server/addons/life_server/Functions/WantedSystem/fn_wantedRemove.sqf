/*
    File: fn_wantedRemove.sqf
    Author: Bryan "Tonic" Boardwine"
    Database Persistence By: ColinM
    Assistance by: Paronity
    Stress Tests by: Midgetgrimm
    Description:
    Removes a person from the wanted list.
*/
scopeName "WantedRemoval";
params [
    ["_uid", "", [""]],
    ["_crime", "", [""]],
    ["_mode", 0, [0]],
    ["_pardoner", objNull, [objNull]]
];

if(_uid isEqualTo "") exitWith {};

private _unit = _uid call BIS_fnc_getUnitByUID;

switch (_mode) do {
    // Wipe all crimes...
    case 0: {
        [format["UPDATE wanted SET removeWanted='1', wantedCrimes='[]', wantedBounty='0', active='0' WHERE wantedID='%1'",_uid], 2] call DB_fnc_asyncCall;
    };

    // Wipe individual crimes...
    case 1: {
        // Get Bounty Value...
        private _crimesConfig = getArray(missionConfigFile >> "CfgSettings" >> "crimes");
        private _indexFirst = [_crime, _crimesConfig] call LIFE_fnc_index;
        if (_indexFirst isEqualTo -1) exitWith {
            [format["An error occured while attempting to remove a crime from %1 (Stage 1)", _unit getVariable["realname", name _unit]]] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
        };

        // Remove Bounty Value...
        private _amount = ((_unit getVariable["life_wantedBounty", 0]) - parseNumber ((_crimesConfig select _indexFirst) select 1));
        if (_amount < 0) then { _amount = 0 };

        private _query = format ["SELECT wantedID FROM wanted WHERE wantedID='%1'",_uid];
        private _queryResult = [_query,2,true] call DB_fnc_asyncCall;
        private _safeAmount = [_amount] call DB_fnc_numberSafe;
        
        if !(count _queryResult isEqualTo 0) then {
            _query = format ["SELECT wantedCrimes FROM wanted WHERE wantedID='%1'",_uid];
            _queryResult = [_query,2] call DB_fnc_asyncCall;
            _pastCrimes = [_queryResult select 0] call DB_fnc_mresToArray;

            private _index = _pastCrimes findIf { _x isEqualTo _crime }; // Returns our index...

            if (_index > -1) then {
                _pastCrimes deleteAt _index;

                private _active = [0,1] select (count _pastCrimes > 0);
                private _remove = [1,0] select (count _pastCrimes > 0);

                _pastCrimes = [_pastCrimes] call DB_fnc_mresArray;

                [
                    format ["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = '%2', removeWanted='%5', active = '%4' WHERE wantedID='%3'",_pastCrimes,_safeAmount,_uid,_active,_remove],
                    1
                ] call DB_fnc_asyncCall;

                // Give feedback if we're told to...
                if !(isNull _pardoner) then {
                    [format["An account of %1 has been removed from %2's record by %3.", (((_crimesConfig select _indexFirst) select 0)), _unit getVariable ["realname",name _unit], _pardoner getVariable ["realname",name _pardoner]]] remoteExec ["PHX_fnc_notify", west];
                };
                breakOut "WantedRemoval";
            };
        };

        // If it makes it here then shits gone down...
        [format["An error occured while attempting to remove a crime from %1", _unit getVariable["realname", name _unit]]] remoteExec ["PHX_fnc_notify", remoteExecutedOwner];
    };
};