/*
 *  @file: fn_inWhitelistGang.sqf
 *  @author: Sig
 *
 *  Description:
 *  Checks if the given unit is in the given whitelisted gang.
 *  Only works to check certain gangs, to check if the player is in
 *  ANY whitelisted gang use fn_whitelistedGang.sqf
 *
 *  Parameter(s)
 *    0: STRING - Config name of the whitelisted gang (from the "Config_Gangs.hpp" config)
 *    1: OBJECT / GROUP / STRING - Unit, group, or id (in string) that is being checked
 *
 *  Return
 *    BOOLEAN - Whether or not the unit is in the whitelisted gang
 */

#include "..\..\script_macros.hpp"

if (!params [["_configName", "", [""]], ["_group", objNull, [grpNull, objNull]]]) exitWith {false};

if (!(playerSide isEqualTo civilian) || {isCID(player)}) exitWith {false};

private _config = missionConfigFile >> "CfgWhitelistedGangs" >> _configName;
if (!isClass (_config)) exitWith {false};

// -- Change the object to its group to make it easier to work with both the possibilty of group and player as argument
if (_group isEqualType objNull) then {_group = group _group};

// -- If the group is of type of group, convert it to the ID in a string
if (_group isEqualType grpNull) then {_group = str (_group getVariable ["gang_ID", -1])};

// -- Check if the groups id is the same as the id listed in the config
_group isEqualTo (getText (_config >> "gangID"))
