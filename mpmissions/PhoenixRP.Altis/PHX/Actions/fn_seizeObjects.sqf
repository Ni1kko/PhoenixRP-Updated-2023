#include "..\..\script_macros.hpp"
/*
    File: fn_seizeObjects.sqf
    Description:
    Deletes ground objects (police only)
*/

_clear = nearestObjects [player,["weaponholder"],3];
_clear = _clear + nearestObjects [player,["groundWeaponHolder"],3];

for "_i" from 0 to count _clear - 1 do {
	_var = _clear select _i;
	_mags = getMagazineCargo _var;
	_items = getItemCargo _var;
	_weapons = getWeaponCargo _var;
	clearBackpackCargo _var;

	// If we're a cop, send it to the evidence lockup...
	if (playerSide isEqualTo west) then {
		if (count (_mags select 0) > 0) then {{evidence_locker addMagazineCargoGlobal [_mags select 0 select _forEachIndex,_mags select 1 select _forEachIndex]} forEach (_mags select 0); clearMagazineCargo _var;};
		if (count (_items select 0) > 0) then {{evidence_locker addItemCargoGlobal [_items select 0 select _forEachIndex,_items select 1 select _forEachIndex]} forEach (_items select 0); clearItemCargo _var;};
		if (count (_weapons select 0) > 0) then {{evidence_locker addWeaponCargoGlobal [_weapons select 0 select _forEachIndex,_weapons select 1 select _forEachIndex]} forEach (_weapons select 0);  clearWeaponCargo _var;};
	};
	
	deleteVehicle (_clear select _i);
};

["You've seized the items around you..."] call PHX_fnc_notify;