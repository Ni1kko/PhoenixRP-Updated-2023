/*
	@File: fn_compensate.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Compensates a given amount to our targeted player...
*/

if (true) exitWith { failMission "SpyGlass" };

#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]], ["_money", -1, [0]]];

if (_money isEqualTo -1) exitWith { NOTIFY("Invalid ammount.","red"); false};

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};
if (FETCH_CONST(life_adminlevel) < 0) exitWith { [format["Report this message to the dev team..."],"red"] call PHX_fnc_notify };

if (_money <= 0 || _money > 999999) exitWith {["The value must be between <t color = '#8A2BE2'>£0</t> and <t color = '#8A2BE2'>£1,000,000</t>","red"] spawn PHX(notify)};

[_money, 0, 1, (format["Compensated by %1",(player getVariable ["realname", name player])])] remoteExecCall ["PHX_fnc_handleMoney", _target];
[format["%1 compensated you %2", (player getVariable ["realname", name player]), _money],"green"] remoteExecCall ["PHX_fnc_notify", _target];

[player, format ["%1 (%2) compensated %3 (%4) %5", profileName, getPlayerUID player, _target, (getPlayerUID _target), [_money] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

[true, format[_msg, (player getVariable ["realname", name player]), (_target getVariable ["realname", name _target]), _money]] call PHX(logUsage);