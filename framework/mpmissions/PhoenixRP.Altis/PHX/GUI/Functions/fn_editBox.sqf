#include "..\..\..\script_macros.hpp"
/*
*   @File: fn_editBox.sqf
*   @Author: Zyn
*   @Description: Handles the edit box
*   !!! MUST BE SPAWNED !!!
*/

params [
	["_title","",[""]],
    ["_leftButton","OK",[""]],
    ["_rightButton","CANCEL",[""]]
];

createDialog "editBox";

private _display = findDisplay 22000;

ctrlSetText [22001,_title];
ctrlSetText [22003,toUpper(_leftButton)];
ctrlSetText [22004,toUpper(_rightButton)];

uinamespace setVariable ["PHX_editBox_status",nil];

(_display displayCtrl 22003) ctrlAddEventHandler ["ButtonClick","uiNamespace setVariable ['PHX_editBox_status',(ctrlText 22002)]; closeDialog 0; true"];
(_display displayCtrl 22004) ctrlAddEventHandler ["ButtonClick","uiNamespace setVariable ['PHX_editBox_status',false]; closeDialog 0; true"];
_display displayAddEventHandler ["keyDown","if ((_this select 1) == 1) then {uiNamespace setVariable ['PHX_editBox_status',false]; true} else {false}"];

waituntil {!isNil {uinamespace getVariable "PHX_editBox_status"}};

_result = uiNamespace getVariable "PHX_editBox_status";

_result