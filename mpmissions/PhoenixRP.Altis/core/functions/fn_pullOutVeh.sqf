#include "..\..\script_macros.hpp"

if (isDowned(player)) then {
  detach player;
  player setVariable ["Escorting",false,true];
  life_disable_getOut = false;
  moveOut player;
  life_disable_getIn = true;
};

if (isRestrained(player)) then {
    detach player;
    player setVariable ["Escorting",false,true];
    life_disable_getOut = false;
    moveOut player;
    ["You have been pulled out of the vehicle", "red"] call PHX_fnc_notify;
    titleFadeOut 4;
    life_disable_getIn = true;
} else {
    moveOut player;
    ["You have been pulled out of the vehicle", "red"] call PHX_fnc_notify;
    titleFadeOut 4;
};