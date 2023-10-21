#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_openUpgrades.sqf
	@Author: Zyn
	@Description: Opens our house upgrades...
*/

params [
    ["_mode","onLoad",[""]]
];

#define CFG missionConfigFile >> "CfgVehicleUpgrades"
#define VCFG missionConfigFile >> "LifeCfgVehicles"

private _lb = CONTROL(33000, 33001);

switch _mode do {
	case "onLoad": {
		lbClear _lb;
		private ["_title","_condition","_price","_icon"];

		{
			_title = getText(_x >> "title");
			_condition = getText(_x >> "condition");
			_price = (getNumber(VCFG >> (typeOf(PHX_Upgrade)) >> "price")) * ((getNumber(_x >> "price")) / 100);
			_icon = getText(_x >> "icon");

			_lb lbAdd format["%1", _title];
			_lb lbSetData [(lbsize _lb) - 1, (configName _x)];
			_lb lbSetValue [(lbsize _lb) - 1, _price];
			_lb lbSetPicture [(lbsize _lb) - 1, _icon];

			if !(call compile _condition) then {
				_lb lbSetColor [(lbsize _lb) - 1, [0.4, 0.4, 0.4, 1]];
			};

		} forEach ("true" configClasses(CFG));
	};

	case "lbChange": {
		private _data = CONTROL_DATA(33001);
		private _price = CONTROL_VALUE(33001);
		private _title = getText(CFG >> _data >> "title");
		private _description = getText(CFG >> _data >> "description");

		CONTROL(33000,33002) ctrlSetStructuredText parseText format [
			"<t font='RobotoCondensed' size='1.3' align='center'>%1<br/><br/></t>" +
			"<t font='RobotoCondensedLight' size='0.8'>Price: £%2<br/></t>" +
			"<t font='RobotoCondensedLight' size='0.8'>Description: %3<br/></t>",
			_title,
			[_price] call LIFE_fnc_numberText,
			_description
		];
	};
};