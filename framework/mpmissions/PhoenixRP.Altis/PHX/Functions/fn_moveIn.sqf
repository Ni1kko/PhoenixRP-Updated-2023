params [
  ["_unit", objNull, [objNull]],
  ["_target", objNull, [objNUll]]
];

if (isNull _unit || isNull _target) exitWith {};

life_disable_getIn = false;
_unit moveInCargo _target;
life_disable_getOut = true;