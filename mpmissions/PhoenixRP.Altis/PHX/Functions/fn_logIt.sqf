/*
    @File: fn_logIt.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Creates easy to understand RPT Log entries...
*/
#include "..\..\script_macros.hpp"
params [
	["_func", "Unknown", [""]],
	["_type", "Unknown", [""]],
	["_msg", "N/A", [""]]
];

/*
 Prints: 
 	Mission Name (PHX), 
	Version (We don't update it but if we did it could be useful to have)
	Function (Passed as a permeter, I'd recommend putting the file name like this: buyVehicle for this)
	Type (Whether it's an Error, Progress Check, Etc)
	Message (What happend at this stage)

 All the paremeters can be ignored if you want and will default but it'd make this semi pointless...
*/

diag_log format["[PHX][v%1][%2][%3][%4]", (LIFE_SETTINGS(getText,"framework_version")), _func, _type, _msg];
