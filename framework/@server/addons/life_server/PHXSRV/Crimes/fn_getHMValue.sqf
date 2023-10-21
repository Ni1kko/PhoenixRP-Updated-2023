/*
	@File: fn_getHMValue.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Setup the HM Vault...
*/
private _value = round((((count playableUnits) / 3)) + (time / 60)); // The round shouldn't be needed but just in case...
private _barWeight = getNumber (missionConfigFile >> "CfgItems" >> "goldbar" >> "weight");

fed_bank setVariable ["Trunk", [[["goldbar", _value]], (_barWeight * _value)], true];