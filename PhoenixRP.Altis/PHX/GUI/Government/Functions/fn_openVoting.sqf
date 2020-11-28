/*
	@File: fn_openVoting.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens and fills out the voting UI...
*/
#include "..\..\..\..\script_macros.hpp"
(_this select 3) params [
	"_title", "_type", "_id", "_options", "_desc"
];

if (playerSide isEqualTo east) exitWith {["HAVOC members are unable to vote in the elections", "red"] spawn PHX(notify)}; // Fuck em...

createDialog "RscVote";
private _display = findDisplay 3000;
waitUntil { !(isNull _display) };

if (count _options <= 0) exitWith {["There are no options on the ballot", "red"] spawn PHX(notify); closeDialog 0};
if (isNil "PHX_checkIDC") then { PHX_checkIDC = [] };

private _info = _display displayCtrl 3002;
private _exampleBox = _display displayCtrl 3003;

// Example Settings...
_info ctrlSetStructuredText parseText format[
	"<t size='0.8'>%1<br/>" +
	"1 ) Check the box next to your option.<br/>" + 
	"2 ) Select 'Submit Vote'</t>",
	_desc
];
_exampleBox cbSetChecked true; // Set Example Checkbox to Checked...
ctrlEnable[3003, false]; // Disable Example Checkbox...

// Change Name
ctrlSetText[3001, format["%1's Ballot", name player]];

// Disable Controls...
ctrlEnable[3005, false]; // Disable Submit Button...

private _nextPos = 0.236;
private _posIncrease = 0.088;

private _controlGroup = _display displayCtrl 3004;
private _baseIDC = 3006;

{
	_x params ["_id", "_pollID", "_name", "_uid", "_description"];

	// Create the background...
	_background = _display ctrlCreate ["Life_RscBackground", -1, _controlGroup];
	_background ctrlSetPosition [
		0.298906 * safezoneW + safezoneX,
		_nextPos * safezoneH + safezoneY,
		0.226875 * safezoneW,
		0.077 * safezoneH
	];
	_background ctrlSetBackgroundColor [0.1,0.1,0.1,1];

	// Create the structured text...
	_text = _display ctrlCreate ["Life_RscStructuredText", -1, _controlGroup];
	_text ctrlSetPosition [
		0.298906 * safezoneW + safezoneX,
		_nextPos * safezoneH + safezoneY,
		0.17375 * safezoneW,
		0.077 * safezoneH
	];
	_text ctrlSetBackgroundColor [0,0,0,0];
	_text ctrlSetStructuredText parseText format[
		"<t size='1.15'>%1</t><br/>" +
		"<t size='0.8'>%2</t>",
		_name,
		_description
	];

	// Checkbox
	_checkbox = _display ctrlCreate ["Life_Checkbox", _baseIDC, _controlGroup];
	_checkbox ctrlSetPosition [
		0.489687 * safezoneW + safezoneX,
		(_nextPos + 0.011) * safezoneH + safezoneY,
		0.0309375 * safezoneW,
		0.055 * safezoneH
	];

	private _func = format["[%1, %2] call PHX_fnc_switchVote;", [_id, _uid, _pollID], _baseIDC];
	_checkbox ctrlSetEventHandler ["CheckedChanged", _func];
	PHX_checkIDC pushBackUnique _baseIDC;

	// Commit changes...
	_text ctrlCommit 0;
	_background ctrlCommit 0;
	_checkbox ctrlCommit 0;

	_nextPos = _nextPos + _posIncrease;
	_baseIDC = _baseIDC + 1; // Increment me baby!
} forEach _options;