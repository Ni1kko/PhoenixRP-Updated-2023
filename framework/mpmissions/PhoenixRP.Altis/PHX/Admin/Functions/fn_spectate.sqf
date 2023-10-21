/*
	@File: fn_spectate.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Sepectate this guy...
*/
#include "..\..\..\script_macros.hpp"
#include "..\..\GUI\Tablet\macros.hpp"
params [["_msg", "", [""]]];

private _target = ((CONTROL_DATA(IDC_ADMIN_LIST)) call PHX(unitByUID));

if (isNil "_target" || { isNull _target }) exitWith { NOTIFY("This target is invalid.","red"); false};
if (_target isEqualTo player) exitWith { NOTIFY("You're unable to spectate yourself.","red"); false};

[_target] spawn {
	params ["_unit"];
	
	_unit switchCamera "INTERNAL";
	[format ["You are now spectating %1 (F10 to stop).", _unit getVariable["realname",name _unit]]] spawn PHX(notify);
	
	AM_Exit = (findDisplay 46) displayAddEventHandler ["KeyDown", "
		if ((_this select 1) isEqualTo 68) then {
			(findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit];

			player switchCamera 'INTERNAL';
			['You have stopped spectating'] spawn PHX_fnc_notify;
		};

		false
	"];
};

[player, format ["%1 (%2) spectated %3",profileName,getPlayerUID player,_target getVariable ["realname",name _target]], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

false