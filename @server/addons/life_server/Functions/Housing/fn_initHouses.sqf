/*
    File: fn_initHouses.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Initalizes house setup when player joins the server.
*/

/* Convert old gear array... 
private _crates = [format["SELECT * FROM phxcategories WHERE old = '1'"], 2, true] call DB_fnc_asyncCall;

if (_crates isEqualType []) then {
    {
        _x params ["_id", "_houseid", "_categoryid", "_title", "_icon", "_storage"];
        
        private _new = [_storage] call DB_fnc_mresToArray;
        _storage = _new;

        if !(_storage isEqualTo []) then {
            _storage = _storage select 0;
        };

        _storage = [_storage] call DB_fnc_mresArray;
        [format["UPDATE phxcategories SET storage = '%1', old = '0' WHERE id = '%2'", _storage, _id], 1, true] call DB_fnc_asyncCall;
    } forEach _crates;
};
*/
private _curDate = [] call PHXSRV_fnc_getDate;
if (_curDate isEqualType false) then { diag_log "[PHXSRV][ERROR] Unable to acquire todays date..." };

private ["_rent", "_forceSold", "_gangOwnerID"];

{
    _x params ["_countQ", "_query"];

    private _count = ([_countQ, 2] call DB_fnc_asyncCall) select 0;

    for "_i" from 0 to _count step 10 do {
        private _queryResult = [format[_query, _i, WORLD],2,true] call DB_fnc_asyncCall;

        if (_queryResult isEqualTo []) exitWith {};
        
        {     
            _forceSold = false;   
            _gangOwnerID = "";
            _x params ["_id", "_steamid", "_pos", "_name", "_garage", "_gang", "_names", "_upgrades", "_rentPaid", "_funds"];

            if ((count _x) > 9) then { _gangOwnerID = _x select 9 };

            _gang = [_gang, 1] call DB_fnc_bool;

            _house = nearestObject [(parseSimpleArray _pos), "House"];
            
            /* Handle Rent...
            if (_curDate isEqualType [] && { !(_curDate isEqualTo _rentPaid) }) then {
                _rent = getNumber(missionConfigFile >> "CfgHousing" >> WORLD >> (typeOf _house) >> "rent");

                if (_rent > _funds) then {
                    [format ["UPDATE phxhouses SET owned='0', pos='[]' WHERE id='%1' AND world = '%2' AND gang = '%3'", _id, WORLD, ([_gang, 0] call DB_fnc_bool)], 1] call DB_fnc_asyncCall;

                    _funds = _funds + round((getNumber(missionConfigFile >> "CfgHousing" >> WORLD >> (typeOf _house) >> "price")) / 2);
                    _funds = [_funds] call DB_fnc_numberSafe;
                    [objNull, format ["%1 house sold. Funds: %2. Rent: %3",_steamid,[_funds] call LIFE_fnc_numberText,[_rent] call LIFE_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/house"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

                    [
                        ([
                            format["UPDATE phxclients SET bankacc = '%1' WHERE playerid = '%2'", _funds, _steamid],
                            format["UPDATE phxgangs SET bank = '%1' WHERE id = '%2'", _funds, _steamid]
                        ] select (_gang)), 1
                    ] call DB_fnc_asyncCall;

                    // Storage Handling...
                    _id call {
                        if !(_this params [
                            ["_id", -1, [0, ""]]
                        ]) exitWith {};

                        if (_id isEqualType "") then { _id = ([_id] call DB_fnc_numberSafe) };

                        private _categories = [format["SELECT * FROM phxcategories WHERE houseid = '%1' AND active = '1'",
                            _id
                        ], 2, true] call DB_fnc_asyncCall;

                        if !(_categories isEqualType []) exitWith {};

                        private _items = [];

                        {
                            _x params ["", "", "", "", "", "_storage"];

                            _storage = [_storage] call DB_fnc_mresToArray;

                            _items append _storage;
                        } forEach _categories;

                        {
                            _x params ["_classname", "_count"];

                            private _type = switch (true) do {
                                case (isClass(missionConfigFile >> "CfgItems" >> _className)): {'""Virtual Item""'};
                                default {'""Physical Item""'};
                            };
    
                            ["House Inventory", ([_gangOwnerID, _steamid] select (_gangOwnerID isEqualTo "" && { !_gang })), _type, format['""%1""', _classname], _count, false] call PHXSRV_fnc_sendMail;
                        } forEach (_items select { !((_x select 0) isEqualTo "") });
                    };

                    [format ["UPDATE phxcategories SET active = '0' WHERE houseid='%1'", _id],1] call DB_fnc_asyncCall;

                    _forceSold = true;
                } else {
                    if (_rent > 0) then {
                        _funds = _funds - _rent;
                        _funds = [_funds] call DB_fnc_numberSafe;

                        [
                            ([
                                format["UPDATE phxclients SET bankacc = '%1' WHERE playerid = '%2'", _funds, _steamid],
                                format["UPDATE phxgangs SET bank = '%1' WHERE id = '%2'", _funds, _steamid]
                            ] select (_gang)), 1
                        ] call DB_fnc_asyncCall;

                        [format ["UPDATE phxhouses SET rent_paid=CURDATE() WHERE id='%1' AND world = '%2' AND gang = '%3'", _id, WORLD, ([_gang, 0] call DB_fnc_bool)], 1] call DB_fnc_asyncCall;
                    };
                };
            };
            */

            if !(_forceSold) then {
                if (_gang) then { _steamid = parseNumber (_steamid) };

                if !(_names isEqualTo "") then {
                    _house setVariable ["house_name", _names, true];
                };

                _house setVariable ["house_owner", [_steamid, _name, _gang], true];
                _house setVariable ["house_id", _id, true];

                if (_garage isEqualTo 1) then {
                    _house setVariable ["garageBought",true,true];
                };

                for "_i" from 1 to (getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors")) do {
                    _house setVariable [format ["bis_disabled_Door_%1",_i],1,true];
                };

                if !(_upgrades isEqualTo "") then {
                    _upgrades = [_upgrades] call DB_fnc_mresToArray;
                    _house setVariable ["house_upgrades", _upgrades, true];
                } else {
                    _house setVariable ["house_upgrades", [0,0,[]], true];
                    [1, _house] call TON_fnc_updateHouse;
                };
            };
        } forEach _queryResult;
    };
} forEach [
    [
        format["SELECT COUNT(*) FROM phxhouses WHERE world = '%1' AND gang ='0' AND owned='1'", WORLD],
        "SELECT phxhouses.id, phxhouses.pid, phxhouses.pos, phxclients.name, phxhouses.garage, phxhouses.gang, phxhouses.name, phxhouses.upgrades, phxhouses.rent_paid, phxclients.bankacc FROM phxhouses INNER JOIN phxclients WHERE phxhouses.world='%2' AND phxhouses.owned='1' AND phxhouses.pid = phxclients.playerid LIMIT %1,10"
    ],
    [
        format["SELECT COUNT(*) FROM phxhouses WHERE world = '%1' AND gang ='1' AND owned='1'", WORLD],
        "SELECT phxhouses.id, phxhouses.pid, phxhouses.pos, phxgangs.name, phxhouses.garage, phxhouses.gang, phxhouses.name, phxhouses.upgrades, phxhouses.rent_paid, phxgangs.bank, phxgangs.owner FROM phxhouses INNER JOIN phxgangs WHERE phxhouses.world='%2' AND phxhouses.owned='1' AND phxhouses.pid = phxgangs.id LIMIT %1,10"
    ]
];

private _blacklistedHouses = (getArray(missionConfigFile >> "CfgHousing" >> WORLD >> "blacklistedHousing"));
if (_blacklistedHouses isEqualTo []) exitWith {};

{
    _x params ["_classname", "_position"];

    _obj = nearestObject [_position, _className];

    if !(isNull _obj) then {
        _obj setVariable ["isBlacklisted", true, true];
    };
} forEach _blacklistedHouses;