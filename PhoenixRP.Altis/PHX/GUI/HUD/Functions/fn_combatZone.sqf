/*
	@File: fn_combatZone.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Loads or removes UI for displaying Kills, Deaths, etc in "Combat Zones"...
*/
#include "..\..\..\..\script_macros.hpp"

if (playerSide isEqualTo independent) exitWith {};

params [["_update", false, [true]]];

if (isNil "PHXCombatUI") then {
	PHXCombatUI = [];

	private _display = LIFEdisplay;

	if (isNull _display) exitWith {};

	private _background = _display ctrlCreate ["Life_RscBackground", -1];
	_background ctrlSetPosition [
		1 * safezoneW + safezoneX,
		0.818 * safezoneH + safezoneY,
		0.149531 * safezoneW,
		0.044 * safezoneH
	];
	_background ctrlSetBackgroundColor [0.1,0.1,0.1,0.5];
	_background ctrlSetFade 1;
	_background ctrlCommit 0;

	private _header = _display ctrlCreate ["Life_RscStructuredText", -1];
	_header ctrlSetPosition [
		1 * safezoneW + safezoneX,
		0.818 * safezoneH + safezoneY,
		0.149531 * safezoneW,
		0.022 * safezoneH
	];
	_header ctrlSetBackgroundColor [0.1,0.1,0.1,0.5];
	_header ctrlSetFade 1;
	_header ctrlCommit 0;
	
	private _text = _display ctrlCreate ["Life_RscStructuredText", -1];
	_text ctrlSetPosition [
		1 * safezoneW + safezoneX,
		0.818 * safezoneH + safezoneY,
		0.149531 * safezoneW,
		0.022 * safezoneH
	];
	_text ctrlSetStructuredText parseText format["<t align='left'>Kills</t><t align='center'>Deaths</t><t align='right'>HS %1</t>", "%"];
	_text ctrlSetFade 1;
	_text ctrlCommit 0;

	private _infoTxt = _display ctrlCreate ["Life_RscStructuredText", -1];
	_infoTxt ctrlSetPosition [
		1 * safezoneW + safezoneX,
		0.840 * safezoneH + safezoneY,
		0.149531 * safezoneW,
		0.022 * safezoneH
	];
	_infoTxt ctrlSetStructuredText parseText format[
		"<t align='left'>%2</t><t align='center'>%3</t><t align='right'>%4%1</t>", 
		"%", (["kills"] call PHX(getStat)), (["deaths"] call PHX(getStat)), (round (((["headshots"] call PHX(getStat)) / (["kills"] call PHX(getStat))) * 100))
	];
	_infoTxt ctrlSetFade 1;
	_infoTxt ctrlCommit 0;

	PHXCombatUI pushBack _background;
	PHXCombatUI pushBack _header;
	PHXCombatUI pushBack _text;
	PHXCombatUI pushBack _infoTxt;

	{
		_x ctrlSetPosition [
			0.845469 * safezoneW + safezoneX,
			0.818 * safezoneH + safezoneY
		];
	} forEach [_background, _header, _text];

	_infoTxt ctrlSetPosition [
		0.845469 * safezoneW + safezoneX,
		0.840 * safezoneH + safezoneY
	];

	{ 
		_x ctrlSetFade 0;
		_x ctrlCommit 0.5;
	} forEach PHXCombatUI;
} else {
	if (_update) then {
		(PHXCombatUI select 3) ctrlSetStructuredText parseText format[
			"<t align='left'>%2</t><t align='center'>%3</t><t align='right'>%4%1</t>", 
			"%", (["kills"] call PHX(getStat)), (["deaths"] call PHX(getStat)), (round (((["headshots"] call PHX(getStat)) / (["kills"] call PHX(getStat))) * 100))
		];

		(PHXCombatUI select 3) ctrlCommit 0;
	} else {
		[] spawn {
			{ 
				_x ctrlSetPosition [
					1 * safezoneW + safezoneX,
					((ctrlPosition _x) # 1)
				];

				_x ctrlSetFade 1;
				_x ctrlCommit 0.5;
			} forEach PHXCombatUI;
			sleep 1;
			{ ctrlDelete _x } forEach PHXCombatUI;
			PHXCombatUI = nil;
		};
	};
};