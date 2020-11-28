/*
	@File: fn_getGarage.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Actually does the garage setup...
*/
#include "..\..\script_macros.hpp"
private _params = _this # 3;
_params params [
	["_spawmpoint", "", ["",[]]],
	["_type", "", [""]]
];

if (_type isEqualTo "" || {_spawmpoint isEqualTo ""}) exitWith { systemChat "Garage Failuire" };

life_garage_sp = _spawmpoint;
life_garage_type = _type;
life_garage_spawn = false;


[getPlayerUID player,playerSide,_type] remoteExecCall (["fnc_getVehicles","TON"] call SOCK_fnc_getRemoteDestination);

createDialog "RscDisplayGarage";

disableSerialization;
ctrlSetText[2802,"Fetching Vehicles...."];