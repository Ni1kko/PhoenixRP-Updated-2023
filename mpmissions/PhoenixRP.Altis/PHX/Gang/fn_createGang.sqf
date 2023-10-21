/*
    File: fn_createGang.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pulls up the menu and creates the gang with the name the user enters in.
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
scopeName "gangCreation";

disableSerialization;

private _gangName = ctrlText (CONTROL(IDD_TABLET_MAIN,IDC_CREATE_GANG_NAME));

if (count (toArray(_gangName)) > 32) exitWith {NOTIFY("You can't have an organisation name longer then 32 characters.","red")};

if (((toArray (_gangName)) findIf {!(_x in (toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_ ")))}) > -1) exitWith {
    ["You have invalid characters in your organisation name. It can only consist of numbers and letters with an underscore."] spawn PHX(notify);
};

if (BANK < (LIFE_SETTINGS(getNumber,"gang_price"))) exitWith {
    [
        format ["You do not have enough money in your bank account. You lack: £%1", 
        [((LIFE_SETTINGS(getNumber,"gang_price")) - BANK)
    ] call life_fnc_numberText]] spawn PHX(notify);
};

private _ranks = [];

{
    private _rank = _x;

    private _rkName = getText(_rank >> "name");
    private _level = getNumber(_rank >> "level");
    private _isLeader = getNumber(_rank >> "isLeader");
    private _invite = getNumber(_rank >> "invite");
    private _kick = getNumber(_rank >> "kick");
    private _promote = getNumber(_rank >> "promote");
    private _upgrade = getNumber(_rank >> "upgrade");
    private _taxExempt = getNumber(_rank >> "taxExempt");

    // Convert the booleans...
    _invite = [_invite, 1] call PHX_fnc_bool;
    _kick = [_kick, 1] call PHX_fnc_bool;
    _isLeader = [_isLeader, 1] call PHX_fnc_bool;
    _promote = [_promote, 1] call PHX_fnc_bool;
    _upgrade = [_upgrade, 1] call PHX_fnc_bool;
    _taxExempt = [_taxExempt, 1] call PHX_fnc_bool;

    _ranks pushBack [_rkName, _level, _isLeader, _invite, _kick, _promote, _upgrade, _taxExempt];
} forEach ("true" configClasses (missionConfigFile >> "CfgGangs" >> "Ranks"));

[player, getPlayerUID player, _gangName, _ranks] remoteExec (["fnc_insertGang", "TON"] call SOCK_fnc_getRemoteDestination);

[player, format ["%1 - %2 created a group named: %3 for %4",profileName,(getPlayerUID player),_gangName,[(LIFE_SETTINGS(getNumber,"gang_price"))] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

["Sending information to server please wait..."] spawn PHX(notify);
[23100, "Home"] call PHX(switchApp);
life_action_gangInUse = true;