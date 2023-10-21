/*
	@File: fn_sendMessage.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Sends our message...
*/
scopeName "sendMessage";
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
#define CFG missionConfigFile >> "CfgContacts"
params [
	["_asAdmin", false, [true]]
];

if (PHX_coolDown) exitWith { NOTIFY("Please wait before sending another message!","red")};
if (_asAdmin && { ((call life_adminlevel) <= 0) }) exitWith { NOTIFY("This is an admin only function","red") };

private _curSel = CONTROL_DATA(IDC_MOBILE_LIST);
private _myMessage = ctrlText IDC_MOBILE_INPUT_BOX;

if (_curSel isEqualTo -1) exitWith { NOTIFY("You must select a contact to send the message to","red")};
if (_myMessage isEqualTo "") exitWith { NOTIFY("You need to enter a message to send","red") };
if ((count _myMessage) > 400) exitWith { NOTIFY("The message must be below 401 characters","red") };

private _params = [];
private _targets = [];

if (isClass (CFG >> _curSel)) then {
	private _thisC = (CFG >> _curSel);

	if ((getNumber(_thisC >> "comms")) isEqualTo 1 && { !([player, "comms"] call PHX(hasItem)) } && { !_asAdmin }) exitWith {
		NOTIFY("To message this contact you must have communications","red"); breakOut "sendMessage";
	};

	_targets append (playableUnits select {!isNil {_x getVariable "realname"} && { call compile (getText(_thisC >> "targets")) }});
	_params = [[(getText(_thisC >> "title")), (getText(_thisC >> "colour"))], _myMessage, "N/A", player];
} else {
	if (!([player, "comms"] call PHX(hasItem)) && { !_asAdmin }) exitWith { NOTIFY("To message this contact you must have communications","red"); breakOut "sendMessage" };

	private _unit = (_curSel call PHX(unitByUID));
	if (isNull _unit) exitWith { NOTIFY("This contact is currently unreachable","red"); breakOut "sendMessage" };

	_targets pushBack _unit;
	_params = [["Private Message", "#FFCC00"], _myMessage, "N/A", player];
};

if ((_params isEqualTo [] || _targets isEqualTo []) && !(_curSel isEqualTo "adminRequest")) exitWith { NOTIFY("There is no one to send this message to","red") };

if (_asAdmin) then { _params set[0, ["Message from Admin", "#ffcefe"]] };
if ((cbChecked (CONTROL(IDD_TABLET_MAIN, IDC_MOBILE_CHECK_LOCATION)))) then { _params set[2, (mapGridPosition player)] };

NOTIFY("Your message has been sent","green");

if (["Belle Delphine", _myMessage] call life_fnc_inString) then {
    ["fangirl"] spawn PHX(unlockAchievement);
};

_params remoteExecCall ["PHX_fnc_recieveMessage", _targets];

[] spawn {
	PHX_coolDown = true;
	sleep 10;
	PHX_coolDown = false;
};

//--- Log admin requests
if (_curSel isEqualTo "adminRequest") then {
	[player, format ["(Admin request) %1",_myMessage], "https://rcon.phoenixrp.co.uk/api/v1/nlr"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};