/*
	@File: fn_repaint.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Repaints vehicle
*/
#include "..\..\..\..\script_macros.hpp"

private _selColor = lbValue[2102,(lbCurSel 2102)];

if (_selColor isEqualTo "") exitWith { NOTIFY("You must select a colour to repaint to...", "red") };

if (((PHX_MyCars select PHX_MyCar) distance player) > 15) exitWith { NOTIFY("Your vehicle is above 5m away!", "red"); closeDialog 0; };

private _cost = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf (PHX_MyCars select PHX_MyCar)),"price") * 0.1;

private _msg = format["You lack the money required to repaint your vehicle (£%1)", [_cost] call life_fnc_numberText];
if (_cost > BANK) exitWith { NOTIFY(_msg, "red") };

_msg = format["Vehicle succesfully repainted for a total cost of £%1 ", [_cost] call life_fnc_numberText];
NOTIFY(_msg, "green");
[_cost, 1, 1, "Repainted Vehicle"] call PHX(handleMoney);
[player, format ["%1 (%2) repainted their vehicle for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_cost] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

private _RGB = false;
if ((lbData[2102,(lbCurSel 2102)]) isEqualTo "Custom") then {
	_RGB = [(round(sliderPosition 2110) / 100),(round(sliderPosition 2111) / 100),(round(sliderPosition 2112) / 100),1];
	_selColor = (PHX_MyCars select PHX_MyCar) getVariable "Life_VEH_color";
};

if (_selColor isEqualTo -1) then { _selColor = -2 };

[(PHX_MyCars select PHX_MyCar), _selColor, _RGB] call life_fnc_colorVehicle;
[2100] call life_fnc_3dPreviewExit;
closeDialog 0;

if (_RGB isEqualType []) then { _selColor = _RGB };

// Server Update...
[(PHX_MyCars select PHX_MyCar),3,_selColor] remoteExecCall ["TON_fnc_vehicleUpdate",RSERV];