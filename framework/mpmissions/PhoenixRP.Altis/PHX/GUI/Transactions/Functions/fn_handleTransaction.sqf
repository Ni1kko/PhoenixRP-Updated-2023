#include "..\..\..\..\script_macros.hpp"
/*
 *  File: fn_handleTransaction.sqf
 *  Author: Zyn
 *
 *  Description:
 *  
 *  Arguments:
 *    0 <TYPE: STRING> - Transaction information
 *    0 <TYPE: INTEGER> - Where it takes it from
 *    0 <TYPE: INTEGER> - The amount involved in the transaction
 *    0 <TYPE: INTEGER> - IN (1) | OUT (0)
*/

params [
    ["_text","",[""]],
	["_operation", -1, [0]],
    ["_amount", -1, [0]],
    ["_type", 0, [1]]
];

if (_text isEqualTo "" || { _amount isEqualTo -1 }) exitWith {};

private _array = [[_text,_operation,_amount,"-"],[_text,_operation,"-",_amount]] select (_type isEqualTo 1);

[(profileNamespace getVariable ["PHX_Transactions",[]]),_array,0] call PHX_fnc_pushBackAt;

if ((count(profileNamespace getVariable ["PHX_Transactions",[]])) > 100) then {
	(profileNamespace getVariable ["PHX_Transactions",[]]) resize 100;
};

[player, format["[%1,%2,%3,%4]",_text,_operation,_amount,_type], "https://rcon.phoenixrp.co.uk/api/v1/log/transaction"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);