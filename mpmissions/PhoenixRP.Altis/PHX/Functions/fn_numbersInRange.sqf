/*
*   @File: fn_numbersInRange.sqf
*   @Author: Sig
*
*   Description: Returns an array with round numbers in the range given
*
*   Arguments
*     0 <TYPE: NUMBER> - Starting
*     1 <TYPE: NUMBER> - Ending
*
*   Return
*     <TYPE: ARRAY> - Array with the numbers in it
*/

if !(params [

  ["_start", -1, [0]],
  ["_end", -1, [0]]

]) exitWith {};

private _return = [];

for "_i" from _start to _end do {
  _return pushBack _i
};

_return