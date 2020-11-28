#include "..\..\script_macros.hpp"
/*
    File: fn_robPerson.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Robs a person.
*/
params [
    ["_robber",objNull,[objNull]]
];

if (isNull _robber || {[] call PHX_fnc_isSafeZone}) exitWith {}; //No one to return it to?

if (CASH > 0) then {
    [CASH,player,_robber] remoteExecCall ["life_fnc_robReceive",_robber];
    if !((side _robber) isEqualTo east) then {
        [getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
    };
    [(format["%1 has stolen £%2 from you!",_robber getVariable ["realname",name _robber],[CASH] call life_fnc_numberText]),"red"] remoteExecCall ["PHX_fnc_notify",player];

    [CASH, 1, 0, (format["Stolen by %1",(_robber getVariable ["realname",name _robber])])] call PHX_fnc_handleMoney;
    [player, format ["%1 (%2) was robbed by %3 (%4) for %5",profileName,getPlayerUID player,_robber getVariable ["realname",name player], getPlayerUID _robber,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    [0] call SOCK_fnc_updatePartial;
} else {
    [(format["%1 doesn't have any money",profileName]),"red"] remoteExecCall ["PHX_fnc_notify",_robber];
};
