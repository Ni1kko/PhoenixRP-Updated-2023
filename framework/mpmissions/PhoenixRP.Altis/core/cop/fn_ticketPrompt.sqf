#include "..\..\script_macros.hpp"
/*
	@File: fn_ticketPrompt.sqf
	@Author: Bryan "Tonic" Boardwine
    @Modified: Zyn
	@Description: Displays the ticket to the player
*/

params [
    ["_cop", objNull, [objNull]],
    ["_value", 0, [0]]
];

if (isNull _cop) exitWith {};

private _action = [
    format ["%1 has given you a ticket for £%2",_cop getVariable ["realname",name _cop],_value],
    "Ticket",
    "Pay",
    "Refuse"
] call PHX_fnc_confirmBox;

if (_action) then {
    private _subValue = _value;
    if (HAS_PERK("helpfulBenefactor")) then { _subValue = _subValue * 0.7 };

    if (CASH < _value) exitWith {
        if (BANK < _value) exitWith {
            NOTIFY("You don't have enough money in your bank account or on you to pay the ticket","red");
            [1,format["%1 couldn't pay the ticket due to not having enough money.",profileName]] remoteExecCall ["life_fnc_broadcast",_cop];
        };

        [format ["You have paid the ticket of £%1.",[_subValue] call life_fnc_numberText], "green"] call PHX_fnc_notify;
        [_subValue, 1, 1, "Ticket"] call PHX(handleMoney);

        [0,format["%1 paid the ticket of £%2",profileName,[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
        [1,format["%1 paid the ticket.",profileName]] remoteExecCall ["life_fnc_broadcast",_cop];

        [player, format ["%1 (%2) paid a ticket of %3.",profileName,getPlayerUID player,[_subValue] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

        if ((side _cop) isEqualTo west) then {
            [getPlayerUID player] remoteExecCall (["fnc_wantedRemove", "life"] call SOCK_fnc_getRemoteDestination);
        };
    };

    [_subValue, 1, 0, "Ticket"] call PHX(handleMoney);

    if ((side _cop) isEqualTo west) then {
        [getPlayerUID player] remoteExecCall (["fnc_wantedRemove", "life"] call SOCK_fnc_getRemoteDestination);
    };

    [0,format["%1 paid the ticket of £%2",profileName,[_value] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",west];
    [1,format["%1 paid the ticket.",profileName]] remoteExecCall ["life_fnc_broadcast",_cop];

    [player, format ["%1 (%2) paid a ticket of %3.",profileName,getPlayerUID player,[_subValue] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
    [0,format["%1 refused to paid their ticket",profileName]] remoteExecCall ["life_fnc_broadcast",west];
    [1,format["%1 refused to paid their ticket",profileName]] remoteExecCall ["life_fnc_broadcast",_cop];
};

closeDialog 0;