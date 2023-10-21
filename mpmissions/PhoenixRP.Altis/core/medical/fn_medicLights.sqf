/*
    File: fn_medicLights.sqf
    Author: mindstorm, modified by Adanteh
    Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

    Description:
    Adds the light effect to cop vehicles, specifically the offroad.
*/
#include "..\..\script_macros.hpp"
#define GREENLIGHT [0.1, 20, 0.1]
#define REDLIGHT [20, 0.1, 0.1]
#define THISFNC life_fnc_copLights

params [
    ["_vehicle", objNull, [objNull]],
    ["_sleepTime", 0.22, [0]]
];

if ((isServer && isDedicated) || !hasInterface) exitWith{};

if (isNull _vehicle || {!(_vehicle getVariable ["lights", false])} || {!(_vehicle isKindOf "Car")}) exitWith {};

(switch (typeOf _vehicle) do {

  case "C_Offroad_01_F": { [[-0.37, 0.0, 0.52], [0.37, 0.0, 0.52]] };
  case "C_Offroad_02_unarmed_F": { [[-0.37, 0.0, 0.52], [0.37, 0.0, 0.52]] };
  case "B_MRAP_01_F": { [[-0.50, 1.5, -0.68], [0.50, 1.5, -0.68]] };
  case "C_SUV_01_F": { [[-0.38, 2.22, -0.50], [0.38, 2.22, -0.50]] };
  case "SUV_01_base_red_F": { [[-0.38, 2.22, -0.50], [0.38, 2.22, -0.50]] };
  case "SUV_01_base_black_F": { [[-0.38, 2.22, -0.50], [0.38, 2.22, -0.50]] };
  case "C_Hatchback_01_F": { [[-0.6, 2.0, -0.95], [0.6, 2, -0.95]] };
  case "C_Hatchback_01_sport_F": { [[-0.6, 2.0, -0.95], [0.6, 2, -0.95]] };
  case "C_Hatchback_01_sport_grey_F": { [[-0.6, 2.0, -0.95], [0.6, 2, -0.95]] };
  case "B_LSV_01_unarmed_black_F": { [[-0.38, 2.0, -0.50], [0.38, 2.0, -0.50]] };
  case "O_T_LSV_02_unarmed_black_F": { [[-0.38, 2.22, -0.50], [0.38, 2.22, -0.50]] };
  case "B_G_Van_02_transport_F": { [[-0.38, 2.22, -0.50], [0.38, 2.22, -0.50]] };
  case "C_Van_02_medevac_F": { [[-0.38, 2.22, -0.50], [0.38, 2.22, -0.50]] };

}) params ["_leftPos", "_rightPos"];

private _lightLeft = "#lightpoint" createVehicleLocal (getPos _vehicle);
private _lightRight = "#lightpoint" createVehicleLocal (getpos _vehicle);

// -- Set the color of the left light to blue

{

  sleep 0.2;
  private _Colour = selectRandom [GREENLIGHT, REDLIGHT];
  _X setLightColor _Colour;
  _X setLightBrightness 0.2;
  _x setLightAmbient [0.1,0.1,20];
  _x setLightAttenuation [0.1, 0, 1000, 130];
  _x setLightIntensity 8;
  _x setLightFlareSize 0.38;
  _x setLightFlareMaxDistance 120;
  _x setLightUseFlare true;
  _X setLightDayLight true;

} forEach [_lightLeft, _lightRight];

_lightLeft lightAttachObject [_vehicle, _leftPos];
_lightRight lightAttachObject [_vehicle, _rightPOs];

private _leftRed = true;
for "_i" from 0 to 1 step 0 do {

  if !(_vehicle getVariable ["lights", false]) exitWith {};
  if _leftRed then {

    _leftRed = false;
    _lightright setLightBrightness 0.0;
    sleep 0.05;
    _lightleft setLightBrightness 6;

  } else {

    _leftRed = true;
    _lightleft setLightBrightness 0.0;
    sleep 0.05;
    _lightright setLightBrightness 6;

  };

  sleep _sleepTime;

};

deleteVehicle _lightLeft;
deleteVehicle _lightRight;