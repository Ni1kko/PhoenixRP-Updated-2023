/*
	@File: fn_onDamaged.sqf

	@Author: Jack "Scarso" Farhall

	@Description: Handles all damage...

	@Parameters:
		0 - TYPE: OBJECT - DES: The damaged object...
		1 - TYPE: STRING - DES: The part of the object that was damaged...
		2 - TYPE: INTGER - DES: The damage taken...
		3 - TYPE: OBJECT - DES: The source of the damage...
		4 - TYPE: STRING - DES: The bullet that caused the damage...
		5 - TYPE: INTGER - DES: No idea tbh...
*/
scopeName "onDamaged";
#include "..\..\script_macros.hpp"
params [
    ["_unit",objNull,[objNull]],
    ["_part","",[""]],
    ["_damage",0,[0]],
    ["_source",objNull,[objNull]],
    ["_projectile","",[""]],
    ["_index",0,[0]]
];

// Get our current damage...
private _orginalDamage = [
	_unit getHit _part,
	damage _unit
] select (_part isEqualTo "");

if (_unit getVariable ["isAdmin", false]) exitWith { _orginalDamage };

/* Seatbelt System */
if ((vehicle _unit) isKindOf "Car" && (isNull _source || _source isEqualTo _unit)) then {
	if (_unit getVariable ["seatbelt", false]) then {
		_damage = (_damage / 2);

		if (_damage < _orginalDamage) then {
			_damage = _orginalDamage;
		};
	};
};

// If theses are true don't change player damage...
if (life_istazed || { life_isknocked }) exitWith { _orginalDamage };

// If we have a source and the souce is not ourselves...
if (!isNull _source && { !(_source isEqualTo _unit) }) then {
	if (!(isDowned(_unit)) && alive _unit) then {
		if (isPlayer _source) then {

			private _isOpenTop = typeOf vehicle _unit in [
			  "B_Quadbike_01_F",
			  "C_Quadbike_01_F",
			  "C_Kart_01_Blu_F",
			  "C_Kart_01_Red_F",
			  "C_Kart_01_Fuel_F",
			  "C_Kart_01_Vrana_F"
			]; // -- Vehicles one can be tazed out of...

			/*
				Taser
				Credit: Tonic
			*/
			if ((currentWeapon _source in LIFE_SETTINGS(getArray,"taserGuns")) && (_projectile in LIFE_SETTINGS(getArray,"taserAmmo"))) then {
				if (alive _unit) then {
					if !(life_istazed) then {
						if (_unit distance _source < 35) then {
							if !(isNull objectParent _unit) then {
								if (_isOpenTop) then {
									_unit action ["Eject",vehicle _unit];
									[_unit,_source] spawn life_fnc_tazed;
								};
							} else {
								[_unit,_source] spawn life_fnc_tazed;
							};
						};
					};

					_damage = _orginalDamage;
				};
			};

			/* Rubbers */
			if (side group _source isEqualTo west || side group _source isEqualTo east) then {
				if ((currentWeapon _source) in LIFE_SETTINGS(getArray,"rubberGuns")) then {
					if (_projectile isEqualTo "B_556x45_Ball_Tracer_Green") then {

						if (_unit distance _source < 300) then {
							_damage = _orginalDamage; //--- Keep health

							if ((!isNull objectParent _unit) && !_isOpenTop) exitWith {}; //--- Closed vehicle, nice try but fuck off...
							if (_isOpenTop) then {moveOut _unit;};
							[_unit, _source] spawn life_fnc_tazed;
						};
					};
				};
			};

			/* Anti-Restrain Glitch */
			if(isRestrained(_source)) then { _damage = _orginalDamage };
		};

		/* Anti-VDM */
		private _sourceVeh = vehicle _source;
		if ([_sourceVeh, ["LandVehicle", "Air", "Ship"]] call PHX(isKindOf) && _projectile isEqualTo "" && !(_sourceVeh isEqualTo (vehicle _unit))) then {

			if !(diag_tickTime - (_unit getVariable ["vdmVar", 0]) < 1) then {
				[format ["You have just been ran over by: %1", name _source], "red"] call PHX(notify);
			};
			_unit setVariable ["vdmVar", diag_tickTime ];

			_orginalDamage breakOut "onDamaged";
		};

		if (call PHX_fnc_isSafeZone) then {_damage = _orginalDamage};
	};
};

if (_part isEqualTo "" && { diag_tickTime  - (_unit getVariable ["vdmVar", 0]) < 1 }) exitWith {_orginalDamage};

/*
	Incapacitation System
	Credit: Jack "Scarso" Farhall
*/
if (_damage >= 1) then {
	_damage = 0.99; // They're hurt... 1 or over would kill them...

	// If they're already downed, kill them...
	if (isDowned(_unit)) then {
		// Checks...
		if (diag_tickTime - (_unit getVariable ["Incap_time", 0]) < 2) exitWith {};
		if (isNull _source || {_projectile isEqualTo ""} || {currentWeapon _source isEqualTo ""}) exitWith {}; // They can only die if killed by a source...
		if (_source distance _unit > 50) exitWith {};
		if (_part in ["arms", "legs", "hands"]) exitWith {}; // Require the shot to hit them in the head or chest to execute them...
		if ((currentWeapon _source in LIFE_SETTINGS(getArray,"taserGuns")) && (_projectile in LIFE_SETTINGS(getArray,"taserAmmo"))) exitWith {};
		if ((currentWeapon _source) in LIFE_SETTINGS(getArray,"rubberGuns") && (_projectile isEqualTo "B_556x45_Ball_Tracer_Green")) exitWith {};

		_damage = 1; // Kill them...
	} else {
		if !(alive _unit) exitWith {}; // They're dead??

		_unit setVariable ["Incap_time", diag_tickTime, true];
		[_unit, _source, "event", (_part isEqualTo "head")] spawn PHX(onIncapacitated); // Event...
	};
};

[] spawn PHX_fnc_hudUpdate;
_damage;
