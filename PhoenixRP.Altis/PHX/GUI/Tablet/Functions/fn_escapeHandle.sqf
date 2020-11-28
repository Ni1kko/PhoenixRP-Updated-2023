#include "..\..\..\..\script_macros.hpp"
private _handled = false;

if ((_this select 1) isEqualTo 1 && (PHX_curApp != "Home")) then { 
	tableEsc call PHX(switchApp); 
	_handled = true;
};

_handled;