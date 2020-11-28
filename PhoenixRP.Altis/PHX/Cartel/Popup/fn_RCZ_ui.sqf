/*
*   @File: fn_RCZ_ui.sqf
*   @Author: Sig
*
*   Description: Handles the user interface for the player in the zone
*   (Mainly progressbar)
*
*   Arguments
*     0 <TYPE: STRING> - Mode that determines what to do with the ui
*     1 <TYPE: OBJECT> - Zone (empty helipad)
*
*   Return: Nothing
*/

#define __layer "RscCapture"

if (!params [["_mode", "", [""]], ["_obj", objNull, [objNull]]]) exitWith {};

switch _mode do {

  case "init": {

    uiNameSpace setVariable ["PHX_barHandle", [_obj] spawn {

      params ["_obj"];
      (_obj getVariable ["PHX_zoneMarkers", []]) params [["_capZone", "", [""]], ["_objMarker", "", [""]]];

      (__layer call BIS_fnc_RscLayer) cutRsc [__layer, "PLAIN", 0];

      private _ui = uiNameSpace getVariable [__layer, displayNull];
      private _bar = _ui displayCtrl 50001;
      private _text = _ui displayCtrl 50002;
      private _subText = _ui displayCtrl 50003;

      for "_i" from 0 to 1 step 0 do {

        // -- If the hud's disappeared it will attempt to recreate the hud
        if (isNull _ui) then {
          _ui = uiNameSpace getVariable [__layer, displayNull];
          _bar = _ui displayCtrl 50001;
          _text = _ui displayCtrl 50002;
          _subText = _ui displayCtrl 50003;
        };

        private _progress = _obj getVariable ["PHX_progress", 0];

        // -- Set the title for the progressbar
        private _title = switch true do {
          case (player getVariable ["isAdminOnDuty", false]): {"Get out of admin gear to capture"};
          case (player getVariable ["SupportOnDuty", false]): {"Get out of support gear to capture"};
          case (!isNull objectParent player): { "Leave the vehicle to capture" };
          case !([player] call PHX_fnc_hasGroup): { "You need to be in a group to capture this zone" };
          case (currentWeapon player isEqualTo "" || { (currentWeapon player) in ["Rangefinder", "Binocular"] }): { "You need a weapon out to capture" };
          case (_obj getVariable ["PHX_zoneCaptured", false]): {"The zone has been captured"};
          case (count ([_capZone, group player, false, "_x call PHX_fnc_hasGroup && {!(playerSide isEqualTo independent)}"] call PHX_fnc_unitsInZone) > 0): { "The zone is contested, capturing has been paused" };
          default { "Capturing the zone" };
        };

        _text ctrlSetText format ["%2%3", _title, round ((_progress min 1) * 100), "%"];
        _subText ctrlSetText format["%1",_title];
        ["add", [_bar, _progress]] call PHX_fnc_progressBar;
        uiSleep 0.1;

      };

    }];

  };
  case "unLoad": {

    // -- Terminate the ui script handle
    private _handle = uiNameSpace getVariable ["PHX_barHandle", scriptNull];
    if (!isNull _handle) then {
      terminate _handle
    };
    __layer cutFadeOut 0;

  };

};
