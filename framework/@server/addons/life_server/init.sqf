#include "script_macros.hpp"
/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine

    Edit: Nanou for HeadlessClient optimization.
    Please read support for more informations.

    Description:
    Initialize the server and required systems.
*/

life_server_isReady = false;
HC_Active = false;

publicVariable "life_server_isReady";
publicVariable "HC_Active";

serv_sv_use = [];

WORLD = (toLower (worldName));

// Ensure HC_Client doesn't exist across the network, it shouldn't but ArmA...
HC_Client = nil;
publicVariable "HC_Client";

if (EXTDB_SETTING(getNumber,"HeadlessSupport") isEqualTo 1) then {
    "HC_Active" addPublicVariableEventHandler {
        _this params ["", "_value"];
        if (isNil "_value") exitWith {};

        if (_value) then {
            private _owner = owner HC;
            private _uid = getPlayerUID HC;

            if (_uid isEqualTo "" || { _owner <= 0 }) exitWith { ["Headless Client", "Attempted takeover but returned empty UID and invalid owner..."] call PHX_fnc_logIt };

            HC setVariable ["isAdmin", true, true]; // Should stop any functions running on HC we don't want (XP, etc)

            HC_Client = [_uid, _owner];
            publicVariable "HC_Client";

            [
                PHX_curGovernor,
                PHX_noVotes,
                PHX_noOptions,
                PHX_activePolls,
                PHX_doneResults,
                PHX_isEnlistmentOpen,
                PHX_TaxRate,
                PHX_PaycheckRate,
                PHX_RevivalRate,
                PHX_FuelRate,
                PHX_IllegalItems,
                PHX_isWaring
            ] remoteExecCall ["HL_fnc_setGlobalVars", _owner]; // Give us global vars...

            // Terminate Cleanup and Cartel Loops (Headless will take over)...
            cleanupFSM setFSMVariable ["stopfsm",true];
            terminate cleanup;
	    { terminate _x } forEach PHX_CartelLoops;

            ["Headless Client", format["%1 has taken over as headless client...", _uid]] call PHX_fnc_logIt;
        };
    };

    ["HC_Disconnected","onPlayerDisconnected",
        {
            if (!isNil "HC_Client" && { _uid isEqualTo (HC_Client select 0) }) then {
                // Reset Headless Variables...
                HC_Active = false;
                HC_Client = nil;
                publicVariable "HC_Active";
                publicVariable "HC_Client";

                // Restart Server-Side Cleanup...
                cleanupFSM = [] execFSM "\life_server\FSM\cleanup.fsm";
                cleanup = [] spawn TON_fnc_cleanup;
		
		// Restart Capture loops...
		if !(PHX_capZones isEqualTo []) then {
		    [] call PHXSRV_fnc_captureLoop;
		};

                ["Headless Client", format["%1 has disconnected from headless client and the server has resumed control...", _uid]] call PHX_fnc_logIt;
            };
        }
    ] call BIS_fnc_addStackedEventHandler;
};

/*
    Prepare extDB before starting the initialization process
    for the server.
*/

[] call PHXSRV_fnc_getConnection;

waitUntil { !(isNil "life_server_extDB_notLoaded") };
if (life_server_extDB_notLoaded) exitWith {};

/* Run stored procedures for SQL side cleanup */
{
    [_x,1] call DB_fnc_asyncCall;
} forEach [
    "CALL resetLifeVehicles",
    "CALL deleteDeadVehicles",
    "CALL deleteOldHouses",
    "CALL deleteOldGangs",
    "CALL deleteOldRanks",
    "CALL resetSettings",
    "CALL deleteClaimedMail"
];

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "---------------------------------- Starting Altis Life Server Init ---------------------------------";
diag_log format["------------------------------------------ Version %1 -------------------------------------------",(LIFE_SETTINGS(getText,"framework_version"))];
diag_log "----------------------------------------------------------------------------------------------------";

/* Map-based server side initialization. */

