#include "..\..\script_macros.hpp"
/*
    File: fn_searchVehAction.sqf
    Author:

    Description:

*/

params [
    ["_vehicle",cursorObject,[objNull]]
];

private _owners = _vehicle getVariable ["vehicle_info_owners",[]];
if (isNil "_owners") exitWith {NOTIFY("This vehicle has no information, it was probably spawned in through cheats.","red"); deleteVehicle _vehicle;};

life_action_inUse = true;

private _time = 5;
if (player getVariable["isAdmin", false]) then { _time = 0 };

if !(
[
    "Fetching Owners",
    _time,
    [],
    0.01,
    ""
] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_action_inUse = false;

if (player distance _vehicle > 15 || {!alive player} || {!alive _vehicle} || {(isDowned(player))}) exitWith {NOTIFY("Couldn't search the vehicle.","red");};
_owners = [_owners] call life_fnc_vehicleOwners;

if (_owners isEqualTo "any<br/>") then {
    _owners = "No owners, impound it<br/>";
};
hint parseText format ["<t color='#FF0000'><t size='1.7'>Vehicle Info</t></t><br/><t color='#FFD700'><t size='1.5'>Owners</t></t><br/> %1",_owners];
