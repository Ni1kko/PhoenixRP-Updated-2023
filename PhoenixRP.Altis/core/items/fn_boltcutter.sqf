/*
	@File: fn_boltcutter.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Bolt cut a locked door...
*/
scopeName "boltcutDoor";
#include "..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgMap"
if !(params[["_building", objNull, [objNull]]]) exitWith {};

if (isNull _building || { !(_building isKindOf "House_F" || typeOf(_building) isEqualTo "Land_ConcreteWall_01_l_gate_F" || typeOf(_building) isEqualTo "Land_BackAlley_01_l_gate_F")}) exitWith {};
if (isNil "life_boltcutter_uses") then { life_boltcutter_uses = 0 };
if ([] call PHX_fnc_isSafeZone) exitWith {NOTIFY("You cannot lockpick in a greenzone!","red")};

private _door = [_building] call LIFE(nearestDoor);
if (_door < 1) exitWith { ["You are not near a door!"] spawn PHX(notify) };
if ((_building getVariable [format ["bis_disabled_Door_%1", _door], 0]) isEqualTo 0) exitWith { ["The door is already unlocked!"] spawn PHX(notify) };

private _sleep = 600;
private _type = _building getVariable ["bType", ""];
private _title = "House";

if (_type isEqualTo "") then {
    _owner = _building getVariable "house_owner";
    _owner params ["_uid", "_name", "_isGang"];

    private _id = [_uid] call BIS_fnc_getUnitByUid;

    if (_isGang) then {
        _id = [_uid] call PHX_fnc_groupByID;
    };

    if !([_building] call PHX(canRaid)) exitWith { ["This person is not online and so this house can't be raided"] spawn PHX(notify); breakOut "boltcutDoor" };

    sleep 0.5; //Needs to wait for the ID to be set
    if ("Alarm" in ((cursorObject getVariable ['house_upgrades',[]]) select 2)) then {
        [[0,1], format["Your house at %1 is being broken into!", mapGridPosition _building]] remoteExec ["life_fnc_broadcast", _id];
    };

    if ("Marker" in ((cursorObject getVariable ['house_upgrades',[]]) select 2)) then {
        [_building] remoteExec ["PHX_fnc_robberyMarker",_id]
    };

    _sleep = _sleep * (1 + (((cursorObject getVariable ['house_upgrades',[]]) select 0) / 100));
} else {
    private _cfg = CFG >> "JobBuildings" >> _type;
    private _job = CFG >> "Jobs" >> (getText(_cfg >> "job"));
    if !(isClass _cfg) exitWith { ["An error occured...", "red"] spawn PHX(notify); breakOut "boltcutDoor" };

    _title = (getText(_job >> "title"));
    private _side = (call compile (getText(_job >> "side")));
    private _online = (getNumber(_job >> "online"));
    private _notification = (getNumber(_job >> "notification"));
    private _isMajorCrime = (getNumber(_job >> "major"));
    _sleep = (getNumber(_cfg >> "breakTime"));

    if ((_isMajorCrime isEqualTo 1) && { serverTime <= (getNumber(missionConfigFile >> "CfgSettings" >> "crime_delay")) }) exitWith { 
        ["You can't bolt cut into this object until 15 minutes has passed since last server restart.", "red"] spawn PHX(notify);
        breakOut "boltcutDoor";
    };

    if (ONLINE(_side) < _online && { isNil { _building getVariable "override" } }) exitWith {
        [format["There needs to be at least %1 faction members on-duty to break in...", _online], "red"] spawn PHX(notify);
        breakOut "boltcutDoor";
    };

    if (_notification isEqualTo 1) then {
        [
            [1, 2],
            switch (true) do {
                case (playerSide isEqualTo west): {
                    format["Cameras have spotted a member of the APC breaking into %1!", _title]
                };
                case (playerSide isEqualTo east): {
                    format["Cameras have spotted a member of HAVOC breaking into %1!", _title]
                };
                case (!isNil {group player getVariable "gang_name"}): {
                    format ["Cameras have spotted a criminal organisation by the name %1 breaking into %2!", ((group player) getVariable "gang_name"), _title]
                };
                default {
                    format["Cameras have spotted a group of hobos breaking into %1!", _title]
                };
            }
        ] remoteExecCall ["life_fnc_broadcast", _side];

        [
            format["The %1 is under attack!", _title],
            format["The %1 is under attack! All civilians and medics should stay away until the situation can be resolved!", _title],
            "AAN News"
        ] remoteExec ['life_fnc_AAN', -2];
    };

    if (_isMajorCrime isEqualTo 1) then {
        [40, format["Breaking into %1", _title]] spawn PHX(handleGangXP);
    };
};

life_action_inUse = true;

if !(
    [
        "Cutting lock on door...",
        _sleep,
        [],
        0.01
    ] call PHX(handleProgress)
) exitWith { life_action_inUse = false; };

life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;

if (life_boltcutter_uses >= 5) then {
    [false,"boltcutter",1] call life_fnc_handleInv;
    life_boltcutter_uses = 0;
};

_building setVariable [format ["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
_building setVariable ["robbed",true,true];
["This door's lock has been cut!"] spawn PHX(notify);

if !(playerSide isEqualTo east) then {
    [getPlayerUID player,profileName,"459"] remoteExecCall (["fnc_wantedAdd", "life"] call SOCK_fnc_getRemoteDestination);
};

[player, format ["%1 (%2) - Broke into the %3",profileName,(getPlayerUID player),_title], "https://rcon.phoenixrp.co.uk/api/v1/log/house"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
