#include "..\..\..\..\..\script_macros.hpp"

private _buttons = [];

_buttons pushBack ["Repair Object", "[] spawn PHX_fnc_repairObject; closeDialog 0;"];

["Repair Interaction", _buttons]