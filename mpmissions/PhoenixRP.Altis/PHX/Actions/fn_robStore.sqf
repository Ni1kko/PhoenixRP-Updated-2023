/*
	@File: fn_robStore.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Robs a fuel station / bank / store / whatever...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgStores"

if !(canSuspend) exitWith { _this spawn PHX(robStore) };

if !(params [
	["_cashier", objNull, [objNull]],
	["_robber", objNull, [objNull]],
	["_actionID", -1, [0]],
	["_params", [], [[]]]
]) exitWith { systemChat "Params Failed" };

_params params [
	["_store", "", [""]],
	["_side", "", [""]]
];

if !(isNull (objectParent player)) exitWith { ["You must be outside a vehicle to rob a store..."] spawn PHX(notify) };
if ((currentWeapon player) in ["", "Binocular", "Rangefinder"]) exitWith { ["You must have a weapon to rob a store..."] spawn PHX(notify) };
if !(isNil {_cashier getVariable "robbed"}) exitWith { ["This store has already been robbed recently..."] spawn PHX(notify) };

if !(isClass (CFG >> _store)) exitWith { ["This store is not robbable..."] spawn PHX(notify); _cashier removeAction _actionID }; // What?

private _thisStore = CFG >> _store;

private _name = getText(_thisStore >> "name");
private _increase = (getNumber(_thisStore >> "increase") / 100);
private _sleep = getNumber(_thisStore >> "time");
private _reward = getArray(_thisStore >> "reward");
private _reqSide = getNumber(_thisStore >> "sideRequired");

if !(call compile (getText(_thisStore >> "condition"))) exitWith { call compile (getText(_thisStore >> "fail")) };

_side = call compile _side;
if !(_side isEqualType sideUnknown) exitWith { ["This store is not robbable..."] spawn PHX(notify); _cashier removeAction _actionID }; // What?

if ((_side countSide playableUnits) < _reqSide) exitWith { 
	[
		format["There must be atleast %1 %2 to rob this store...", _reqSide, (["HAVOC Members", "Police Officers"] select (_side isEqualTo west))]
	] spawn PHX(notify);
};

life_action_inUse = true;

_cashier setVariable ["robbed", true, true]; // Stop others robbing this store...
_cashier switchMove "AmovPercMstpSsurWnonDnon";

_reward params ["_low", "_high"];
_reward = random[_low, _low + ((_high - _low) / 2), _high];

private _loc = [] call PHX(getNearestLocation);

[3, format ["<t color ='#ff0000' size ='1.5'>ALARM</t><br/>A silent alarm has been triggered at the %1 near %2!", _name, _loc]] remoteExecCall ["life_fnc_broadcast", _side];

private _mrkName = format["store_robbry_%1_%2", _store, (str (getPos _cashier))];
private _marker = createMarker [_mrkName, (getPos _cashier)];
_mrkName setMarkerText "Robbery in progress!";
_mrkName setMarkerColor "ColorRed";
_mrkName setMarkerType "loc_Fuelstation";

if !(
	[
		format["Robbing %1 near %2", _name, _loc],
		_sleep,
		[
			"player distance (_this select 0) < 5",
			[_cashier], true,
			"[""You must remain within 5m of the store at all times...""] call PHX_fnc_notify;"
		],
		_increase,
		""
	] call PHX(handleProgress)
) exitWith { 
	deleteMarker _mrkName; 

	_cashier switchMove "";
	_cashier setVariable ["robbed", nil, true];

	life_action_inUse = false;
};

deleteMarker _mrkName;

[_reward, 0, 0, (format["Robbed %1",_name])] call PHX(handleMoney);
[format["You've robbed £%1 from this store!", [_reward] call LIFE(numberText)]] spawn PHX(notify);

[player, format ["%1 (%2) robbed a store and took %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_reward] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

if !((side _robber) isEqualTo east) then {
	[getPlayerUID _robber,_robber getVariable ["realname",name _robber],"211"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
};

[] spawn {
	life_use_atm = false;
	sleep (30 + random(180));
	life_use_atm = true;
};

_cashier switchMove "";

_cashier spawn {
	sleep 300;
	_this setVariable ["robbed", nil, true];
};

life_action_inUse = false;