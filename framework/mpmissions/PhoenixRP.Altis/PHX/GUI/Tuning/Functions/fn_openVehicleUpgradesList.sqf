/*
	@File: fn_openVehicleUpgradesList.sqf
	@Author: Jack "Scarso" Farhall
	@Modified: Zyn
	@Description: Opens the Vehicle Upgrades UI...
*/

#include "..\..\..\..\script_macros.hpp"
params [
  "", "", "",
  ["_marker", "", [""]]
];

if (_marker isEqualTo "") exitWith {};

PHX_MyCars = ((nearestObjects [getMarkerPos _marker, ["Car", "Air", "Ship"], 30]) select {
	((_x getVariable ["vehicle_info_owners", []] param [0, []]) param [0, "-1"]) isEqualTo getPlayerUID player &&
	(count (_x getVariable ["vehicle_info_owners", []])) > 0
});

if ((count PHX_MyCars) <= 0) exitWith { NOTIFY("You have no vehicles near the tunning store!", "red"); closeDialog 0; };

createDialog "RscVehicleUpgradesList";
waitUntil { !isNull (findDisplay 32000) };

private _vehList = CONTROL(32000, 32001);
lbClear _vehList;

{
	private _className = typeOf _x;

	_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
	_vehList lbAdd (_vehicleInfo select 3);
	_vehList lbSetPicture [(lbSize _vehList)-1,(_vehicleInfo select 2)];
	_vehList lbSetData [(lbSize _vehList)-1,str(_forEachIndex)];
} forEach PHX_MyCars;