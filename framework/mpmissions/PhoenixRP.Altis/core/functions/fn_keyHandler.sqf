/*
*    File: fn_keyHandler.sqf
*    Author: Bryan "Tonic" Boardwine
*
*    Description:
*    Main key handler for event 'keyDown'.
*/
#include "..\..\script_macros.hpp"
#define ACT_KEY(name, default) [(actionKeys name) select 0, default] select (actionKeys name isEqualTo [])
scopeName "InputHandle";
params [
    "_ctrl",
    "_code",
    "_shift",
    "_ctrlKey",
    "_alt"
];

private _speed = speed cursorObject;
private _handled = false;
private _anprKey = ACT_KEY("User5", 181);
private _copBackUpKey = ACT_KEY("User7", 36);
private _actionsKey = ACT_KEY("User8", 3);
private _redGullKey = ACT_KEY("User9", 37);
private _interactionKey = ACT_KEY("User10", 219);
private _disputeKey = ACT_KEY("User11", 199);
private _interruptionKeys = [17, 30, 31, 32]; //A,S,W,D

//---Stop moves menu being opened whilst an action is being performed
private _state = animationState player;

if (PHX_isInterruptable && _code isEqualTo 1) exitWith { life_interrupted = true; true };

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((isRestrained(player)) || (player getVariable ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
    true;
};

// We're incapacitated... Block keys...
if (isDowned(player)) then {
    switch true do {
        case (_code isEqualTo 1): { true breakOut "InputHandle" }; // Block Escape Key...
        case (_code isEqualTo 57 && { PHX_canRespawn }): { PHX_bleedFaster = true; true breakOut "InputHandle" }; // Rebind Space Key to Respawn...
        case (_code in (actionKeys "personView")): { true breakOut "InputHandle" }; // Block Third Person...
        case (_code in (actionKeys "ShowMap")): { true breakOut "InputHandle" }; // Block Map...
    };
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(actionKeys "User10" isEqualTo []) && {(inputAction "User10" > 0)}) exitWith {
    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    if (!life_action_inUse) then {
        [] spawn {
            private _handle = [] spawn life_fnc_actionKeyHandler;
            waitUntil {scriptDone _handle};
            life_action_inUse = false;
        };
    };
    true;
};

if (_code in (actionKeys "GetOver")) then {
    if (isNil "jumpActionTime") then {jumpActionTime = 0;};
    if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!life_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
        jumpActionTime = time; //Update the time.
        [player] remoteExec ["life_fnc_jumpFnc",RANY]; //Global execution
        _handled = true;
    };
};

if (_code in (actionKeys "tacticalView")) then {
    _handled = true;
};

