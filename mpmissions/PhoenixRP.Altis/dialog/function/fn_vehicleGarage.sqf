#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleGarage.sqf
    Author: Bryan "Tonic" Boardwine
    Updated to Housing/Garage Configs - BoGuu

    Description:
    Vehicle Garage, why did I spawn this in an action its self?
*/
params [
    ["_garageObj",objNull,[objNull]],
    ["_type","",[""]]
];

private _className = typeOf _garageObj;

if !(isClass (missionConfigFile >> "CfgHousing" >> worldName >> _className)) exitWith {};

private _config = missionConfigFile >> "CfgHousing" >> worldName >> _className;

private _gSettings = getArray(_config >> "garageSettings");
if (_gSettings isEqualTo []) exitWith {};

_gSettings params ["_mTwPos", "_dir"];

life_garage_sp = [(_garageObj modelToWorld _mTwPos),((getDir _garageObj) + _dir)];
life_garage_type = _type;
life_garage_spawn = true;


[getPlayerUID player,playerSide,_type] remoteExecCall (["fnc_getVehicles","TON"] call SOCK_fnc_getRemoteDestination);

createDialog "RscDisplayGarage";
disableSerialization;
ctrlSetText[2802,("Searching database for vehicles...")];