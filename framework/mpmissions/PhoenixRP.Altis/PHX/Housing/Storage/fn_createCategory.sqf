/*
	@File: fn_createCategory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles the client side creation of a new category...
*/
#include "..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgHousing" >> worldName
params [["_button", controlNull, [controlNull]]];

_button ctrlEnable false;

private _house = house;
if (isNull _house) exitWith { ["An error occured..."] spawn PHX(notify); _button ctrlEnable true };

if (isNil {_house getVariable "inStorage"}) exitWith { ["An error occured..."] spawn PHX(notify); closeDialog 0 };
private _tar = (_house getVariable "inStorage");
if !(_tar isEqualTo player) exitWith { [format["%1 is currently using this storage...", _tar getVariable ["realname", name _tar]]] spawn PHX(notify); closeDialog 0 };

private _categories = house_categories;

private _catID = (count _categories);
private _maxCategories = getNumber(CFG >> (typeOf _house) >> "storage");

if !(_maxCategories > _catID) exitWith { [format["This house can only have a max of %1 categories.", _maxCategories]] call PHX(notify) };

private _catCost = LIFE_SETTINGS(getNumber, "categoryCost");

if (BANK < _catCost) exitWith {
	[format["You require £%1 in your bank to buy a new category...", [_catCost] call LIFE(numberText)]] spawn PHX(notify);
	_button ctrlEnable true;
};

private _action = [
	format["Are you sure you wish to create another category for £%1?", [_catCost] call LIFE(numberText)],
	"Category Confirmation",
	"Create",
	"Cancel"
] call PHX_fnc_confirmBox;

if (_action) then {
	[_catCost, 1, 1, "Purchased A House Category"] call PHX_fnc_handleMoney;
	[player, format ["%1 (%2) purchased a new house catergory for %3. Bank Balance: %4 On Hand Balance: %5",profileName,getPlayerUID player,[_catCost] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

	[_house, _catID] remoteExecCall (["fnc_insertCategory", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

	_categories pushBack [
		-1,
		(_house getVariable "house_id"),
		_catID,
		format["Category %1", _catID],
		1,
		[]
	];

	// Had to spawn this to stop constant crashing...
	[_categories, _button] spawn {
		sleep 0.3; // Delay to ensure it's created...
		[(_this select 0)] call PHX(updateCategories);
		[format["Your new category has been successfully created!"]] call PHX(notify);
	};
};