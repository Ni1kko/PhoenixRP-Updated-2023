#include "..\..\..\..\script_macros.hpp"
/*
    File: fn_wireTransfer.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Figure it out again.
*/

private _value = parseNumber(ctrlText 2702);
private _unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
private _check = "lLl913ifZAPSeZgUqyeR";
if (isNull _unit || { _unit isEqualTo player }) exitWith {};
if ((lbCurSel 2703) isEqualTo -1) exitWith {["You need to select someone to transfer to", "red"] call PHX_fnc_notify;};
if (isNil "_unit") exitWith {["The player selected doesn't seem to exist", "red"] call PHX_fnc_notify;};
if (_value > 999999) exitWith {["You can't transfer more then £999,999", "red"] call PHX_fnc_notify;};
if (_value < 0) exitWith {};
if (!([str(_value)] call LIFE_fnc_isNumber)) exitWith {["The player selected doesn't seem to exist", "red"] call PHX_fnc_notify;};
if (_value > BANK) exitWith {["You don't have that much in your bank account!", "red"] call PHX_fnc_notify;};

private _tax = (_value * (PHX_TaxRate / 100));
if (HAS_PERK("professionalBanker")) then { _tax  = _tax  * 0.5 };
private _withTax = round(_value + _tax);

if (_withTax > BANK) exitWith {[format ["You do not have enough money in your bank account, to transfer £%1 you will need £%2 as a tax fee.", _value,_tax], "red"] call PHX(notify);};

[_withTax, 1, 1, (format["Transferred to %1",(_unit getVariable ["realname",name _unit])])] call PHX_fnc_handleMoney;

[_value,profileName,_check] remoteExecCall ["PHX_fnc_wireTransferClient",_unit];
[_unit] call PHX_fnc_atmMenu;
[format ["You have transfered £%1 to %2. A tax fee of £%3 was taken for the wire transfer.", [_value] call life_fnc_numberText,_unit getVariable ["realname",name _unit],[_tax] call life_fnc_numberText], "green"] call PHX(notify);
[1] call SOCK_fnc_updatePartial;

[player, format ["%1 (%2) transferred %3 to %4 (%5). Bank Balance: %6 On Hand Balance: £%7",profileName,(getPlayerUID player),[_value] call life_fnc_numberText,_unit getVariable ["realname",name _unit],(getPlayerUID _unit),[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);