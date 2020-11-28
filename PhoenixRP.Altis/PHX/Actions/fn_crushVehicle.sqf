/*
	@File: fn_crushVehicle.sqf
	@Author: Jack "Scarso" Farhall
	@Description: crush me baby...
*/
#include "..\..\script_macros.hpp"
if !(params [["_vehicle", objNull, [objNull]]]) exitWith {};

private _filters = ["Car","Air","Ship"];
if !([_vehicle, _filters] call PHX(isKindOf)) exitWith {};
if (player distance _vehicle > 10) exitWith {};
if (_vehicle getVariable "NPC") exitWith {NOTIFY("This vehicle is NPC protected","red")};

private _vehicleData = _vehicle getVariable ["vehicle_info_owners",[]];
if (_vehicleData isEqualTo []) exitWith {deleteVehicle _vehicle};
_vehicleData params ["_owner"];
_owner params ["_steamid", "_name"];

private _vehicleName = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");
private _price = M_CONFIG(getNumber,"LifeCfgVehicles",(typeOf _vehicle),"price");

[0,format["%1 your %2 is being crushed.", _name, _vehicleName]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
life_action_inUse = true;

private _level = PROF_LVL("Prof_Crushing");

if !(
    [
        "Crushing Vehicle",
        27,
        [
            "player distance (_this select 0) < 5", 
            [_vehicle], true, 
            "['You must remain within 5m of the vehicle at all times...','red'] call PHX_fnc_notify;"
        ],
        ([0.01,(0.01 + (_level / 2500))] select (_level > 0)),
        ""
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

if ((crew _vehicle) isEqualTo []) then {
    if !([_vehicle, _filters] call PHX(isKindOf)) exitWith { life_action_inUse = false };
    private _type = FETCH_CONFIG2(getText,"CfgVehicles",(typeOf _vehicle),"displayName");

	private _vInfo = _vehicle getVariable ["dbInfo",[]];

	if !(_vInfo isEqualTo []) then {
		_vInfo params ["", "", "_vID"];
    	[_vID, _steamid] remoteExecCall (["fnc_vehicleDelete","TON"] call SOCK_fnc_getRemoteDestination);
	};

	deleteVehicle _vehicle;

    if (playerSide isEqualTo west) then {
        private _impoundMultiplier = LIFE_SETTINGS(getNumber,"vehicle_impound_multiplier");

        private _value = _price * _impoundMultiplier;
        if (HAS_PERK("scrapDealer")) then { _value = _value * 1.2 };

        [0, format["%2, your %3 has been crushed.", profileName, _name,_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        if (_vehicle in life_vehicles) then {
            [(format ["You were paid nothing for crushing your own vehicle %1.", _type]),"red"] call PHX_fnc_notify;
        } else {
            [(format ["You have crushed a %1. You have received £%2 for cleaning up the streets!",_type,[_value] call life_fnc_numberText]),"green"] call PHX_fnc_notify;
            [_value, 0, 1, (format["Crushed a %1",_type])] call PHX(handleMoney);
            ["Prof_Crushing",1,50] call PHX(increaseProfession);
        };
    };

    [player, format ["%1 (%2) - Crushed (%4) %5's %3", profileName, getPlayerUID player, _vehicleName,_steamid, _name], "https://rcon.phoenixrp.co.uk/api/v1/log/police"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
    NOTIFY("Crushing has been cancelled","red");
};

life_action_inUse = false;