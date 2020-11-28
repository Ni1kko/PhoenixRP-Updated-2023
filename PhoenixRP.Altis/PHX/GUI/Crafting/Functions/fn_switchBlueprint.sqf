/*
	@File: fn_switchBlueprint.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Changes our blueprint...
*/
scopeName "switchPrint";
#include "..\..\..\..\script_macros.hpp"
#define CFG missionConfigFile >> "CfgBlueprints"
if !(params [["_blueprint", "", [""]]]) exitWith {};

private _display = findDisplay 8000;
if (isNull _display) exitWith {};

private _cfg = call {
	if (isClass (CFG >> "Physical" >> _blueprint)) exitWith { CFG >> "Physical" >> _blueprint };
	if (isClass (CFG >> "Virtual" >> _blueprint)) exitWith { CFG >> "Virtual" >> _blueprint };
	["This blueprint does not exist","red"] spawn PHX_fnc_notify;
	breakOut "switchPrint";
};

PHX_Craftable = _blueprint;

private _icon = (call compile getText(_cfg >> "icon"));

if (isClass (CFG >> "Physical" >> _blueprint)) then {
	_icon = ([(getText(missionConfigFile >> "CfgBlueprints" >> "Physical" >> _blueprint >> "product"))] call life_fnc_fetchCfgDetails) select 2;
};

private _reqString = "";

{
	_x params ["_cfgName", "_cfgVal"];
	_reqString = format["%1<br/>%2 (%3/%4)", _reqString, (ITEM_NAME(_cfgName)), ITEM_VALUE(_cfgName), _cfgVal];
} forEach (getArray(_cfg >> "ingredients"));

(_display displayCtrl 8003) ctrlSetStructuredText parseText format[
	"<br/><img image='%1' align='center' size='3' /><br/><br/>" +
	"<t align='left' size='1'>" +
		"Name:<br/><t size='0.8'>%2</t><br/>" +
		"Required Level: <t size='0.8' color = '#8A2BE2'>%3</t><br/>" +
		"<br/>" +
		"Requirements:<t size='0.8'>%4</t>" +
	"</t>",
	_icon,
	getText(_cfg >> "fullName"),
	getNumber(_cfg >> "level"),
	_reqString
];