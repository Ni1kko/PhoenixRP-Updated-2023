/**
 * @File: fn_unitByUID.sqf
 * @Created: 26.01.2018 (January 26th) [Sig]
 * ---------------------------------------------
 * @Description: Returns the unit that has the given PlayerUID assigned
 */

if (!params [["_uid", "", [""]]]) exitWith {objNull};

private _index = playableUnits findIf {getPlayerUID _x isEqualTo _uid};
if (_index < 0) exitWith {objNull};

playableUnits select _index