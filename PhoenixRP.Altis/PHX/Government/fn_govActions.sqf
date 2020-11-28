/*
	@File: fn_govActions.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Adds Governor's actions to something...
*/
#include "..\..\script_macros.hpp"
if !(params [["_object", objNull, [objNull]]]) exitWith {};

_object addAction ["<t color='#ffe599'>[GOVERNOR]</t> Set Taxes", PHX_fnc_openLegislation, "Tax", 2, true, true, "", "PHX_isPM && playerSide isEqualTo civilian", 5];
_object addAction ["<t color='#ffe599'>[GOVERNOR]</t> Set Base Paychecks", PHX_fnc_openLegislation, "Paycheck", 2, true, true, "", "PHX_isPM && playerSide isEqualTo civilian", 5];
_object addAction ["<t color='#ffe599'>[GOVERNOR]</t> Set Revial Fee", PHX_fnc_openLegislation, "Revival", 2, true, true, "", "PHX_isPM && playerSide isEqualTo civilian", 5];
_object addAction ["<t color='#ffe599'>[GOVERNOR]</t> Set Fuel Cost", PHX_fnc_openLegislation, "Fuel", 2, true, true, "", "PHX_isPM && playerSide isEqualTo civilian", 5];
_object addAction ["<t color='#ffe599'>[GOVERNOR]</t> Set Legality of Items", PHX_fnc_openLegality, nil, 2, true, true, "", "PHX_isPM && playerSide isEqualTo civilian", 5];
_object addAction ["<t color='#ffe599'>[GOVERNOR]</t> Make a Broadcast", PHX_fnc_makeBroadcast, nil, 2, true, true, "", "PHX_isPM && playerSide isEqualTo civilian", 5];