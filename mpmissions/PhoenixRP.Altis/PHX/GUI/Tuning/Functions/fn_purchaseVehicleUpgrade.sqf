#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_purchaseVehicleUpgrade.sqf
	@Author: Zyn
	@Description: Does the buying action
*/
#define CFG missionConfigFile >> "CfgVehicleUpgrades"
#define VCFG missionConfigFile >> "LifeCfgVehicles"

private _data = CONTROL_DATA(33001);

if (_data isEqualTo "" || { isNil "PHX_Upgrade" }) exitWith { NOTIFY("You are unable to purchase this upgrade!","red") };
if !(call compile (getText(CFG >> _data >> "condition"))) exitWith { NOTIFY("You can not currently purchase this!","red") };

private _price = CONTROL_VALUE(33001);
private _action = [
	format ["Are you sure you want to purchase this upgrade for £%1",[_price] call LIFE_fnc_numberText],
	"Vehicle Upgrade",
	"Yes",
	"No"
] call PHX_fnc_confirmBox;

if !(_action) exitWith {};

if (BANK < _price) exitWith { NOTIFY("You do not have enough money for this upgrade!","red"); };
[_price, 1, 1] call PHX(handleMoney);
[player, format ["%1 (%2) purchased the %3 vehicle upgrade for %4",profileName,getPlayerUID player,_data,[_price] call LIFE_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

call compile (getText(CFG >> _data >> "action"))
