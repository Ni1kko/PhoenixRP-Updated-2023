/*
	@File: fn_nearBase.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Checks whether the object is near a gang base (within 500m)...
*/
params [["_obj", player, [objNull]]];

(getArray(missionConfigFile >> "CfgSettings" >> "baseMarkers")) findIf ({((getPos _obj) distance (getMarkerPos _x)) <= 500}) > -1