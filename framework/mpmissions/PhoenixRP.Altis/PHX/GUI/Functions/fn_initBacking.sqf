/*
	@File: fn_initBacking.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Simply creates a nice "backing" display...
*/
params [["_background", true, [false]]];

["RscBacking"] call PHXUI_fnc_createLayer;
(("RscBacking" call PHXUI_fnc_getLayer) displayCtrl 101) ctrlShow _background;