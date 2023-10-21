/*
*   @File: fn_minByIndex.sqf
*   @Author: Sig
*
*   Description: Selects the lowest (min) array based on the given index
*   of the array
*
*   Arguments
*     0 <TYPE: ARRAY> - Array that you will be selecting from
*     1 <TYPE: NUMBER> - Index of (2D) array the function will be selecting from
*
*   Example
*                                     0.33                        0.15                        0.7
*     private _array = [ [player1, damage player1], [player 2, damage player2], [player 3, damage player 3] ];
*     [_array, 1] call PHX_fnc_minByIndex.sqf
*
*     Returns the second element ([player 2, damage player2]) as that element has the lowest number (0.15) at the given index (1)
*
*   Return
*     <TYPE: ARRAY> Selected element with lowest value
*/

#include "..\..\script_macros.hpp"

if !(params [

  ["_array", [], [[]]],
  ["_index", -1, [0]]

]) exitWith {};

private _return = _array param [0, [], [[]]];

{

  if (_x param [_index] < _return param [_index]) then {
    _return = _x;
  };

} count _array;

_return