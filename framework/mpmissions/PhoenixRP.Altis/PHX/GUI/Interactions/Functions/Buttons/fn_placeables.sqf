#include "..\..\..\..\..\script_macros.hpp"

private _buttons = [];

_buttons pushBack ["Remove object", "[life_vInact_curTarget] spawn PHX_fnc_deletePlaceables; closeDialog 0;"];

["Placeables Interactions", _buttons]