#include "..\..\script_macros.hpp"
/*
    File: fn_garageLBChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private ["_control","_index","_className","_classNameLife","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_sellMultiplier","_price","_storageFee","_purchasePrice","_inventory","_inventoryShow"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = CONTROL_DATAI(_control,_index);
_dataArr = call compile format ["%1",_dataArr];
_className = (_dataArr select 0);
_classNameLife = _className;
_inventory = (_dataArr select 2);
private _plate = (_dataArr select 3);
private _upgrades = [];
if ((_dataArr select 4) isEqualTo []) then {
	_upgrades = [0,0,0,0,[]]
} else {
	_upgrades = (_dataArr select 4);
};
_inventoryShow = "";

if (!isClass (missionConfigFile >> "LifeCfgVehicles" >> _classNameLife)) then {
    _classNameLife = "Default"; //Use Default class if it doesn't exist
    diag_log format ["%1: LifeCfgVehicles class doesn't exist",_className];
};

_vehicleColor = ((M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures") select (_dataArr select 1)) select 0);
if (isNil "_vehicleColor") then {_vehicleColor = "Default";};

_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;

_purchasePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
_storageFee = LIFE_SETTINGS(getNumber,"vehicle_store_multiplier");

_retrievePrice = _purchasePrice * _storageFee;
if (HAS_PERK("matesRate")) then { _retrievePrice = _retrievePrice * 0.5 }; // 50% off...

_sellPrice = _purchasePrice * (LIFE_SETTINGS(getNumber,"vehicle_sell_multiplier"));

if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 500;};
if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 500;};
if (HAS_PERK("matesRate")) then { _retrievePrice = _retrievePrice * 0.5 }; // 50% off...

if(str(_inventory) in ["[]","[[],0]",'"[[],0]"','"[]"']) then {
	_inventoryShow = "Empty";
}
else {
	_inventory = toArray(_inventory);

	for "_i" from 0 to (count _inventory)-1 do {
		_sel = _inventory select _i;
		if(_sel isEqualTo 96) then {
			_inventory set[_i,39];
		};
	}; 

	_inventory = toString(_inventory);
	_inventory = call compile format["%1", _inventory];
	if(typeName _inventory isEqualTo "STRING") then {_inventory = call compile format["%1", _inventory];};
	if(count _inventory != 0) then {_inventory = _inventory select 0;}; {
		_name = M_CONFIG(getText,"CfgItems",(_x select 0,0),"displayName");
		_val = (_x select 1);

		if (_val > 0) then
		{
			_inventoryShow = _inventoryShow + format ["%1 x%2",_name,_val] + ", ";
		};
	} forEach _inventory;
};

private _upgradeArray = (_upgrades select 4);
private _upgradeShow = "";
if (_upgradeArray isEqualTo []) then {
	_upgradeShow = "None";
} else {
	private _upgradeCount = (count _upgradeArray) - 1;
	{
		if (_forEachIndex isEqualTo _upgradeCount) then {
			_upgradeShow = _upgradeShow + _x;
		} else {
			_upgradeShow = _upgradeShow + _x + ", ";
		};
	} forEach _upgradeArray;
};

(CONTROL(2800,2803)) ctrlSetStructuredText parseText format [
    "<t font='RobotoCondensedLight' size='0.8'>Retrieval Price:<t align='right'>£%1</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Sell Price:<t align='right'>£%2</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Color:<t align='right'>%8</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Max Speed:<t align='right'>%3 km/h</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Horse Power:<t align='right'>%4</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Passenger Seats:<t align='right'>%5</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Trunk Space:<t align='right'>%6</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Fuel Storage:<t align='right'>%7</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Plate:<t align='right'>%9</t><br/></t>" +
	"<t font='RobotoCondensedLight' size='0.8'>Additional Trunk Capacity:<t align='right'>%10</t><br/></t>" +
	"<t font='RobotoCondensedLight' size='0.8'>Titanium Lock Level:<t align='right'>%11</t><br/></t>" +
	"<t font='RobotoCondensedLight' size='0.8'>Chopshop Level:<t align='right'>%12</t><br/></t>" +
	"<t font='RobotoCondensedLight' size='0.8'>Nitrous Cannisters:<t align='right'>%13</t><br/></t>" +
	"<t font='RobotoCondensedLight' size='0.8'>Other Upgrades:<t align='right'>%14</t><br/></t>" +
    "<t font='RobotoCondensedLight' size='0.8'>Currently Stored:<t align='right'>%15</t></t>",
[_retrievePrice] call life_fnc_numberText,
[_sellPrice] call life_fnc_numberText,
(_vehicleInfo select 8),
(_vehicleInfo select 11),
(_vehicleInfo select 10),
if (_trunkSpace isEqualTo -1) then {"None"} else {_trunkSpace},
(_vehicleInfo select 12),
_vehicleColor,
_plate,
(_upgrades select 0),
((_upgrades select 1) / 10),
((_upgrades select 2) / 10),
(_upgrades select 3),
_upgradeShow,
_inventoryShow
];

ctrlShow [2803,true];
ctrlShow [2830,true];