{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;

[4,true,30] execFSM "\life_server\FSM\timeModule.fsm";

//---- Set all sides to friends
{
    east setFriend [_x, 1];
    west setFriend [_x, 1];
    independent setFriend [_x, 1];
    civilian setFriend [_x, 1];
} forEach [west, east, independent, civilian];

// Main Whitelisting...
life_adminLevel = 0;
life_medicLevel = 0;
life_copLevel = 0;
life_havoclevel = 0;

// Police Specialised Whitelisting...
life_npaslevel = 0;
life_tpulevel = 0;
life_ctulevel = 0;
life_mpulevel = 0;
life_cidlevel = 0;
life_academylevel = 0;

// HAVOC Specialised Whitelisting...
life_hsslevel = 0;
life_hmulevel = 0;
life_hsflevel = 0;
life_hadlevel = 0;

// NHS Specialised Whitelisting...
life_sarlevel = 0;

CONST(JxMxE_PublishVehicle,"false");

/* Setup radio channels for west/independent/civilian */
life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
PHX_radio_staff = radioChannelCreate [[1, 0, 0, 0.8], "Staff Channel", "%UNIT_NAME", []];
PHX_radio_apcToNHS = radioChannelCreate [[1, 1, 0, 0.8], "APC to NHS [Text]", "%UNIT_NAME", []];
PHX_radio_havToNHS = radioChannelCreate [[1, 1, 0, 0.8], "HAVOC to NHS [Text]", "%UNIT_NAME", []];

/* Event handler for disconnecting players */
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];

/* Miscellaneous mission-required stuff */
cleanupFSM = [] execFSM "\life_server\FSM\cleanup.fsm";

[] spawn TON_fnc_initHouses;
cleanup = [] spawn TON_fnc_cleanup;

PHX_CartelLoops = [];
[] call PHXSRV_fnc_setupCartels;

TON_fnc_playtime_values = [];
TON_fnc_playtime_values_request = [];

//Just incase the Headless Client connects before anyone else
publicVariable "TON_fnc_playtime_values";
publicVariable "TON_fnc_playtime_values_request";

PHX_noVotes = [];
PHX_noOptions = [];
PHX_activePolls = [];
PHX_doneResults = [];
PHX_curGovernor = [];
PHX_isEnlistmentOpen = false;
[] call PHXSRV_fnc_initGovernment;

/*
    @System: Gang Base Wars
    @Author: Jack "Scarso" Farhall
    @Description: Handles setup for Gang Base Wars...
*/
PHX_isWaring = false;
private _baseTiming = ["SELECT DAYNAME(NOW()), TIME(NOW())", 2] call DB_fnc_asyncCall;
_baseTiming params ["_day", "_time"];
_time params ["_hour", "_minute"];

if (_day isEqualTo "Friday" && { _hour >= 20 }) then {
    PHX_isWaring = true;

    ["gbase_NW", -2] call PHXSRV_fnc_setSetting;
    ["gbase_NE", -2] call PHXSRV_fnc_setSetting;
    ["gbase_SW", -2] call PHXSRV_fnc_setSetting;
    ["gbase_wars", 1] call PHXSRV_fnc_setSetting;
} else {
    if ((["gbase_wars"] call PHXSRV_fnc_getSetting) isEqualTo "1") then {

        {
            private _handle = [_x] spawn PHXSRV_fnc_issueBase;
            waitUntil {scriptDone _handle};
        } forEach ["gbase_NW", "gbase_NE", "gbase_SW"];

        ["gbase_wars", 0] call PHXSRV_fnc_setSetting; // It's over...

        ["UPDATE phxbasebids SET active='0'" ,1] call DB_fnc_asyncCall;
    };
};
/* End of Gang Base Wars */

//---- Gang bases
missionNameSpace setVariable ["PHX_Base_NW", (parseNumber (["gbase_NW"] call PHXSRV_fnc_getSetting)), true];
missionNameSpace setVariable ["PHX_Base_NE", (parseNumber (["gbase_NE"] call PHXSRV_fnc_getSetting)), true];
missionNameSpace setVariable ["PHX_Base_SW", (parseNumber (["gbase_SW"] call PHXSRV_fnc_getSetting)), true];

{
    [_x] call PHXSRV_fnc_changeBaseName;
} forEach ["gang_base", "gang_base_1", "gang_base_2"];

