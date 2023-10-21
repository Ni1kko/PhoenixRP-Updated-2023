/*
	@File: fn_remoteLicense.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Allows us to remove or give a license remotely...
*/
if !(params [["_license", "", [""]], ["_bool", false, [false]]]) exitWith {};
missionNamespace setVariable [_license, _bool];