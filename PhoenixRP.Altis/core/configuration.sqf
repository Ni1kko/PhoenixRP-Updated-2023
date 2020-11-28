#include "..\script_macros.hpp"
/*
    File: configuration.sqf
    Author:

    Description:
    Master Life Configuration File
    This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/

life_firstSpawn = true;
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = objNull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_siren_active = false;
life_clothing_filter = 0;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_holstering = false;
life_spikestrip = objNull;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_frozen = false;
life_disable_getIn = false;
life_disable_getOut = false;
life_canpay_bail = true;
weightNotficiation = time;

//Settings
life_settings_enableNewsBroadcast = profileNamespace getVariable ["life_enableNewsBroadcast", true];
life_settings_enableSidechannel = profileNamespace getVariable ["life_enableSidechannel", true];
life_settings_tagson = profileNamespace getVariable ["life_settings_tagson", true];
life_settings_revealObjects = profileNamespace getVariable ["life_settings_revealObjects", true];
life_settings_intro = profileNamespace getVariable ["life_settings_intro", false];
PHX_hideHUD = profileNamespace getVariable ["life_settings_hud", false];
life_settings_player = profileNamespace getVariable ["life_settings_player", true];
life_settings_viewDistanceFoot = profileNamespace getVariable ["life_viewDistanceFoot", 1250];
life_settings_viewDistanceCar = profileNamespace getVariable ["life_viewDistanceCar", 1250];
life_settings_viewDistanceAir = profileNamespace getVariable ["life_viewDistanceAir", 1250];
PHX_NameColour = profileNamespace getVariable ["nameColour", "default"];
PHX_iconSel = profileNamespace getVariable ["iconSel", ""];
PHX_Title = profileNamespace getVariable ["titleSel", ""];
PHX_settings_streamerMode = profileNamespace getVariable ["PHX_settings_streamerMode", false];
PHX_settings_disableGroupIcons = profileNamespace getVariable ["PHX_settings_disableGroupIcons", false];
PHX_settings_tabletBackground = profileNamespace getVariable ["PHX_BG", "default"];
PHX_lowDetail = profileNamespace getVariable ["PHX_lowDetail", false];
PHX_settings_notify = profileNamespace getVariable ["PHX_settings_notify", false];
PHX_settings_invisibleBackpack = profileNamespace getVariable ["PHX_invisibleBackpack",true];
PHX_setTitleButton = -1;

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1, -1, -1, -1, -1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = LIFE_SETTINGS(getNumber, "default_maxWeight");
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_use_atm = true;
life_is_arrested = false;
life_is_arrested_police = false;
life_is_arrested_havoc = false;

life_jail_time = 0;
life_thirst = 100;
life_hunger = 100;

life_istazed = false;
life_isknocked = false;
life_vehicles = [];

PHX_Drinks = [];
PHX_Food = [];
PHX_UseableItems = [];
PHX_saveableItems = []; // Array of items that save...
PHX_SlowDeath_Food = scriptNull;
PHX_SlowDeath_Water = scriptNull;

PHX_Statistics = [];

PHX_Level = 1;
PHX_XP = 0;
PHX_Perks = [];

PHX_Achievements = [];

PHX_originalList = [];

PHX_bleedFaster = false;
PHX_isBleedingFaster = false;
PHX_canRespawn = false;
PHX_canRequest = true;
PHX_effects = [];

PHX_hideHUD = false;
PHX_Last_hideHUD = false;

PHX_createdElements = [];
PHX_UI_Elements = [];

PHX_curApp = "Home";

PHX_ProcessingVendor = objNull;

PHX_endTime = 0;
PHX_coolDown = false;
PHX_recievedUpdate = false;
PHX_gatherNot = true;

PHX_Mannequin = objNull;
PHX_Mannequin_Dir = -1;
PHX_Camera = objNull;
PHX_isMouseMoving = false;
PHX_MouseHandlerIndexes = [];

PHX_Cash = 0;
PHX_ATMCash = 0;
PHX_Cash_434 = 0;
PHX_Cash_785 = 0;
PHX_Cash_681 = 0;
PHX_Cash_145 = 0;
PHX_Old_Cash = 0;
PHX_Old_ATM = 0;

PHX_isInterruptable = false;

PHX_DEFAULT_GEAR = "civ_gear";
// Gear Saves...
PHX_LIFE_GEAR = [];
PHX_CID_Gear = [];
PHX_HSS_Gear = [];
PHX_LAW_Gear = []; // Lawyer
PHX_TAX_Gear = []; // Taxi
PHX_SER_Gear = []; // Breakdown Service
PHX_NEW_Gear = []; // News
PHX_SO1_Gear = [];
PHX_saveGear = true;

PHX_SideChosen = false;
PHX_MySide = "";

PHX_myInbox = [];

PHX_DonatorLevel = 0;
PHX_PrestigeLevel = 0;
PHX_canPrestige = false;

PHX_Disputes = [];
PHX_Recieved_Disputes = [];

PHX_ID = -1;
PHX_UID = -1;

PHX_noVotes = [];
PHX_noOptions = [];
PHX_activePolls = [];
PHX_doneResults = [];
PHX_curGovernor = [];
PHX_isEnlistmentOpen = false;
PHX_isGovernmentSetup = false;
PHX_isPM = false;

PHX_DoingMission = false;
PHX_LastPatrol = []; 
PHX_NHS_Responding = false;

PHX_IllegalItems = [];

PHX_Trackers = [];

PHX_barrier_placed = [];

PHX_preload = false;

PHX_drugs = 0;
PHX_drink = 0;

phx_curpage = 0;

PHX_Main_Objects = [];

PHX_isSkyDiving = false;

PHX_inAction = false;

PHX_isJudge = false;

/*
    Master Array of items?
*/
//Setup variable inv vars.
{
    missionNamespace setVariable [ITEM_VARNAME(configName _x), 0];
    
    // Setup Eat/Drink Settings...
    private _cfgEdible = (_x >> "edibility"); // Config....

    // Variables...
    private _isEdible = (getArray(_cfgEdible >> "edible")) select 0;
    private _type = (getArray(_cfgEdible >> "edible")) select 1;
    private _item = getText(_x >> "variable");

    if (_isEdible isEqualTo 1) then {
        switch (_type) do {
            case "Hunger": {
                PHX_Food pushBack _item;
            };
            case "Thirst": {
                PHX_Drinks pushBack _item;
            };
            default { // Both...
                PHX_Drinks pushBack _item;
                PHX_Food pushBack _item;
            };
        };

        PHX_UseableItems pushBack _item;
    };

    if ((getNumber(_x >> "save")) isEqualTo 1) then { PHX_saveableItems pushBack _item }; // Array of items to save...
} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

// Licenses
{
    _varName = getText(_x >> "variable");
    _sideFlag = getText(_x >> "side");

    SVAR_MNS [LICENSE_VARNAME(_varName,_sideFlag), false];
} forEach ("true" configClasses (missionConfigFile >> "CfgLicenses"));

// Professions
{
	_varName = getText(_x >> "variable");

	SVAR_MNS [PROF_VARNAME(_varName),0];
} foreach ("true" configClasses (missionConfigFile >> "CfgProfessions"));

if (isNil { profileNamespace getVariable "PHX_Transactions" }) then {
    (profileNameSpace setVariable ["PHX_Transactions",[]])
};

if (isNil { profileNamespace getVariable "PHX_Watchlist" }) then {
    (profileNameSpace setVariable ["PHX_Watchlist",[]])
};