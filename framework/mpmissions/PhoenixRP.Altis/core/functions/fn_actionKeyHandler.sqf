#include "..\..\script_macros.hpp"
/*
    File: fn_actionKeyHandler.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master action key handler, handles requests for picking up various items and
    interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private _curObject = cursorObject;
if (life_action_inUse || { isDowned(player) }) exitWith {};
if (life_interrupted) exitWith { life_interrupted = false };

if (player getVariable ["isEscorting",false]) exitWith {
    [
        [["Stop Escorting","[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;"]]
    ] call PHX(getButtons);
};

if ((call life_fnc_nearATM) && {!dialog}) exitWith { [] call PHX_fnc_atmMenu };

if (isNull _curObject) exitWith {
    if (surfaceIsWater (visiblePositionASL player)) then {
        private _fish = (nearestObjects[player,(LIFE_SETTINGS(getArray,"animaltypes_fish")),3]) select 0;
        if (!isNil "_fish") then {
            if (!alive _fish) then {
                [_fish] call life_fnc_catchFish;
            };
        };
    } else {
        private _animal = (nearestObjects[player,(LIFE_SETTINGS(getArray,"animaltypes_hunting")),3]) select 0;
        if (!isNil "_animal") then {
            if (!alive _animal) then {
                [_animal] call life_fnc_gutAnimal;
            };
        } else {
            if (playerSide isEqualTo civilian && { !life_action_gathering }) then {
                life_action_gathering = true;

                private _handle = [] spawn PHX(gatherItem);
                waitUntil {scriptDone _handle};

                life_action_gathering = false;
            };
        };
    };
};

if (typeOf(_curObject) isEqualTo "Land_BackAlley_01_l_gate_F" && {playerSide isEqualTo west} && {((player distance _curObject) < 10)} && {(cursorObject getVariable ["side",WEST]) isEqualTo playerSide}) exitWith {
    [
        [
            ["Open / Close Gate","[cursorObject, 'rot', 1] call life_fnc_doorAnimate; closeDialog 0;"],
            ["Lock Gate","cursorObject setVariable ['bis_disabled_Door_1',1,true]; closeDialog 0;"]
        ]
    ] call PHX(getButtons);
};

if (typeOf(_curObject) isEqualTo "Land_ConcreteWall_01_l_gate_F" && {playerSide isEqualTo east} && {((player distance _curObject) < 10)}) exitWith {
    [
        [
            ["Open / Close Gate","[cursorObject, 'move', 1] call life_fnc_doorAnimate; closeDialog 0;"],
            ["Lock Gate","cursorObject setVariable ['bis_disabled_Door_1',1,true]; closeDialog 0;"]
        ]
    ] call PHX(getButtons);
};

if ((typeOf(_curObject) isEqualTo "Land_ConcreteWall_01_l_gate_F") && {(life_inv_boltcutter > 0)}) then {
    [
        [
            ["Boltcut gate","[cursorObject] spawn life_fnc_boltcutter; closeDialog 0;"]
        ]
    ] call PHX(getButtons);
};

if ((_curObject isKindOf "House_F" && {((player distance _curObject) < 10)} && {isClass (missionConfigFile >> "CfgHousing" >> worldName >> (typeOf _curObject))}) || { !(isNil { _curObject getVariable "bType" }) }) exitWith {
    life_vInact_curTarget = _curObject;
    ["House"] call PHX(getButtons);
};

if (dialog) exitWith {}; //Don't bother when a dialog is open.
if (!(isNull objectParent player) || !(isNull objectParent _curObject)) exitWith {}; //He's in a vehicle, cancel!
life_action_inUse = true;

//Temp fail safe.
[] spawn {
    sleep 60;
    life_action_inUse = false;
};

private _count = 0;
{
    if ((damage _x > 0.1) && !([_x, ["AllVehicles","Man"]] call PHX(isKindOf))) then {
        _count = _count + 1
    };
} forEach (nearestObjects [player, [], 10]);

if ((isSER(player)) && {(_count > 0)}) then {
    ["Repair"] call PHX(getButtons);
};

//If target is a player then check if we can use the cop menu.
if (isPlayer _curObject && { _curObject isKindOf "CAManBase" } && { !dialog } && { player distance _curObject <= 5 }) then {
    life_pInact_curTarget = _curObject; // Set the object for interaction...
    ["General"] call PHX(getButtons); // Interaction Menu for Everyone...
} else {
    //OK, it wasn't a player so what is it?

    //It's a vehicle! open the vehicle interaction key!
    if ([_curObject, ["landVehicle","Ship","Air","B_Slingload_01_Cargo_F"]] call PHX(isKindOf)) then {
        if (!dialog && { !(_curObject getVariable ["NPC", false]) }) then {
            if (player distance _curObject < ((boundingBox _curObject select 1) select 0)+2 && (!(isRestrained(player))) && (!(player getVariable ["playerSurrender",false])) && !life_isknocked && !life_istazed) then {
                life_vInact_curTarget = _curObject; // Set the object for interaction...
                ["Vehicle"] call PHX(getButtons);
            };
        };
    } else {
        if ((typeOf _curObject) isEqualTo "Land_Money_F" && {!(_curObject getVariable ["inUse",false])}) then {
            [_curObject] remoteExecCall ["life_fnc_pickupMoney",player];
        } else {
            private _placeablesList = (("true" configClasses (missionConfigFile >> "CfgPlaceables")) apply { configName _x });

            if (((playerSide in [west, east, independent]) || (player getVariable ["isAdmin",false])) && { (typeOf _curObject) in _placeablesList && { (_curObject in PHX_barrier_placed || {(player getVariable ["isAdmin",false])}) } }) then {
                life_vInact_curTarget = _curObject;
                ["Placeables"] call PHX(getButtons);
            } else {
                if ((playerSide isEqualTo west || player getVariable ["isAdmin", false]) && ((count(nearestObjects [player,["WeaponHolder"],3])>0) || (count(nearestObjects [player,["GroundWeaponHolder"],3])>0) || (count(nearestObjects [player,["WeaponHolderSimulated"],3])>0))) then {
                    private _action = ["Are you sure you want to seize these items","Seize Confirmation", "Yes", "No"] call PHX_fnc_confirmBox;
                    if (_action) then {
                        [] call PHX_fnc_seizeObjects;
                    };
                };
            };
        };
    };
};
    
if (_curObject isKindOf "Land_Bodybag_01_black_F" && {((player distance _curObject) < 5)}) then {
    [_curObject] spawn life_fnc_openInventory;
};