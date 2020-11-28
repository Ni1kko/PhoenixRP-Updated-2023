/*
	@File: fn_getNearestLocation.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns the name of our nearest location...
*/
text ((nearestLocations [getPos player ,["NameCity", "NameCityCapital", "NameVillage"], 10000]) select 0);