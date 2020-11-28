#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_purchaseHouseUpgrade.sqf
	@Author: Zyn
	@Description: Does the buying action
*/
#define CFG missionConfigFile >> "CfgUpgrades"
scopeName "Main";

params [
    ["_house",objNull,[objNull]]
];

private _data = CONTROL_DATA(12001);
private _owner = _house getVariable ["house_owner", []];

if (_data isEqualTo "" || { isNull _house } || { _owner isEqualTo [] }) exitWith { NOTIFY("You are unable to purchase this upgrade!","red") };
if !(call compile (getText(CFG >> _data >> "condition"))) exitWith { NOTIFY("You can not currently purchase this!","red") };

private _price = getNumber(CFG >> _data >> "price");
private _title = getText(CFG >> _data >> "title");
private _action = [
	format ["Are you sure you want to purchase this upgrade for £%1",[_price] call LIFE_fnc_numberText],
	"House Upgrade",
	"Yes",
	"No"
] call PHX_fnc_confirmBox;

if !(_action) exitWith {};

if (_owner select 2) then {
	if ((GANG_FUNDS) < _price) exitWith { NOTIFY("Your gang does not have enough money for this upgrade!","red"); breakOut "Main" };
	(group player) setVariable ["gang_bank",((GANG_FUNDS) - _price),true];
	[player, format ["%1 (%2) purchased the %3 house upgrade for %4 using gang funds",profileName,getPlayerUID player,_data,[_price] call LIFE_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	if (BANK < _price) exitWith { NOTIFY("You do not have enough money for this upgrade!","red"); breakOut "Main" };
	[_price, 1, 1, (format["%1 House Upgrade",_title])] call PHX(handleMoney);
	[player, format ["%1 (%2) purchased the %3 house upgrade for %4",profileName,getPlayerUID player,_title,[_price] call LIFE_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

call compile (getText(CFG >> _data >> "action"))
