/*
	@File: fn_openEnlistment.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Opens and fills out the enlistment UI...
*/
#include "..\..\..\..\script_macros.hpp"

// Checks...
if !(PHX_isEnlistmentOpen) exitWith {["General Election Enlistment is currently closed", "red"] spawn PHX(notify)};
if (playerSide isEqualTo east) exitWith {["HAVOC members are unable to enlist in the election", "red"] spawn PHX(notify)}; // Fuck em...

disableSerialization;
if (dialog) exitWith {closeDialog 0}; // Already Active...

createDialog "RscEnlist"; // Create the dialog...
waitUntil {!isNull (findDisplay 3100)};
private _display = findDisplay 3100;

private _info = _display displayCtrl 3102;
private _exampleBox = _display displayCtrl 3103;
private _parties = _display displayCtrl 3109;
private _desEdit = _display displayCtrl 3107;
private _conditions = _display displayCtrl 3111;
private _pic = _display displayCtrl 3110;

// Example Settings...
_exampleBox cbSetChecked true; // Set Example Checkbox to Checked...
ctrlEnable[3103, false]; // Disable Example Checkbox...

// Add the parties to the combo dropdown...
{
	_parties lbAdd (getText (_x >> "name"));
	_parties lbSetData [(lbSize _parties)-1,configName _x];
} foreach ("true" configClasses (missionConfigFile >> "Parties"));

_info ctrlSetStructuredText parseText format[
	"<t size='1.15'>%1</t><br/>" +
	"<t size='0.8'></t>",
	name player
];

_conditions ctrlSetStructuredText parseText format[
	"<t size='1.15'>Enrollment Conditions</t><br/>" +
	"<t size='0.8'>" +
	"By enrolling as a candidate in the next election you are accepting to the below conditions.<br/><br/>" +
	"1 ) You'll pay the <t color='#8cff9b'>£300,000</t> enrollment fee.<br/>" + 
	"2 ) Your Candidate description does not contain anything that could be seen as offensive.<br/><br/>" + 
	"If you fail to meet these conditions your candidacy can be terminated at any point." + 
	"</t>"
];

// Key up me daddy
_desEdit ctrlAddEventHandler [ "KeyUp", {
	private _text = (ctrlText 3107);
	_text select [0,64]; // Only allow the first 64 characters...
	((findDisplay 3100) displayCtrl 3102) ctrlSetStructuredText parseText format[
		"<t size='1.15'>%1</t><br/>" +
		"<t size='0.8'>%2</t>",
		name player,
		_text
	];
}];

// Change me icon
_parties ctrlAddEventHandler [ "LBSelChanged", {
	private _class = lbData[3109, (_this select 1)];
	((findDisplay 3100) displayCtrl 3110) ctrlSetText (M_CONFIG(getText,"Parties",_class,"icon"));
}];
lbSetCurSel[3109, 0];