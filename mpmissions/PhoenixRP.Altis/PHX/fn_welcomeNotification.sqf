/*
	File: fn_introtext.sqf
	Description: Adds some text as the player loads in.
*/

if !(life_settings_intro) then { playSound "welcome" };

_onScreenTime = 5;

["Please be aware that information from this session may be transmitted to third party services such as Battlemetrics.com and infiSTAR.de.", "red", "Data Transfer Disclaimer"] spawn PHX_fnc_notify;

private _array = [];

_array pushBack ["Welcome to PhoenixRP's",([format["%1 Life", worldName]])];
_array pushBack ["Developed By",["Conner Merlin, Zyn, Scarso, SKY and Sig"]];
_array pushBack ["Visit Our Website",["PhoenixRP.co.uk"]];
_array pushBack ["Join Our Teamspeak",["ts.phoenixrp.co.uk"]];
_array pushBack ["Governor",[([format["%1 is currently in office", PHX_curGovernor select 0], "No Governor is currently in office"] select (PHX_curGovernor isEqualTo []))]];

if (playerSide isEqualTo civilian && {!(isNil "PHX_gangMessage")}) then {
	_array pushBack	["Group Message",[PHX_gangMessage]]
};

_array pushBack ["Enjoy Your Time",[profileName]];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;

	_finalText = format ["<t size='0.55' color='#00A91C' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.70' color='#ffffff' align='right'>";

	{
		_finalText = _finalText + format ["%1<br />", _x]
	} forEach _memberNames;

	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.9);

	[
		_finalText,
		[safezoneX + safezoneW - 0.8,0.50],
		[safezoneY + safezoneH - 0.8,0.7],
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;

	sleep (_onScreenTime);
} forEach _array;