/*
	@File: fn_getDestroyerValue.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Setup the Armoury Vault...
*/
private _value = round((((count playableUnits) / 3)) + (time / 60)); // The round shouldn't be needed but just in case...
private _barWeight = getNumber (missionConfigFile >> "CfgItems" >> "plutonium" >> "weight");

havoc_box setVariable ["Trunk", [[["plutonium", _value]], (_barWeight * _value)], true];