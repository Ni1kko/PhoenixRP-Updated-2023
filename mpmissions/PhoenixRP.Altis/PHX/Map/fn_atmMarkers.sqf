/*
* @File: atmMarkers.sqf
* @Author: ArrogantBread
*
* Copyright (C) Nathan "ArrogantBread" Wright  - All Rights Reserved - PhoenixRP
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Nathan "ArrogantBread" Wright
*/

//--- Client Only
if (!hasInterface || isServer) exitWith {};

//--- ATMS
private _ATMPosArr = getArray (missionConfigFile >> "CfgATM" >> worldName);
ATMARRAY = _ATMPosArr;
if !(_ATMPosArr isEqualTo []) then {
  {
    private _mark = createMarkerLocal [format["atm_%1", _x], _x];
    _mark setMarkerTypeLocal "loc_Tourism";
    _mark setMarkerColorLocal "ColorGreen";
    _mark setMarkerShapeLocal "ICON";
  } forEach _ATMPosArr;
};