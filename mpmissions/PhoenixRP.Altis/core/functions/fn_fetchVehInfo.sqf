#include "..\..\script_macros.hpp"
/*
    File: fn_fetchVehInfo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Used in returning information about a vehicle from Config >> "CfgVehicles"

    Return:
    0: classname
    1: scope
    2: picture
    3: displayname
    4: vehicleclass
    5: side
    6: faction
    7: Base / Superclass
    8: Max Speed
    9: Armor Rating
    10: Passenger Seats
    11: Max Horse power
    12: Fuel Capacity
*/

if (!params [["_class", "", [""]]]) exitWith {[]};
if (_class isEqualTo "" || {!isClass (configFile >> "CfgVehicles" >> _class)}) exitWith {[]}; //Class doesn't exist in CfgVehicles

#define CLASS(type, name) type (configFile >> "CfgVehicles" >> _class >> name)

[
  _class,
  CLASS(getNumber, "scope"),
  CLASS(getText, "picture"),
  CLASS(getText, "displayName"),
  CLASS(getText, "vehicleClass"),
  CLASS(getNumber, "side"),
  CLASS(getText, "faction"),
  BASE_CONFIG("CfgVehicles",_class),
  CLASS(getNumber, "maxSpeed"),
  CLASS(getNumber, "armor"),
  CLASS(getNumber, "transportSoldier"),
  CLASS(getNumber, "enginePower"),
  CLASS(getNumber, "fuelCapacity")
]
