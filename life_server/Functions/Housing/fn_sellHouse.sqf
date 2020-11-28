/*
    File: fn_sellHouse.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in selling the house, sets the owned to 0 and will cleanup with a
    stored procedure on restart.
*/
params [
    ["_house",objNull,[objNull]],
    ["_isGang", false, [true]]
];

if (isNull _house) exitWith {systemChat ":SERVER:sellHouse: House is null";};

private _query = "";
private _houseID = _house getVariable ["house_id",-1];

if (_houseID isEqualTo -1) then {
    private _housePos = getPosATL _house;
    private _ownerID = (_house getVariable "house_owner") select 0;
    _query = format ["UPDATE phxhouses SET owned='0', pos='[]' WHERE pid='%1' AND pos='%2' AND world = '%3' AND gang = '%4' AND owned='1'",
        _ownerID, _housePos, WORLD, ([_isGang, 0] call DB_fnc_bool)
    ];
} else {
    _query = format ["UPDATE phxhouses SET owned='0', pos='[]' WHERE id='%1' AND world = '%2' AND gang = '%3'", _houseID, WORLD, ([_isGang, 0] call DB_fnc_bool)];
};

[format ["UPDATE phxcategories SET active = '0' WHERE houseid='%1'", _houseID],1] call DB_fnc_asyncCall;

_house setVariable ["house_id",nil,true];
_house setVariable ["house_owner",nil,true];
_house setVariable ["garageBought",false,true];

[_query,1] call DB_fnc_asyncCall;
_house setVariable ["house_sold",nil,true];
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;