// Donation Goal
PHX_dateTime = systemTimeUTC;//call compile("real_date" callExtension "GMT");
PHX_day = PHX_dateTime param [2, 0];


private _isGoal = [parseNumber(["donation_goal_active"] call PHXSRV_fnc_getSetting), 1] call DB_fnc_bool;

if (_isGoal) then {
    missionNameSpace setVariable ["donationGoal", _isGoal, true];

    if ((parseNumber(["automated_goal_end"] call PHXSRV_fnc_getSetting)) isEqualTo 1) then {
        if (PHX_day >= (parseNumber(["goal_end"] call PHXSRV_fnc_getSetting))) then {
            ["donation_goal_active", false] call PHXSRV_fnc_setSetting;
        };
    };
};

/* Setup Major Crime(s) */
#define JCFG missionConfigFile >> "CfgMap"

// Setup Buildings...
{
    private _job = _x;
    private _selection = _x;

    // Multiple choice...
    if (isClass (_x >> "Options")) then {
        _selection = selectRandom ("true" configClasses (_x >> "Options"));
    };

    private _pos = (getArray(_selection >> "position"));
    private _doors = (getArray(_selection >> "doorsToLock"));
    private _objectsToMove = (getArray(_selection >> "moveObjects"));

    {
        private _building = nearestObject [(_pos select _forEachIndex), _x];

        if ((count _doors) > _forEachIndex) then {
            private _doorsToLock = _doors select _forEachIndex;

            if !(_doorsToLock isEqualTo []) then {
                {
                    _building animate [format["door_%1_rot",_x],0];
                    _building setVariable [format ["bis_disabled_Door_%1",_x],1,true];
                } forEach _doorsToLock;
            };
        };

        _building setVariable ["bType", (configName _job), true];
        _building allowDamage false;
    } forEach (getArray(_selection >> "classname"));

    if !(_objectsToMove isEqualTo []) then {
        {
            _x params ["_var", "_pos"];
            private _object = missionNamespace getVariable [_var, objNull];

            if !(isNull _object) then {
                _object setPos [_pos select 0, _pos select 1, _pos select 2];
            };
        } forEach _objectsToMove;
    };
} forEach ("true" configClasses (JCFG >> "JobBuildings"));

// Setup different vaults...
{
    _x setVariable ["state", [false, false], true];
} forEach [fed_bank, evidence_locker];

/* Tell clients that the server is ready and is accepting queries */
life_server_isReady = true;
publicVariable "life_server_isReady";

server_corpses = [];
addMissionEventHandler ["EntityRespawned", {_this call TON_fnc_entityRespawned}];

PHX_IllegalItems = [];

// Items that get their legality from the database....
{
    private _legality = getText (_x >> "illegal");
    private _illegal = format["legality_%1", _legality];
    private _isIllegal = [(parseNumber ([_illegal] call PHXSRV_fnc_getSetting)),1] call DB_fnc_bool;

    if (_isIllegal) then { PHX_IllegalItems pushBackUnique _legality };
    
    private _marker = getArray(missionConfigFile >> "CfgSettings" >> (format["%1_markers", _legality]));
    if !(_marker isEqualTo []) then {
        {
            [
                _x, 
                ([
                    "ColorCIV",
                    "ColorEAST"
                ] select (_isIllegal))
            ] call PHXSRV_fnc_changeMarker;
        } forEach _marker;
    };
} count ("!(isNumber (_x >> 'illegal'))" configClasses (missionConfigFile >> "CfgItems"));

