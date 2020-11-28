#include "..\..\script_macros.hpp"

/*
    File: fn_escInterupt.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Monitors when the ESC menu is pulled up and blocks off
    certain controls when conditions meet.
*/
disableSerialization;

private _display = (findDisplay 49);
private _abortButton = _display displayCtrl 104;

// Block Endmission cheat
_display displayAddEventHandler ["KeyDown", {
    _this call {
        params ["","_key","_shift"];
        if (_key isEqualTo 74 && {_shift}) exitWith {
            if !(userInputDisabled) then {
                disableUserInput true;

                if (userInputDisabled) then {
                    disableUserInput false;
                };
            };
            true
        };
    };
}];

//Block off our buttons first.
(_display displayCtrl 122) ctrlShow false; //Field manual
_abortButton ctrlEnable false;
_abortButton ctrlSetEventHandler [
    "ButtonClick",
    "with missionNamespace do {[] spawn PHX_fnc_logoff;}; (uiNamespace getVariable 'escDisplay') closeDisplay 2; true"
];

private _topButton = _display displayCtrl 2;
private _saveButton = _display displayCtrl 103;
private _respawnButton = _display displayCtrl 1010;
private _ctrlName = _display displayCtrl 523;
private _ctrlUID = _display displayCtrl 109;

_ctrlUID ctrlShow false;

(ctrlPosition _ctrlName) params ["_x","_y","_w","_h"];
_ctrlName ctrlSetPosition [_x, _y, _w * 2, _h];
_ctrlName ctrlCommit 0;
_ctrlName ctrlSetText (player getVariable["realname", name player]);

_topButton ctrlEnable false;
_topButton ctrlSetStructuredText parseText format ["<t color='#ffffff'>PhoenixRP Framework v2</t>"];

_saveButton ctrlEnable false;

if (missionNamespace getVariable ["donationGoal", false]) then {
    _saveButton ctrlSetStructuredText parseText format ["<t color='#ffffff'>Donation Goal:</t><t color='#32CD32'> Enabled</t>"]; 
} else { _saveButton ctrlSetStructuredText parseText format ["<t color='#ffffff'>Donation Goal: Disabled</t>"]; };

_respawnButton ctrlEnable false;
_respawnButton ctrlSetStructuredText parseText format ["<t color='#ffffff'>Player UID: %1</t>", getPlayerUID player];

private _curText = ctrlText _abortButton;
private _timeStamp = time + 10;

waitUntil {
    _abortButton ctrlSetStructuredText parseText format ["%1 <t align='right'>(%2)</t>", _curText, [(_timeStamp - time), "SS.MS"] call BIS_fnc_secondsToString];
    _abortButton ctrlCommit 0;
    if (dialog && {isNull (findDisplay 7300)}) then {closeDialog 0};

    round(_timeStamp - time) <= 0 || {isNull (findDisplay 49)}
};

_abortButton ctrlSetText _curText;
_abortButton ctrlCommit 0;
_abortButton ctrlEnable !((isRestrained(player)) || (player getVariable ["Escorting",false]) || (player getVariable ["isTazed",false]) || (player getVariable ["isKnockedOut",false]));

waitUntil {isNull (findDisplay 49) || {!alive player}};
if (!isNull (findDisplay 49) && {!alive player}) then {
    (findDisplay 49) closeDisplay 2;
};