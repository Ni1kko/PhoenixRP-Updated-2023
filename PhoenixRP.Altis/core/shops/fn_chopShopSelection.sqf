/*
    File: fn_chopShopSelection.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Displays the pricing for the currently selected vehicle.
*/
disableSerialization;

params [
	["_control", controlNull, [controlNull]],
	["_selection",-1,[0]]
];

//Error checks
if (isNull _control || _selection isEqualTo -1) exitWith {};

private _price = _control lbValue _selection;
((findDisplay 39400) displayCtrl 39401) ctrlSetStructuredText parseText format ["<t color='#8cff9b'>£%1</t>",[(_price)] call life_fnc_numberText];