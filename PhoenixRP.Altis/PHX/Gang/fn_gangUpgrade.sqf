/*
    File: fn_gangUpgrade.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Determinds the upgrade price and blah
*/
#include "..\..\script_macros.hpp"

if !([player, "upgrade"] call PHX(canDo)) exitWith { ["Your rank does not provide you with the ability to preform this action","red"] spawn PHX(notify) };

private _group = group player;

private _maxMembers = _group getVariable ["gang_maxMembers",8];
private _slotUpgrade = _maxMembers + 4;
private _upgradePrice = round(_slotUpgrade * ((LIFE_SETTINGS(getNumber,"gang_upgradeBase"))) / ((LIFE_SETTINGS(getNumber,"gang_upgradeMultiplier"))));

private _action = [
    format ["You are about to upgrade the maximum members allowed for your group.<br/><br/>Current Max: %1<br/>Upgraded Max: %2<br/>Price: <t color='#8cff9b'>£%3</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
    "Upgrade Maximum Allowed Group Members",
    "Buy",
    "Cancel"
] call PHX_fnc_confirmBox;

if (_action) then {
    if (BANK < _upgradePrice) exitWith {
        [format [
            "You do not have enough money in your bank account to upgrade the group's maximum member limit.<br/><br/>Current: <t color='#8cff9b'>£%1</t><br/>Lacking: <t color='#FF0000'>£%2</t>",
            [BANK] call life_fnc_numberText,
            [_upgradePrice - BANK] call life_fnc_numberText
        ],"red"] spawn PHX(notify);
    };

    [_upgradePrice, 1, 1, "Upgraded Gang Slots"] call PHX(handleMoney);
    [player, format ["%1 (%2) upgraded their gang for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_upgradePrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
    _group setVariable ["gang_maxMembers",_slotUpgrade,true];

    [format ["You have upgraded from %1 to %2 maximum slots for <t color='#8cff9b'>£%3<t/>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],"green"] spawn PHX(notify);

    [2, _group] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
};