/**
 ** @File: fn_colorConfigToRGBA.sqf
 ** @Author: Sig
 **
 ** Description: Similar to BIS_fnc_colorConfigToRGBA, only a bit more optimized
 **
 ** Argument(s):
 **   0: STRING / CONFIG - Name of the colorConfig, or the config itself
 **
 ** Return:
 **   ARRAY - Valid RGBA array
 **/

#include "..\..\script_macros.hpp"

scopeName "main";
if (!params [["_config", configNull, [configNull, "", []], 4]]) exitWith {[0,0,0,0]};

if !(_config isEqualType []) then {
  if !(_config isEqualType configNull) then {
    _config = configFile >> "CfgMarkerColors" >> _config >> "color";
  };

  if (isArray (_config)) then {_config = getArray _config} else {[0,0,0,0] breakOut "main"};
};

_config apply {
  if !(_x isEqualType 0) then {
    // Can't use parsenumber because of "profilenamespace getvariable things"
    call compile _x
  } else {
    _x
  }
}