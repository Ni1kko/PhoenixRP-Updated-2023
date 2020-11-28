#include "..\..\..\..\script_macros.hpp"
/*
 *  File: fn_openWatchlist.sqf
 *  Author: Zyn
 *
 *  Description:
 *  
*/

if ((profileNamespace getVariable ["PHX_Watchlist",[]]) isEqualTo []) exitWith { NOTIFY("Add a house to your watchlist to access this!","red") };

createDialog "RscWatchlist";

waitUntil {!isNull (findDisplay 36000)};

private _display = findDisplay 36000;
if (isNull _display) exitWith {};

private _lb = _display displayCtrl 36001;
lbClear _lb;

{
	_x params ["_text","_house"];
	_image = (["\a3\3den\Data\Attributes\TaskStates\failed_ca.paa","\a3\3den\Data\Attributes\TaskStates\succeeded_ca.paa"] select (isNil { ((nearestObject [_house, "House"]) getVariable "house_owner") }));
	_lb lbAdd _text;
    _lb lbSetValue [(lbSize _lb)-1, _forEachIndex];
	_lb lbSetPicture [(lbSize _lb)-1, "data\icons\ico_house.paa"];
	_lb lbSetPictureRight [(lbSize _lb)-1, _image];
} forEach (profileNamespace getVariable ["PHX_Watchlist",[]]);