#include "..\..\..\..\script_macros.hpp"
/*
 *  File: fn_removeWatchlist.sqf
 *  Author: Zyn
 *
 *  Description:
 *  
*/

(profileNamespace getVariable ["PHX_Watchlist",[]]) deleteAt (CONTROL_VALUE(36001));
NOTIFY("Successfully deleted from watchlist","green");
closeDialog 0;
[] spawn PHX_fnc_openWatchlist