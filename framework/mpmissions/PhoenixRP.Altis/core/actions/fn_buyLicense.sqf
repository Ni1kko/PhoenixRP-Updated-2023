#include "..\..\script_macros.hpp"
/*
    File: fn_buyLicense.sqf
    Author: Bryan "Tonic" Boardwine

    Editor: Jack "Scarso" Farhall (Allows Purchasing Through UI)

    Description:
    Called when purchasing a license. May need to be revised.
*/
private _type = CONTROL_DATA(4001);

if (_type isEqualTo "") exitWith {NOTIFY("You have not selected a license to buy!","red")};
if (!isClass (missionConfigFile >> "CfgLicenses" >> _type)) exitWith { systemChat "Bad Entry..." };

private _displayName = M_CONFIG(getText, "CfgLicenses", _type, "displayName");
private _price = M_CONFIG(getNumber, "CfgLicenses", _type, "price");
private _sideFlag = M_CONFIG(getText, "CfgLicenses", _type, "side");
private _varName = LICENSE_VARNAME(_type, _sideFlag);

private _side = switch (_sideFlag) do {case "cop": {west}; case "med" : {independent}; case "civ" : {civilian};};
if !(playerSide isEqualTo _side) exitWith { [format["You must be a %1 to purchase this license!", _sideFlag],"red"] call PHX_fnc_notify };

if (CASH < _price) exitWith {NOTIFY("You do not have enough money!","red")};
[_price, 1, 0, (format["Purchased %1",_displayName])] call PHX(handleMoney);

[format ["You bought a %1 for £%2.", _displayName,[_price] call life_fnc_numberText],"green"] call PHX_fnc_notify;
[player, format ["%1 (%2) purchased a %3 license for %4", profileName, getPlayerUID player, _displayName, [_price] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
missionNamespace setVariable [_varName,true];
[50,"Bought a license"] call PHX_fnc_handleXP;

[2] call SOCK_fnc_updatePartial;
closeDialog 0;