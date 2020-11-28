/*
    File: fn_arrestAction.sqf
    Author:

    Description:
    Arrests the targeted person.
*/
#include "..\..\script_macros.hpp"
if !(params [["_unit", objNull, [objNull]]]) exitWith {};

if (isNull _unit || { !(isRestrained(_unit)) } || { !(isPlayer _unit) } || { !(_unit isKindOf "CAManBase") } || { isDowned(player) } || { isDowned(_unit) }) exitWith {};

private _jailTime = ["Jail Time","Jail","Cancel"] call PHX_fnc_editBox;

if !(_jailTime isEqualType "") exitWith {};
if !([_jailTime] call LIFE_fnc_isNumber) exitWith { ["The value you're entering must only contain numbers","red"] spawn PHX(notify) };

_jailTime = parseNumber _jailTime;

if (playerSide isEqualTo west) then {
    if (_jailTime < 5 || { _jailTime > 60 }) exitWith { ["You can only send people to jail for 5 to 60 minutes","red"] spawn PHX(notify) };

    private _xp = 100;
    if (HAS_PERK("governmentBonusAPC")) then { _xp = 200 };

    [_xp, format["Arresting %1", _unit getVariable ["realname", name _unit]]] call PHX_fnc_handleXP;

    [getPlayerUID _unit,_unit,player,false] remoteExecCall (["fnc_wantedBounty","life"] call SOCK_fnc_getRemoteDestination);
    [0,format["%1 was arrested by the police for %2 minutes.", _unit getVariable ["realname",name _unit], _jailTime]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
} else {
    if (_jailTime < 5 || { _jailTime > 15 }) exitWith { ["You can only send people to jail for 5 to 15 minutes","red"] spawn PHX(notify) };
};

_jailTime = (60 * _jailTime);

detach _unit;
[_unit, _jailTime, playerSide] remoteExecCall ["life_fnc_jail",_unit];

[player, format ["%1 (%2) arrested %3 (%4)",profileName,getPlayerUID player,_unit getVariable ["realname",name _unit],getPlayerUID _unit], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);