switch (_code) do {

    case _disputeKey: { [] call PHX(openDisputing) };

    case 183: {
        closeDialog 0;
        life_action_inUse = false;
    };

    //Surrender (Shift + B)
    case 48: {
        if (isDowned(player)) exitWith {};

        if (_shift) then {
            if (player getVariable ["playerSurrender",false]) then {
                player setVariable ["playerSurrender",false,true];
            } else {
                [] spawn life_fnc_surrender;
            };
            _handled = true;
        } else {
            // Seatbelt...
            if ( !(isNull objectParent player) && ((vehicle player) isKindOf "Car")) then {

                player setVariable ["seatbelt", (!(player getVariable ["seatbelt", false])), true];

                [] call PHX(hudUpdate);
                _handled = true;
            };
        };
    };

    //Placeables
    case 57: {
        if !(_shift && isNil "PHX_barrier_active") then {
            [] spawn PHX_fnc_placeablesPlaceComplete;
        };
    };

    //Request medic (SHIFT + ENTER)
    case 28: {
        if (_shift && PHX_canRequest && (isDowned(player))) then {
            [] call life_fnc_requestMedic;
        };
    };

    case 156: {
        if (_shift && PHX_canRequest && (isDowned(player))) then {
            [] call life_fnc_requestMedic;
        };
    };

    //Holster / recall weapon. (Shift + H)
    case 35: {
        if (isDowned(player) || {player getVariable ["isDragging",false]}) exitWith {};
        
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            life_holstering = true;
            life_curWep_h = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
            life_holstering = false;
        };

        if (!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(life_curWep_h isEqualTo "")}) then {
            if (life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                life_holstering = true;
                player selectWeapon life_curWep_h;
                life_holstering = false;
            };
        };
    };

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey: {
        if (!life_action_inUse && { !life_holstering }) then {
            [] spawn  {
                private _handle = [] spawn life_fnc_actionKeyHandler;
                waitUntil {scriptDone _handle};
                life_action_inUse = false;
            };
        };
    };

    // Fullscreen Nightvision...
    case ((actionKeys "NightVision") select 0): {
        if (FETCH_CONST(life_adminlevel) < 5 && { cameraView isEqualTo "GUNNER" || { !((goggles player) in (LIFE_SETTINGS(getArray,"fullnightvision"))) } }) exitWith {};

        switch (currentVisionMode player) do {
            case 0: { player action ["nvGoggles", player] };
            case 1: { player action ["nvGogglesOff", player] };
        };

        _handled = true;
    };

    case _redGullKey: {
        [] spawn PHX_fnc_redgull;
        private _value = (getNumber(missionConfigFile >> "CfgItems" >> "redgull" >> "edibility" >> "value"));
        if ((life_thirst + _value) > 100) then {
            life_thirst = 100;
        } else {
            life_thirst = life_thirst + _value;
        };
    };

    //Actions Menu
    case _actionskey: {
        if (isDowned(player)) exitWith {};
        if (_shift && !(player getVariable ["isDragging",false]) && !(player getVariable ["playerSurrender", false]) && !(isRestrained(player)) && !(player getVariable ["Escorting", false]) && !life_isknocked && isNull objectParent player && !(_state in ["amovpercmstpsnonwnondnon_exercisekata", "amovpercmstpsnonwnondnon_exercisepushup","amovpercmstpsnonwnondnon_exercisekneebendb", "amovpercmstpsnonwnondnon_exercisekneebendb", "amovpercmstpsnonwnondnon_exercisekneebenda", "awoppercmstpsgthwpstdnon_part5","awoppercmstpsgthwrfldnon_start1","aswmpercmstpsnonwnondnon"])) then {
          if!(dialog) then { createDialog "RscMovesMenu" };
        };
    };

    case 4: {
      if(!life_action_inUse && !life_holstering && isNull objectParent player && !PHX_inAction) then {
        if(_shift) then {
          player playActionNow "gestureGo";
        } else {
          player playActionNow "gestureHiC";
        };
      };
    };

    case 5: {
      if(!life_action_inUse && !life_holstering && isNull objectParent player && !PHX_inAction) then {
        if(_shift) then {
          player playActionNow "gestureHiB";
        } else {
          player playActionNow "gesturenod";
        };
      };
    };

    //Toggle name tags for group hexagons
    case 7: {
        if(_shift) then {
            PHX_showHexname = !PHX_showHexname;
            if (PHX_showHexname) then {
                ["You have enabled name tags for group hexagons. Press 'SHIFT + 6' to disable", "cyan"] call PHX(notify);
            } else {
                ["You have disabled name tags for group hexagons. Press 'SHIFT + 6' to enable", "cyan"] call PHX(notify);
            };
        };
    };

    //Sync shortcut
    case 8: {
        if(_shift) then {
            [] spawn PHX_fnc_syncData;
        };
        if(_ctrlKey) then {
            [true] spawn PHX_fnc_placeablePlace;
        };
    };

    case 10: {
        if (_shift && { isCID(player) }) then {
            if (player getVariable ["showBadge", false]) then {
                player setVariable ["showBadge", nil, true];
                ["Your Police Badge is now hidden.","green"] spawn PHX(notify);
            } else {
                player setVariable ["showBadge", true, true];
                ["Your Police Badge is now showing.","red"] spawn PHX(notify);
            };
        };
    };

    //Restraining (Shift + R)
    case 19: {
        if (isDowned(player)) exitWith {};

        if (_shift) then {_handled = true};
        if (_shift && {!isNull cursorObject} && {cursorObject isKindOf "CAManBase"} && {(isPlayer cursorObject)} && {alive cursorObject} && { !(isDowned(cursorObject)) } && {!(cursorObject getVariable "Escorting")} && {cursorObject getVariable ["isKnockedOut",false] || cursorObject getVariable ["isTazed",false] || cursorObject getVariable ["playerSurrender",false]} || player getVariable ["isAdmin",false] && {!(isRestrained(cursorObject))} && {speed cursorObject < 1 || (player getVariable ["isAdmin", false])}) then {
            [] call life_fnc_restrainAction;
        };
        // Repack mags
        if (_ctrlKey && !_shift && !_alt && !(player getVariable ["isDragging",false])) exitWith {
            [] spawn PHX(repackAction);
            _handled = true;
        };
    };
    
    //Knock out, this is experimental and yeah... (Shift + G)
    case 34: {
        if (isDowned(player)) exitWith {};

        if (_shift) then {_handled = true};
        if (_shift && !isNull cursorObject && cursorObject isKindOf "CAManBase" && isPlayer cursorObject && alive cursorObject && !(isDowned(cursorObject)) && (isNull objectParent cursorObject) && cursorObject distance player < 4 && speed cursorObject < 1) then {
            if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player isEqualTo primaryWeapon player || currentWeapon player isEqualTo handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(isRestrained(player)) && !life_istazed && !life_isknocked && (isNull objectParent player) ) then {
                [cursorObject] spawn life_fnc_knockoutAction;
            };
        };
    };

    //T Key (Trunk)
    case 20: {
        if (!_alt && {!_ctrlKey} && {!dialog} && {!life_action_inUse} && {!(player getVariable ["playerSurrender",false])} && {!(isRestrained(player))} && {!life_isknocked} && {!life_istazed}) then {
            if (isDowned(player)) exitWith {};

            if (!(isNull objectParent player) && alive vehicle player) then {
                if ((vehicle player) in life_vehicles) then {
                    [vehicle player] spawn life_fnc_openInventory;
                };
            } else {
                if (isNull objectParent player) then {
                    if (_shift && { !dialog }) then {
                        [] call PHX(openMenu);
                        [23200, "Inventory"] call PHX(switchApp);
                    } else {
                        if (alive cursorObject && { player distance cursorObject < 7 }) then {
                            private _list = ["landVehicle","Air","Ship","Land_Bodybag_01_black_F", "B_Slingload_01_Cargo_F"];

                            if ([cursorObject, _list] call PHX(isKindOf)) then {
                                if (cursorObject in life_vehicles || {locked cursorObject isEqualTo 0} || {cursorObject isKindOf "Land_Bodybag_01_black_F"}) then {
                                    [cursorObject] spawn life_fnc_openInventory;
                                };
                            } else {
                                switch (true) do {
                                    case ((vehicleVarName cursorObject) isEqualTo "fed_bank"): {
                                        (fed_bank getVariable ["state", [false, false]]) params ["_hacked", "_power"];

                                        if (!_hacked || { isNil { fed_bank getVariable "Trunk" } }) then {
                                            ["You can't access the vault until it's security has been hacked or this vault has already been emptied..."] spawn PHX(notify);
                                        } else {
                                            [fed_bank] spawn life_fnc_openInventory;
                                        };
                                    };
                                    case ((vehicleVarName cursorObject) isEqualTo "havoc_box"): {
                                        (havoc_box getVariable ["state", [false, false]]) params ["_hacked", "_drilled"];

                                        if (!_drilled || { isNil { havoc_box getVariable "Trunk" } }) then {
                                            ["You can't access the vault until it's been drilled into or this vault has already been emptied..."] spawn PHX(notify);
                                        } else {
                                            [havoc_box] spawn life_fnc_openInventory;
                                        };
                                    };
                                    case ((vehicleVarName cursorObject) isEqualTo "evidence_locker"): {
                                        (evidence_locker getVariable ["state", [false, false]]) params ["_hacked", "_power"];

                                        if (!_hacked || { isNil { evidence_locker getVariable "Trunk" } }) then {
                                            ["You can't access the vault until it's security has been hacked or this vault has already been emptied..."] spawn PHX(notify);
                                        } else {
                                            [evidence_locker] spawn life_fnc_openInventory;
                                        };
                                    };
                                    case ((typeOf cursorObject) isEqualTo "O_CargoNet_01_ammo_F"): {
                                        [cursorObject] spawn life_fnc_openInventory;
                                    };
                                };
                            };
                        };
                    };
                };
            };
        };
    };

    //L Key?
    case 38: {
        if (isNull objectParent player) exitWith {}; // Nah...

        if (_shift) then {
            private _veh = (vehicle player);

            if (_veh getVariable ["isAPC", false] || {_veh getVariable ["isNHS", false]}) then {
                if (!isNil {_veh getVariable "lights"}) then {
                    if (_veh getVariable ["isAPC", false]) then {
                        [_veh] call life_fnc_sirenLights;
                    } else {
                        [_veh] call life_fnc_medicSirenLights;
                    };
                    _handled = true;
                };
            };
        };

    };

    case _anprkey: {
        private _veh = (vehicle player);
        
        if (!_alt && !_ctrlKey && { [_veh, ["landVehicle"]] call PHX(isKindOf) }) then {
            [] spawn life_fnc_radar;
        };
    };

    case 21: { if (!_alt && !_ctrlKey && !(isDowned(player))) then { [] call PHX(openMenu) }; }; // Y Player Menu

    //F Key
    case 33: {
        if (currentWeapon player isEqualTo "") then {
            [] spawn {
                PHX_inAction = true;
                sleep 3;
                PHX_inAction = false;
            };
        };

        if (isNull objectParent player) exitWith {}; // Nah...

        private _veh = (vehicle player);

        if (_shift && { (((_veh getVariable ["vehicle_upgrades",[]]) select 3) > 0) } && { (driver _veh) isEqualTo player }) then {
            [_veh] call PHX_fnc_nitrous
        };

        if ((_veh getVariable ["isAPC", false] || (_veh getVariable ["isNHS", false])) && { !life_siren_active } && { ((driver _veh) isEqualTo player) } && { [_veh, ["landVehicle"]] call PHX(isKindOf) }) then {
            if (isDowned(player)) exitWith {};

            [] spawn {
                life_siren_active = true;
                sleep 1;
                life_siren_active = false;
            };

            if (isNil {_veh getVariable "siren"}) then { _veh setVariable ["siren",false,true] };

            if (_veh getVariable "siren") then {
                if (_alt && { _veh getVariable ["isAPC", false] }) then {
                    NOTIFY("Switching siren","cyan");

                    if ((_veh getVariable "sirenType") isEqualTo "policesiren") exitWith { _veh setVariable ["sirenType", "policesiren2", true] };
                    _veh setVariable ["sirenType", "policesiren", true];
                } else {
                    NOTIFY("Your sirens are now off","cyan");
                    _veh setVariable ["siren",false,true];
                    if !(isNil {(_veh getVariable "sirenJIP")}) then {
                        private _jip = _veh getVariable "sirenJIP";
                        _veh setVariable ["sirenJIP",nil,true];
                        remoteExec ["",_jip]; //remove from JIP queue
                    };
                };
            } else {
                NOTIFY("Your sirens are now on","cyan");
                _veh setVariable ["siren",true,true];
                private "_jip";
                if (_veh getVariable ["isAPC", false]) then {
                    _jip = [_veh] remoteExec ["life_fnc_copSiren",RCLIENT,true];
                    _veh setVariable ["sirenType", "policesiren", true];
                } else {
                    _jip = [_veh] remoteExec ["life_fnc_medicSiren",RCLIENT,true];
                    _veh setVariable ["sirenType", "medicSiren", true];
                };
                _veh setVariable ["sirenJIP",_jip,true];
            };
        };
    };

    //O Key
    case 24: {
        if (_shift) then {
            if (soundVolume isEqualTo 1) then {
                uiNamespace setVariable ["plugsIn", true];
                if (!_ctrlKey) then {
                    ["You put in your earplugs", "cyan"] call PHX_fnc_notify;
                    1 fadeSound 0.25;
                } else {
                    ["You put in your earplugs even further", "cyan"] call PHX_fnc_notify;
                    1 fadeSound 0.025;
                };
            } else {
                uiNamespace setVariable ["plugsIn", false];
                1 fadeSound 1;
                ["You remove your earplugs", "cyan"] call PHX_fnc_notify;
            };

            [] call PHX_fnc_hudUpdate;
            _handled = true;
        };
    };

    //P  Open Gates
    case 25: {
        if (_ctrlKey && (vehicle player isEqualTo player) && (life_inv_spikestrip > 0) && (isNull life_spikestrip)) then {
            [3] spawn life_fnc_spikeStrip;
        };

        if (!_shift && {!_alt} && {!_ctrlKey} && {!(isNull objectParent player)} && {(playerSide isEqualTo west || playerSide isEqualTo east || (isHSS(player)) || (isCID(player)))}) then {
            // Bargate
            {
                if (playerside isEqualTo east && { (_x getVariable ["isGate",sideUnknown]) isEqualTo east }) then {
                    if (_x animationPhase "Door_1_rot" isEqualTo 1) then {
                        _x animate ["Door_1_rot", 0];
                    } else {
                        _x animate ["Door_1_rot", 1];
                    };
                };
                if (playerside isEqualTo west && { (_x getVariable ["isGate",sideUnknown]) isEqualTo west })then {
                    if (_x animationPhase "Door_1_rot" isEqualTo 1) then {
                        _x animate ["Door_1_rot", 0];
                    } else {
                        _x animate ["Door_1_rot", 1];
                    };
                };
            } forEach (nearestObjects [player, ["Land_BarGate_F"], 15]);

            // Another gate
            {
                if (playerside isEqualTo east && { (_x getVariable ["isGate",sideUnknown]) isEqualTo east }) then {
                    if (_x animationPhase "Door_1_move" isEqualTo 1) then {
                    _x animate ["Door_1_move", 0];
                    } else {
                    _x animate ["Door_1_move", 1];
                    };
                };
                if (playerside isEqualTo west && { (_x getVariable ["isGate",sideUnknown]) isEqualTo west }) then {
                    if (_x animationPhase "Door_1_move" isEqualTo 1) then {
                        _x animate ["Door_1_move", 0];
                    } else {
                        _x animate ["Door_1_move", 1];
                    };
                };
            } forEach (nearestObjects [player, ["Land_ConcreteWall_01_m_gate_F","Land_ConcreteWall_01_l_gate_F"], 15]);
        };
    };

    // Police Backups
    case _copBackupKey: {
        if(_shift && {(playerSide isEqualTo west || (isCID(player)) || PHX_isPM)}) then {
            if !(isRestrained(player)) then {
                [] spawn PHX_fnc_callBackup;
            };
        };
    };

    /* Admin Tools */
    case 59: { if(_shift) then { ['dutyMode'] call PHX(doPower); _handled = true } };
    case 60: { if(_shift && { !dialog } && { FETCH_CONST(life_adminlevel) >= 1 }) then { [] call PHX(openMenu); [23900, "Admin"] call PHX(switchApp); _handled = true } };
    case 61: { if(_shift && { player getVariable ["isAdmin", false] } && { cursorObject isKindOf "Man" }) then { [] remoteExecCall ["PHX_fnc_healTarget", cursorObject]; _handled = true } };
    case 62: { if(_shift && { player getVariable ["isAdmin", false] } && { cursorObject isKindOf "Man" } && { isDowned(cursorObject) }) then { [player] remoteExecCall ["PHX_fnc_onRevived", cursorObject]; _handled = true } };
    case 63: { if(_shift && { player getVariable ["isAdmin", false] && { FETCH_CONST(life_adminlevel) >= 2 } }) then { ['invisibility'] call PHX(doPower); _handled = true } };
    case 64: { if(_shift && { player getVariable ["isAdmin", false] && { FETCH_CONST(life_adminlevel) >= 3 } }) then { ['camera'] call PHX(doPower); _handled = true } };
    case 9: { if(_shift && { FETCH_CONST(life_adminlevel) >= 5 }) then { ["%1 %2"] call PHX_fnc_teleport; _handled = true } };

    //U Key
    case 22: {
        if (!_alt && !_ctrlKey) then {
            if (isDowned(player)) exitWith {};
            private _veh = if (isNull objectParent player) then {
                cursorObject;
            } else {
                vehicle player;
            };

            if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
                if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    private _door = [_veh] call life_fnc_nearestDoor;
                    if (_door isEqualTo 0) exitWith {NOTIFY("You are not near a door!","red")};
                    private _locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

                    if (_locked isEqualTo 0) then {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
                        _veh animate [format["door_%1_rot",_door],0];
                        NOTIFY("You have locked the door","cyan");
                    } else {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
                        _veh animate [format["door_%1_rot",_door],1];
                        NOTIFY("You have unlocked the door","cyan");
                    };
                };
            } else {
                private _locked = locked _veh;
                if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    if (_locked isEqualTo 2) then {
                        if (local _veh) then {
                            _veh lock 0;
                        } else {
                            [_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];
                        };
                        NOTIFY("You have unlocked the vehicle","cyan");
                        [_veh,"unlockCarSound",50,1] remoteExecCall ["life_fnc_say3D",RANY];
                    } else {
                        if (local _veh) then {
                            _veh lock 2;
                        } else {
                            [_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];
                        };
                        NOTIFY("You have locked the vehicle","cyan");
                        [_veh,"lockCarSound",50,1] remoteExecCall ["life_fnc_say3D",RANY];
                    };

                    // Update Locked / Unlocked HUD Icons...
                    if !((crew _veh) isEqualTo []) then {
                        [] RemoteExecCall ["PHX_fnc_hudUpdate", (crew _veh)];
                    };
                };
            };
        };
    };

    // Repair Object - Instert
    case 210: {
        if ((player getVariable ["isAdmin",false]) && {!isNull cursorObject} && {cursorObject distance player < 10}) then {
            cursorObject setDamage 0;
        };
    };

    // Delete Vehicle - Delete
    case 211: {
        if ((player getVariable ["isAdmin",false]) && {[cursorObject, ["landVehicle","Air","Ship","Land_Bodybag_01_black_F"]] call PHX(isKindOf)} && {!isNull cursorObject} && {cursorObject distance player < 200}) then {
            deleteVehicle cursorObject;
        };
    };
};

_handled;
