/*
*   @File: fn_progressBar.sqf
*   @Author: Sig
*
*   Description: Handles the progressbar in terms of creating it,
*   adding progress to it, and deleting the progressbar
*
*   Arguments
*     0 <TYPE: STRING> - Mode that determines what to do with the progressbar
*     1 <TYPE: ARRAY> - Additional parameters
*
*   Return: Nothing
*/

#include "..\..\script_macros.hpp"
#define __layer "RscCapture"
#define BARID 50001

params [
  ["_mode", "init", [""]],
  ["_params", [], [[]]]
];

private _ret = false;

switch _mode do {

  // -- Initalize the progressbar
  case "init": {

    _params params [["_fadeInTime", 0, [0]], ["_customLayerName", __layer, [""]]];

    (__layer call BIS_fnc_RscLayer) cutRsc [__layer, "PLAIN", 0];

    private _ui = uiNameSpace getVariable [__layer, displayNull];

    //(_ui displayCtrl BARID) progressSetPosition 0;

    _ret = _ui;

  };
  // -- Add progress to the progressbar
  // -- If (_params # 2) is true, (_params # 1) will be used to add on top of the current progress,
  // -- otherwise it will set the current progress to (_params # 1)
  case "add": {

    _ret = _params spawn {
      disableSerialization;
      params [["_control", controlNull, [controlNull]], ["_progress", 0, [0]], ["_add", false, [false]]];

      private _curProgress = progressPosition _control;

      // -- If the progresbar is where it needs to be dont do anything
      if (!_add && {_curProgress isEqualTo _progress}) exitWith {};


      // -- Calculate how much progress to add each time
      private _times = 50;
      private _toAdd = ([_progress - _curProgress, _progress] select _add) / _times;

      for "_i" from 1 to _times do {

        _curProgress = _curProgress + _toAdd;
        _control progressSetPosition _curProgress;

        sleep 0.001;

      };

    };

  };
  // -- Get rid of the progressbar
  case "unLoad": {

    _params spawn {

      params [["_fadeTime", 0, [0]], ["_handle", scriptNull, [scriptNull]], ["_customLayerName", __layer, [""]], ["_doWait", true, [false]]];

      if (!isNull _handle && _doWait) then {
        waitUntil {scriptDone _handle};
      };
      [_customLayerName, _fadeTime] call PHX(destroyLayer);
      _ret = false;

    };

  };

};

_ret
