/*
	@File: fn_sellHouse.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Sells one of our houses...
*/
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgHousing" >> worldName
params [
	["_house", objNull, [objNull]]
];

if !(canSuspend) exitWith { _this spawn PHX(sellHouse) };

if (isNull _house || { !(_house isKindOf "House_F") } || {!(isNil {_house getVariable "isSelling"})}) exitWith {};
if (isNil {_house getVariable "house_owner"}) exitWith { ["You must own the house before you can sell it..."] spawn PHX(notify) };

private _owner = _house getVariable "house_owner";
_owner params ["_uid", "_name", "_isGang"];
if (_isGang && { !((grpPlayer getVariable ["gang_owner", ""]) isEqualTo (getPlayerUID player)) }) exitWith { ["You must own the gang to sell it's housing..."] spawn PHX(notify) };

private _typeOf = typeOf _house;
if !(isClass (CFG >> _typeOf)) exitWith { ["Contact a developer to sell this house...", "red"] spawn PHX(notify) };

private _sellPrice = round((getNumber (CFG >> _typeOf >> "price")) / 2);

closeDialog 0;

private _action = [
	format["Are you sure you wish to sell this house for £%1", NUM_TXT(_sellPrice)],
	"Housing Confirmation", "Sell House", "Cancel"
] call PHX_fnc_confirmBox;

if (_action) then {
	if (isNil {_house getVariable "house_owner"}) exitWith { ["House already sold"] spawn PHX(notify) };
	_house setVariable ["isSelling", true, true];

	private _isGang = (_house getVariable ["house_owner", []] select 2);

	[_house, _isGang] remoteExecCall (["fnc_sellHouse", "TON"] call SOCK_fnc_getRemoteDestination);
	[_sellPrice, 0, 1, "Sold A House"] call PHX(handleMoney);

	[_house, 1] call PHX(houseMarker);

	if (_isGang) then {
		[_house, true] remoteExecCall ["PHX_fnc_gangHousing", (units (grpPlayer))];
		uiSleep 0.3;
	};

	_house setVariable ["uid", nil, true];
	_house setVariable ["house_owner", nil, true];
	
	// Unlock all doors...
    for "_i" from 1 to (FETCH_CONFIG2(getNumber,"CfgVehicles",(typeOf _house),"numberOfDoors")) do {
        _house setVariable [format ["bis_disabled_Door_%1", _i], 0, true];
    };

	private _keyIndex = life_vehicles find _house;
	if !(_keyIndex isEqualTo -1) then {
		life_vehicles deleteAt _keyIndex;
	};

	private _houses = ([life_houses, life_gang_houses] select (_isGang));

	_keyIndex = _houses find _house;
	if !(_keyIndex isEqualTo -1) then {
		_houses deleteAt _keyIndex;
	};

	[format["You've sold this house for £%1.", NUM_TXT(_sellPrice)]] spawn PHX(notify);
	_house setVariable ["isSelling", nil, true];

	[player, format ["%1 (%2) Sold a house for %3 Bank Balance: %4",profileName,(getPlayerUID player),[_sellPrice] call life_fnc_numberText,[BANK] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/house"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	["Sale cancelled"] spawn PHX(notify);
};