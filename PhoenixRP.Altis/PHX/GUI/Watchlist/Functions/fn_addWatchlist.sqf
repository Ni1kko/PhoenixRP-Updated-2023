#include "..\..\..\..\script_macros.hpp"
/*
 *  File: fn_addWatchlist.sqf
 *  Author: Zyn
 *
 *  Description:
 *  
*/

params [
    ["_house",objNull,[objNull]]
];

private _pos = (getPosATL _house);
private _name = getText(configFile >> "CfgVehicles" >> typeOf(_house) >> "displayname");
private _text = format["%1 at %2",_name,mapGridPosition _house];

if ((count(profileNamespace getVariable ["PHX_Watchlist",[]])) >= 10) exitWith { NOTIFY("You have reached the limit, double click to remove a house.") };
if !(([_pos,(profileNamespace getVariable ["PHX_Watchlist",[]])] call LIFE_fnc_index) isEqualTo -1) exitWith { NOTIFY("House already on watchlist!","red") };
if (isNil { (_house getVariable "house_owner") }) exitWith { NOTIFY("House is not owned!","red") };

[(profileNamespace getVariable ["PHX_Watchlist",[]]),[_text,_pos],0] call PHX_fnc_pushBackAt;

NOTIFY("Successfully added to watchlist","green");