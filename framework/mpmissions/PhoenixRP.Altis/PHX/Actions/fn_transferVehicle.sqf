/*
	@File: fn_transferVehicle.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Transfers selected vehicle to selected player.
*/
#include "..\..\script_macros.hpp"

if((lbCurSel 2802) <= -1) exitWith {NOTIFY("You must select a vehicle to transfer!")};
{ ctrlEnable [_x,false] } forEach [2804,2805];
private _selectedVehicle = lbValue[2802,(lbCurSel 2802)];

if((lbCurSel 2808) <= -1) exitWith {NOTIFY("You must select a player to transfer this vehicle to!")};
private _selectedPlayer = call compile format["%1", lbData[2808,(lbCurSel 2808)]];
private _selectedName = (name _selectedPlayer);
private _target = _selectedPlayer;
_selectedPlayer = (getPlayerUID _selectedPlayer);

private _action = [
    format["Are you sure you want to transfer this vehicle to %1?", _selectedName],
    "Vehicle Transfers",
    "Yes",
    "No"
] call PHX_fnc_confirmBox;
closeDialog 0;

if (_action) then {
	[(getPlayerUID player), _selectedPlayer, _selectedVehicle] remoteExecCall (["fnc_changeOwner", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
	[format["%1 has transfered you a vehicle", name player]] remoteExec ["PHX_fnc_notify", _target];
	[format["Vehicle transfered to %1", _selectedName]] spawn PHX(notify);

	[
		player, format ["%1 (%2) has transfered %3 to %4 (%5)",
		name player,
		getPlayerUID player,
		_selectedVehicle,
		_selectedName,
		_selectedPlayer], "https://rcon.phoenixrp.co.uk/api/v1/log/vehicle"
	] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

{ ctrlEnable [_x,true] } forEach [2804,2805];