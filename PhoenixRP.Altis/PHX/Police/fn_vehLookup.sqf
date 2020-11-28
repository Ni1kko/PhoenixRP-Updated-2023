/*
	@File: fn_vehLookup.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Looks up a vehicle and display information...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
disableSerialization;

private _plate = ctrlText IDC_WANTED_REG;

// Checking plates...
if (_plate isEqualTo "") exitWith { NOTIFY("You must enter a plate!", "red") };
if ((count _plate) < 3) exitWith { NOTIFY("The plate entered must be larger than 3 characters!", "red") };
if ((count _plate) > 8) exitWith { NOTIFY("The plate entered must be smaller than 8 characters!", "red") };

// Get all my vehicles!
private _vehicles = allMissionObjects "Car";
_vehicles append allMissionObjects "Air";
_vehicles append allMissionObjects "Boat";

// Find it... 
private _veh = _vehicles findIf { (getPlateNumber _x ) isEqualTo _plate };

if (_veh isEqualTo -1) exitWith { NOTIFY("We were unable to find a plate matching your search...", "red") };

_veh = _vehicles select _veh;
if (_veh getVariable ["isHAV", false]) exitWith { NOTIFY("Our records don't contain information on this vehicle...", "red") };

private _vehicleInfo = [typeOf _veh] call life_fnc_fetchVehInfo;

if (_vehicleInfo isEqualTo []) exitWith { NOTIFY("An error occured when attempting to recieve this plate...", "red") };

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

// Getting Vehicle Owners...
private _owners = _veh getVariable "vehicle_info_owners";
if (isNil "_owners" || !alive _vehicle) exitWith { NOTIFY("This vehicle has no information...", "red") };

_owners = (_owners select 0) select 1; // Select the one true owner...
if (_owners isEqualTo "any") then { _owners = "<NULL>" };

// Gettting Vehicle Colour...
private _vehicleColor = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _veh),"textures") select (_veh getVariable "Life_VEH_color")) select 0);
if (isNil "_vehicleColor") then {_vehicleColor = "Default"};

(_display displayCtrl IDC_WANTED_VEH_INFO) ctrlSetStructuredText parseText format[
	"<br/><img image='%1' align='center' size='3' /><br/><br/>" +
	"<t align='left' size='1'>" +
		"Vehicle:<br/><t size='0.8'>%2</t><br/>" +
		"Colour:<br/><t size='0.8'>%3</t><br/>" +
		"Owner:<br/><t size='0.8'>%4</t>" +
	"</t>",
	_vehicleInfo select 2,
	_vehicleInfo select 3,
	_vehicleColor,
	_owners
];