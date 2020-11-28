#include "..\..\script_macros.hpp"
/*
    File: fn_reskin.sqf
    Author: Kyle Dorans
      - Redone by Sig
    Description:
    Used for requiping and retexturing gear when the naked bug kicks in
*/

if (diag_tickTime - (uiNameSpace getVariable ["lastReskin", 0]) < 10) exitWith {["You have already used the reskin option, you can only use this feature once every 10 seconds.", "red"] spawn PHX(notify);};

// -- Re-equp their gear and skin their uniform
player setUnitLoadout (getUnitLoadout player);
[] call PHX(playerSkins);

["Your player skins have been reloaded.", "green"] spawn PHX(notify);

uiNameSpace setVariable ["lastReskin", diag_tickTime];