/*
	@File: fn_onIncapacitated.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Does everything that needs to be done when a player is shot...

	@Parameters:
		0 - TYPE: OBJECT - DES: The object being incapacitated...
		1 - TYPE: OBJECT - DES: The object that incapacitated the object...
		2 - TYPE: STRING - DES: The stage we're at...
*/
#include "..\..\script_macros.hpp"
params [
	["_unit", objNull, [objNull]],
	["_killer", objNull, [objNull]],
	["_type", "event", [""]],
	["_headshot", false, [true]]
];

if !(canSuspend) exitWith { _this spawn PHX(onIncapacitated) };

if (isNull _unit) exitWith {}; // What??
if !(isPlayer _unit) exitWith {}; // Only players can be incapacitated...

switch (_type) do {
	case "event": {
		if (isDowned(_unit)) exitWith {}; // No Double Downing...
		if !(isNull objectParent _unit) then { moveOut _unit }; // Get them out the vehicle...

		_unit switchmove "";
		_unit setUnconscious true;

		setKiller(_unit, _killer); // Set the source as our killer...
		setDowned(_unit); // Set the unit as incapacitated...

		// Notify the server...
		if (!isNull _killer && { isPlayer _killer } && { !(_killer isEqualTo _unit) }) then {
			[0, format ["%1 was seriously injured by %2", 
				_unit getVariable ["realname", name _unit], 
				_killer getVariable ["realname", name _killer]
			]] remoteExecCall ["life_fnc_broadcast", RCLIENT];

			if ([(position _unit)] call PHX_fnc_isRedZone && { [(position _killer)] call PHX_fnc_isRedZone }) then {
				// If we're from a different gang and in a redzone we increase our killers kills...
				// We also increase our deaths...
				if !(((group _unit) getVariable ["gang_id", -2]) isEqualTo ((group _killer) getVariable ["gang_id", -3])) then {
					
					["kills"] remoteExecCall ["PHX_fnc_setStat", _killer];
					[10,"Redzone kill"] remoteExecCall ["PHX_fnc_handleXP", _killer];

					if (_headshot) then {
						["headshots"] remoteExecCall ["PHX_fnc_setStat", _killer];
					};

					["deaths"] call PHX(setStat);
				};
			};
		} else {
			[0, format ["%1 was seriously injured", 
				_unit getVariable ["realname", name _unit]
			]] remoteExecCall ["life_fnc_broadcast", RCLIENT];
		};

		[_unit, _killer, "client"] remoteExecCall ["PHX_fnc_onIncapacitated", _unit]; // Time for the client to do something...
		[11] call SOCK_fnc_updatePartial;
	};

	case "client": {
		if !(_unit isEqualTo player) exitWith {}; // If we're not the downed unit, why run this code?

		if !(isNull objectParent _unit) then { moveOut _unit }; // Get them out the vehicle...
		while {dialog} do { closeDialog 0 }; // Close all dialogs...

		player switchCamera "Internal"; // Switch to first person...

		// Create / Setup Incapacitated UI...

		// Hide the actual HUD...
		PHX_hideHUD = true;
		[] call PHX_fnc_hudUpdate;

		["RscIncapacitated"] call PHXUI_fnc_createLayer;
		private _display = ["RscIncapacitated"] call PHXUI_fnc_getLayer;

		(_display displayCtrl 9001) ctrlSetStructuredText parseText ([
			format["<t align='center' size='2'>You seriously injured yourself</t>"],
			format["<t align='center' size='2'>%1 seriously injured you</t>", _killer getVariable ["realname", name _killer]]
		] select (!isNull _killer && { isPlayer _killer } && { !(_killer isEqualTo _unit) }));

		{ppEffectDestroy _x} forEach PHX_effects; // Remove Effects that might already exist from before...

		// Blurry effect...
		_effectBlur = ppEffectCreate ["DynamicBlur", 300];
		_effectBlur ppEffectEnable true;
		_effectBlur ppEffectAdjust [2.5];
		_effectBlur ppEffectCommit 3;

		_effectColour = ppEffectCreate ["colorCorrections", 301];
		_effectColour ppEffectEnable true;
		_effectColour ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.7], [1, 0, 0, 0.5],[1, 1, 1, 0]]; 
		_effectColour ppEffectCommit 3;
		PHX_effects pushBack [_effectColour,_effectBlur];

		if (CASH > 0) then {
			[player, format ["%1 (%2) died and dropped %3.",_unit getVariable ["realname",name _unit],getPlayerUID _unit,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
		};

		// Handle Needs...
		life_hunger = 100;
		life_thirst = 100;
		PHX_saveGear = false;

		_unit setVariable ["restrained",sideUnknown,true];
		_unit setVariable ["Escorting",false,true];
		_unit setVariable ["playerSurrender",false,true];

		// Double ensure these are done...
		_unit switchmove "";
		_unit setUnconscious true;
	
		// Wanted Handling...
		if (!isNull _killer && {!(_killer isEqualTo _unit)}) then {
			life_removeWanted = true;
		};
		
		// If these loop is already running, kill it.
		if !(isNil "PHX_fnc_bleedout_timer") then {terminate PHX_fnc_bleedout_timer};
		if !(isNil "PHX_fnc_force_bleedout") then {terminate PHX_fnc_force_bleedout};

		PHX_fnc_bleedout_timer = [_unit] spawn {
			private _unit = _this select 0;
			private _respawnTime = LIFE_SETTINGS(getNumber,"respawn_timer");
			private _increaseTime = LIFE_SETTINGS(getNumber,"bleedout_increase");
			private _originalIncrease = _increaseTime;
			private _startTime = time;
			PHX_endTime = _startTime + (LIFE_SETTINGS(getNumber,"bleedout_timer")); // Current Time + Bleedout Time
			private _originalTime = PHX_endTime;
			private _display = ["RscIncapacitated"] call PHXUI_fnc_getLayer;
			private _progressBar = _display displayCtrl 9004;
			private _progressBarText = _display displayCtrl 9003;
			_progressBar progressSetPosition 1;

			// "Bleed Loop"
			for "_i" from 0 to 1 step 0 do {
				if (!alive player || !(isDowned(player))) exitWith {}; // Exit checks...

				// My time is up... Kill me...
				if (time >= PHX_endTime) exitWith {
					player setDamage 1; // Kill me...
				};

				// Force Bleedout...
				if (PHX_bleedFaster) then {
					for "_i" from 0 to 1 step 0 do {
						PHX_endTime = PHX_endTime - _increaseTime;
						_progressBar progressSetPosition (1 - ((time - _startTime) / (PHX_endTime - _startTime)));
						if (!PHX_bleedFaster || { time >= PHX_endTime }) exitWith {};
						sleep 0.5;
					};
				};

				// Get Nearest Medic...
				private _medDistance = -1;
				{
					private _distance = player distance _x;
					if (_distance < _medDistance || (_medDistance <= -1)) then { _medDistance = _distance };
				} foreach (playableUnits select {
					side _x isEqualTo independent && 
					{ alive _x } && 
					{ !(isDowned(_x)) } &&
					{ !(_x isEqualTo player) }
				});

				// Set the progress bar...
				_progressBar progressSetPosition (1 - ((time - _startTime) / (PHX_endTime - _startTime)));

				if (isNull(_unit getVariable ["Reviving", objNull])) then {
					(_display displayCtrl 9003) ctrlSetStructuredText parseText "<t align='center' size='1'>Bleeding out...</t>";
					_progressBar ctrlSetTextColor [0.75,0,0,0.9];
				} else {
					(_display displayCtrl 9003) ctrlSetStructuredText parseText format["<t align='center' size='1'>You are being revived by %1</t>",((_unit getVariable ["Reviving", objNull]) getVariable ["realname",name (_unit getVariable ["Reviving", objNull])])];
					_progressBar ctrlSetTextColor [0,0.7,0,1];
				};

				private _respawnStatus = [
					"Waiting to respawn...",
					"Press <t color = '#8A2BE2'>Space</t> to respawn..."
				] select (time >= (_startTime + _respawnTime));

				if (time >= (_startTime + _respawnTime)) then { PHX_canRespawn = true }; // Toggle respawn...

				// Set the nearest value...
				(_display displayCtrl 9002) ctrlSetStructuredText parseText ([
					format["<t align='left' size='1'>%2</t><t align='right' size='1'>Nearest Medic: %1m</t>",
						[(round _medDistance)] call life_fnc_numberText,
						_respawnStatus
					],
					format["<t align='left' size='1'>%1</t><t align='right' size='1'>No Medics Online</t>", _respawnStatus]
				] select (_medDistance <= -1));
			};
		};

		[] call LIFE(medicRequest); // Request Help...
		[0] call DB(updatePartial); // Update Money...
		[3] call DB(updatePartial); // Update Gear...
	};
};