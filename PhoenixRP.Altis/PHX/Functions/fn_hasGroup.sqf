/*
*   @File: fn_hasGroup.sqf
*   @Author: Sig
*
*   Description: Checks whether or not the given player
*   has a group (meaning checking for actual altis life gang or side)
*
*   Arguments
*     0 <TYPE: OBJECT> - Player to check
*
*   Return
*     <TYPE: BOOLEAN> - Whether or not the player has a valid group
*/

if !(params [["_player", objNull, [objNull]]]) exitWith {false};

!isNil {(group _player) getVariable 'gang_name'} || side _player in [west, east]
