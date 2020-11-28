/*
 *  @File: fn_getVehicleAmmo.sqf
 *  @Author: Zyn
 *
 *  Description:
 *  Gets a turrets ammo and returns a number between 0 and 1 as to how much ammo is left
*/

params [
    ["_vehicle",objNull,[objNull]]
];

private _ammo = 0;
{
	_ammo = _ammo + (_x select 1);
} forEach (magazinesAmmo _vehicle);

private _magazines = getArray(configFile >> "CfgWeapons" >> ((weapons _vehicle) select 0) >> "magazines");

(_ammo / ((count _magazines) * (getNumber(configFile >> "CfgMagazines" >> (_magazines select 0) >> "count"))))