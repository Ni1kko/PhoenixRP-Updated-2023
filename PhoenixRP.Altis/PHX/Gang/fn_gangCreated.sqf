#include "..\..\script_macros.hpp"
/*
    File: fn_gangCreated.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Tells the player that the gang is created and throws him into it.
*/
life_action_gangInUse = nil;

private _group = grpPlayer;

if (BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
    [format ["You do not have enough money in your bank account. You lack: £%1",[((LIFE_SETTINGS(getNumber,"gang_price"))-BANK)] call life_fnc_numberText],"red"] spawn PHX(notify);
    {_group setVariable [_x,nil,true];} forEach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

[LIFE_SETTINGS(getNumber,"gang_price"), 1, 1, "Created Gang"] call PHX(handleMoney);
[format ["You have created the gang %1 for £%2",_group getVariable "gang_name",[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText],"green"] spawn PHX(notify);

[player, format ["%1 (%2) created a gang for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[LIFE_SETTINGS(getNumber,"gang_price")] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

player setVariable ["gang_uid", (_group getVariable "gang_id"), true];
[100,"Created a group"] call PHX_fnc_handleXP;
[9] call SOCK_fnc_updatePartial;