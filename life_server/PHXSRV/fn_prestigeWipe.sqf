/*
	@File: fn_prestigeWipe.sqf
	@Author: Jack "Scarso" Farhall
	@Description: DB Wipe for Prestige...
*/
if !(params [["_steamid", "", [""]],["_prestigeLvl", -1, [0]]]) exitWith {};

[
	format["UPDATE phxclients SET 
		civ_professions = '""[]""', 
		cop_professions = '""[]""', 
		med_professions = '""[]""', 
		hav_professions = '""[]""', 
		cop_perks = '""[]""', 
		civ_perks = '""[]""', 
		med_perks = '""[]""', 
		hav_perks = '""[]""', 
		level = '1', 
		xp = '0', 
		prestigeLevel ='%2' 
	WHERE playerid = '%1'", _steamid, _prestigeLvl],
	1
] call DB_fnc_asyncCall;