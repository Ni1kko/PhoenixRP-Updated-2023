/*
	@File: fn_openLegality.sqf
	@Author: Jack "Scarso" Farhall
	@Description: 
*/
#include "..\..\..\..\script_macros.hpp"

if !(PHX_isPM) exitWith {["You're not allowed to change any legislation","red"] spawn PHX(notify)};

disableSerialization;

if !(isNull (findDisplay 4000)) exitWith {}; // Already Active...
createDialog "RscLegality"; // Create the dialog...

waitUntil {!isNull (findDisplay 4000)};
private _display = findDisplay 4000;

private _nextPos = 0.236; // Y-Positions...
private _posIncrease = 0.088; // Change in Y-Positions...

private _controlGroup = CONTROL(4000, 4002);
private _justText = [];
private _added = [];
private _baseIDC = 4004;

{
	private _legalText = (getText (_x >> "illegal"));

	if (((_justText find _legalText) <= -1)) then {
		_justText pushBackUnique _legalText;
		_added pushBackUnique [_legalText, _baseIDC];

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
			"<t size='1.5'>%1</t>",
			_legalText
		];

		// Checkbox
		_checkbox = _display ctrlCreate ["Life_Checkbox", _baseIDC, _controlGroup];
		_checkbox ctrlSetPosition [
			0.489687 * safezoneW + safezoneX,
			(_nextPos + 0.011) * safezoneH + safezoneY,
			0.0309375 * safezoneW,
			0.055 * safezoneH
		];

		_checkbox cbSetChecked (ITEM_ILLEGAL(configName _x));
		
		// Commit changes...
		_text ctrlCommit 0;
		_background ctrlCommit 0;
		_checkbox ctrlCommit 0;

		_nextPos = _nextPos + _posIncrease;
		_baseIDC = _baseIDC + 1; // Increment me baby!
	};
} forEach ("!(isNumber (_x >> 'illegal'))" configClasses (missionConfigFile >> "CfgItems"));

PHX_Legality = _added; // Save it for other scripts to use...