// Update Database values from configs (Used for Net worth cal etc)
{
    private _vehicle = [format ["SELECT classname FROM infocars WHERE classname='%1' LIMIT 1", (configName _x)], 2] call DB_fnc_asyncCall;

    private _name = ([(configName _x)] call life_fnc_fetchVehInfo);
    if !((count _name) < 2) then {
        _name = [(_name select 3)] call DB_fnc_mresString;

        private _price = (getNumber(_x >> "price"));
        private _sellPrice = (_price * LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier"));

        if !(_vehicle isEqualTo []) then {
            [format ["UPDATE infocars SET friendlyName = '%2', buyPrice = '%3', sellPrice = '%4', storage = '%5' WHERE classname='%1' LIMIT 1", 
                (configName _x), 
                _name,
                _price, 
                _sellPrice,
                (getNumber(_x >> "vItemSpace"))
            ], 1] call DB_fnc_asyncCall;
        } else {
            [format["INSERT INTO infocars (classname, friendlyName, buyPrice, sellPrice, storage) VALUES ('%1', '%2', '%3', '%4', '%5')",
                (configName _x), 
                _name,
                _price, 
                _sellPrice,
                (getNumber(_x >> "vItemSpace"))
            ], 1] call DB_fnc_asyncCall;
        };
    };
} forEach ("true" configClasses (missionConfigFile >> "LifeCfgVehicles"));

// Sync before the restart
[] spawn {
	waitUntil {serverTime > 14280};
	[] remoteExec ["SOCK_fnc_updateRequest",-2];
	["Your data has been synced to the database as the restart is coming soon!","green"] remoteExec ["PHX_fnc_notify",-2];
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"]) then {
			_dbInfo = _veh getVariable["dbInfo",[]];

			if(count _dbInfo > 0) then {
				[_veh, 2] spawn TON_fnc_vehicleUpdate;
			};
		};
	} forEach vehicles;
    missionNameSpace setVariable ["PHX_Restart", true, true];
};


private _valuesToEnter = [];
private _storesToIgnore = getArray(missionConfigFile >> "CfgSettings" >> "storesToIgnore");
private _cfgs = [[ ("true" configClasses (missionConfigFile >> "CfgClothing" >> worldName)), [ "uniforms", "headgear", "goggles", "vests", "backpacks" ] ]];
_cfgs pushBack [ ("true" configClasses (missionConfigFile >> "CfgWeapons" >> worldName)), [ "weps", "mags", "accs", "items" ] ];

// First we'll add all the clothing shit...

// Private them outside cuz it faster...
private ["_store", "_type", "_details", "_current", "_idx"];

{
    _x params ["_theCfg", "_types"];

    {
        if !((configName _x) in _storesToIgnore) then {
            _store = _x;

            {
                _type = (getArray(_store >> _x) select { 
                    !((_x select 0) in ["", "NONE"]) 
                });

                {
                    _x params ["_className", "_name", "_price"];

                    if (_price > 0) then {
                        _idx = (_valuesToEnter findIf { (_x select 0) isEqualTo _className });

                        if (_idx > -1) then {
                            _current = _valuesToEnter select _idx;
                            _valuesToEnter set[_idx, [_className, (_current select 1), (((_current select 2) + _price) / 2)]];
                        } else {
                            _details = [_className] call life_fnc_fetchCfgDetails;

                            if ((count _details) < 2) then {
                                ["initServer", format["Item '%1' returned invalid details...", _className], (str _details)] call PHX_fnc_logIt;
                            } else {
                                _name = (_details select 1);
                            };

                            _valuesToEnter pushBack [_className, _name, _price];
                        };
                    };
                } forEach _type;
            } forEach _types;
        };
    } forEach _theCfg;
} forEach _cfgs;

{
    _x params ["_className", "_friendlyName", "_price"];

    private _item = [format ["SELECT className FROM iteminfo WHERE className='%1' LIMIT 1", _className], 2] call DB_fnc_asyncCall;

    if !(_item isEqualTo []) then {
        [format ["UPDATE iteminfo SET price = '%1' WHERE className='%2' LIMIT 1", 
            _price, 
            _className
        ], 1] call DB_fnc_asyncCall;
    } else {
        [format["INSERT INTO iteminfo (className, friendlyName, price) VALUES ('%1', '%2', '%3')",
            _className, 
            _friendlyName, 
            _price
        ], 1] call DB_fnc_asyncCall;
    };
} forEach _valuesToEnter;

diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of Altis Life Server Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";

// Foggy Woggy Poggy
for "_i" from 0 to 1 step 0 do {
    if ( fog > 0.05 || { rain >= 0.05 } ) then {
        0 setFog 0;
        0 setRain 0;
    };
    sleep 300;
};
