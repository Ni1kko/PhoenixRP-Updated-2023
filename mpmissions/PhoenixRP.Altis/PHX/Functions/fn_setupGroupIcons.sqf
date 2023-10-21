/*
*   @File: fn_setupGroupIcons.sqf
*   @Author: Sig
*
*   Description: Draws group icons for players in groups
*
*   Given Arguments (Not needed but will be given on postInit anyways)
*     0 <TYPE: STRING> - PostInit
*     1 <TYPE: BOOLEAN> - Whether the player joined the mssion during progress or not
*/

#include "..\..\script_macros.hpp"

if (!hasInterface || isServer) exitWith {};

// --- Only draw if there is not already a mission handler for it (meaning its not ran through postinit)
if (isNil {missionNameSpace getVariable "PHX_groupIconsDraw"}) then {

  PHX_showHexName = false;
  PHX_hex_color = [
    (profilenamespace getvariable ['IGUI_TEXT_RGB_R',0]),
    (profilenamespace getvariable ['IGUI_TEXT_RGB_G',1]),
    (profilenamespace getvariable ['IGUI_TEXT_RGB_B',1]),
    (profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])
  ];

  // Do as many checks as possible before the handler is added, so that uneccesary checks wont happen each frame
  switch playerSide do {
    case east: {
      missionNameSpace setVariable [ "PHX_groupIconsDraw", addMissionEventHandler [ "Draw3D", {
        {
          _x call PHX(drawGroupIcon);
          true
        } count (playableUnits select {
          side _x isEqualTo east || 
          (isHSS(_x))
        });
      }]];
    };
    case independent: {
      missionNameSpace setVariable [ "PHX_groupIconsDraw", addMissionEventHandler [ "Draw3D", {
        {
          _x call PHX(drawGroupIcon);
          true
        } count (playableUnits select {
          side _x isEqualTo independent || 
          (isDowned(_x))
        });
      }]];
    };
    case west: {
      missionNameSpace setVariable [ "PHX_groupIconsDraw", addMissionEventHandler [ "Draw3D", {
        {
          _x call PHX(drawGroupIcon);
          true
        } count (playableUnits select {
          side _x isEqualTo west || 
          ((isCID(_x)) && _x getVariable ["showBadge",false])
        });
      }]];
    };
    case civilian: {
      missionNameSpace setVariable [ "PHX_groupIconsDraw", addMissionEventHandler [ "Draw3D", {
        {
          _x call PHX(drawGroupIcon);
          true
        } count ([] call PHX(alliedUnits));
      }]];
    };
  };
};
