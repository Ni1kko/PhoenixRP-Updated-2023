/*
*   @File: fn_getSetting.sqf
*   @Author: Sig
*
*   Description: Gets the value of a setting in the database...
*/
if (!params [["_name", "", [""]]]) exitWith {};

([format ["SELECT value FROM serversettings WHERE name='%1'", _name], 2] call DB_fnc_asyncCall) param [0, "", [""]]