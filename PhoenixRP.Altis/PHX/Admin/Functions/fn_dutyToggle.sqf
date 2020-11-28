/*
	@File: fn_dutyToggle.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Handles our admin duty mode...
*/
#include "..\..\..\script_macros.hpp"
params [["_msg", "", [""]]];

if (isDowned(player)) exitWith {};

private _suit = [
	"U_I_Protagonist_VR", "U_B_Protagonist_VR", "U_O_Protagonist_VR"
] select (random 2);

if !(player getVariable ["isAdmin", false]) then {
	[] call LIFE(saveGear);

	PHX_Old_Cash = PHX_Cash;
	PHX_Old_ATM = PHX_ATMCash;

	call LIFE(stripDownPlayer);
	call PHX(clearItems);

	player forceAddUniform _suit;
	player addHeadgear "H_Cap_headphones";
	player addGoggles "G_Goggles_VR";
	player addBackpack "B_Carryall_oucamo";

	{[_x,true,false,false,false] call LIFE(handleItem)} forEach ["ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];

	player addWeapon "Rangefinder";
	player unassignItem "ItemGPS";

	false call PHX(handleMarkers);
	false call PHX(handleESP);

	player setVariable ["isAdmin", true, true];
	[] call PHX(playerSkins);
	[player, format ["%1 (%2) equipped admin gear",profileName,(getPlayerUID player)], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
} else {
	player setVariable ["isAdmin", false, true];

	true call PHX(handleMarkers);
	true call PHX(handleESP);

	if (player getVariable ["isInvisibile", false]) then { [player, false] remoteExecCall ["PHX_fnc_changeVisibility", RCLIENT] };

	[PHX_Old_Cash, 2, 0] call PHX_fnc_HandleMoney;
	[PHX_Old_ATM, 2, 1] call PHX_fnc_HandleMoney;
	
	[] call LIFE(loadGear);
	[] call DB(updateRequest);
	[player, format ["%1 (%2) disabled admin gear",profileName,(getPlayerUID player)], "https://rcon.phoenixrp.co.uk/api/v1/log/admin"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

[] call PHX(hudUpdate);

player setVariable ["realname", (format["%1%2", ([] call PHX(getPrefix)), profileName]),true];

format[_msg, player getVariable ["realname", name player],["On","Off"] select (!(player getVariable ["isAdmin", true]))]