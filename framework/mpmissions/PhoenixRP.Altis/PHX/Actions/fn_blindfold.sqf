/*
  File: fn_blindfoldAction.sqf
  Author: Zyn
  Description: Blindfolds a player
*/

if(player getVariable ["blindfolded",true]) then {
  cutText ["","BLACK IN"];
  ["You have been un-blindfolded", "green"] call PHX_fnc_notify;
  player setvariable ["blindfolded",false,true];
 } else {
  cutText ["","BLACK OUT"];
  ["You have been blindfolded", "red"] call PHX_fnc_notify;
  player setvariable ["blindfolded",true,true];
};

