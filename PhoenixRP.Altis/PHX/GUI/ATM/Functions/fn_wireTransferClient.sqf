#include "..\..\..\..\script_macros.hpp"
/*
    File: fn_wireTransferClient.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Initiates the wire-transfer
*/
params [
    ["_value",0,[0]],
    ["_from","",[""]],
    ["_check","",[""]]
];

if (_value isEqualTo 0 || {_from isEqualTo ""} || {_from isEqualTo profileName}) exitWith {};

if (_check isEqualTo "lLl913ifZAPSeZgUqyeR") then {
    [_value, 0, 1, (format["Transferred from %1",_from])] call PHX(handleMoney);
    [format ["%1 has wire transferred £%2 to you",_from,[_value] call life_fnc_numberText],"green"] call PHX_fnc_notify;

    [player, format ["%1 (%2) received via wire transfer %3 from $4 (%5). Bank Balance: %6 On Hand Balance: %7",profileName,getPlayerUID player,[_value] call life_fnc_numberText,_from,getPlayerUID _from,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

} else {
    //[player,"moneyspawn",3] remoteExecCall ["PHX_fnc_staffMessage",-2];
};