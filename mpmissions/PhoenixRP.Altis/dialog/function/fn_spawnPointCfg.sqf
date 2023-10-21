#include "..\..\script_macros.hpp"
/*
    File: fn_spawnPointCfg.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master configuration for available spawn points depending on the units side.

    Return:
    [Spawn Marker,Spawn Name,Image Path]
*/

params [["_side",civilian,[civilian]]];

_side = switch (_side) do {
    case west: {"Cop"};
    case independent: {"Medic"};
    case east: {"HAVOC"};
    default {"Civilian"};
};

private _return = [];

private _spawnCfg = missionConfigFile >> "CfgSpawnPoints" >> worldName >> _side;
private ["_tempConfig","_curConfig","_conditions","_flag"];

for "_i" from 0 to count(_spawnCfg)-1 do {

    _tempConfig = [];
    _curConfig = (_spawnCfg select _i);
    _conditions = getText(_curConfig >> "conditions");

    _flag = [_conditions] call life_fnc_levelCheck;

    if (_flag) then {
        _tempConfig pushBack getText(_curConfig >> "spawnMarker");
        _tempConfig pushBack getText(_curConfig >> "displayName");
        _tempConfig pushBack getText(_curConfig >> "icon");
        _return pushBack _tempConfig;
    };
};

if (playerSide isEqualTo civilian) then {

  if (isNil "life_houses" || { isNil "life_gang_houses"} ) exitWith {};

  private _houses = (life_houses + life_gang_houses);
  private _houseName = "";

  if (_houses isEqualTo []) exitWith {};

  {
    _x params ["_house"];

    if ("Spawn" in ((_house getVariable ["house_upgrades",[]]) select 2)) then {
      
      _houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

      if !((_house getVariable ["house_name", ""]) isEqualTo "") then {
        _houseName = format["%1 (%2)", (_house getVariable ["house_name", ""]), _houseName];
      };

      _return pushBack [format ["house_%1",_house getVariable "uid"],_houseName,"data\icons\ico_House.paa"];
    };
  } forEach _houses;
};

_return