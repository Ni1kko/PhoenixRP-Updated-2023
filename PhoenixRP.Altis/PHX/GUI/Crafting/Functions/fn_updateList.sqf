/*
	@File: fn_updateList.sqf
	@Author: Jack "Scarso" Farhall
	@Description: populate our list please
*/
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgBlueprints"
if !(params[["_display", displayNull, [displayNull]]]) exitWith {};

private _blueprints = ("call compile (getText(_x >> 'condition'))" configClasses (CFG >> "Virtual"));
_blueprints append ("call compile (getText(_x >> 'condition'))" configClasses (CFG >> "Physical"));

[] call PHX(wipeElements); // Wipe all created elements...

private _scrollView = (_display displayCtrl 8001);
private _idc = 8006;

#define BASED_X 0.298906
#define INCREMENT_X 0.097969
#define INCREMENT_Y 0.15

private _currentX = BASED_X - INCREMENT_X;
private _currentY = 0.236;

{
	if ((toUpper (getText(_x >> "fullName"))) find (toUpper (ctrlText 8002)) >= 0) then {
		
		// We have a bugged virtual item...
		if !(((getArray(_x >> "ingredients")) select { !(isClass (missionConfigFile >> "CfgItems" >> (_x select 0))) }) isEqualTo []) exitWith {
			["updateList", format["Item '%1' returned invalid ingredients...", (getText(_x >> "fullName"))]] call PHX_fnc_logIt;
		};

		private _button = _display ctrlCreate ["PHX_Craft_Button", _idc, _scrollView];

		private _lvl = getNumber(_x >> "level");
		private _variable = getText(_x >> "product");

		private _icon = (call compile (getText(_x >> "icon")));

		if (isClass (CFG >> "Physical" >> _variable)) then {
			_icon = ([(getText(_x >> "product"))] call life_fnc_fetchCfgDetails) select 2;
		};

		_button ctrlSetStructuredText parseText format["<br/>%1<br/><t align = 'center'>%2</t>",
			([format["<t align='center' size='3'>LVL <t color = '#8A2BE2'>%1</t></t>", _lvl],format["<img image='%1' align='center' size='3'/>", _icon]] select (_lvl <= PHX_Level)),
			getText(_x >> "name")
		];

		private _xValue = _currentX + INCREMENT_X;
		private _yValue = _currentY;

		if (_xValue > 0.515469) then {
			_xValue = BASED_X;
			_currentY = _currentY + INCREMENT_Y;
		};

		_button ctrlSetPosition [
			_xValue * safezoneW + safezoneX,
			_currentY * safezoneH + safezoneY,
			0.0876563 * safezoneW,
			0.143 * safezoneH
		];

		_button ctrlSetTooltip getText(_x >> "fullName");
		_button ctrlSetEventHandler ["ButtonClick", (format["['%1'] call PHX_fnc_switchBlueprint", (configName _x)])];

		_button ctrlSetFade 0;
		_button ctrlCommit 0;

		_idc = _idc + 1;
		_currentX = _xValue;
		PHX_createdElements pushBack [getText(_x >> "name"), _button];
	};
} forEach _blueprints;