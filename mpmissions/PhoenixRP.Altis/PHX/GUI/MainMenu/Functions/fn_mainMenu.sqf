/*
	@File: fn_mainMenu.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Loads our "Main Menu"...
*/
#include "..\..\..\..\script_macros.hpp"

// Before we load the main menu we're going to ensure CID / HSS is setup correctly...
if (playerSide isEqualTo civilian) then {
	switch (true) do {
		case (isCID(player)): {

			["CID"] call PHX(jobGroup);

			player setVariable["rank", (FETCH_CONST(life_coplevel)) ,true];
		};
		case (isHSS(player)): {

			["HSS"] call PHX(jobGroup);

			player setVariable["rank",(FETCH_CONST(life_hsslevel)),true];
		};
		default {};
	};
};

"RscBacking" cutFadeOut 0;
"RscTitleLoading" cutFadeOut 0;
0 cutText["","BLACK FADED"];
0 cutFadeOut 9999999;
uiSleep 0.2;

// Check to see if the main menu is even enabled...
if !(LIFE_SETTINGS(getNumber,"mainMenu_enabled") isEqualTo 1) exitWith { call LIFE(spawnMenu) }; // Fail safe...

// Check to see if we've already setup the menu...
if !(isNull PHX_Mannequin) then { deleteVehicle PHX_Mannequin };
if !(isNull PHX_Camera) then { PHX_Camera cameraEffect ["TERMINATE","BACK"]; camDestroy PHX_Camera };
if !(PHX_Main_Objects isEqualTo []) then { { deleteVehicle _x } forEach PHX_Main_Objects };

// Hide all players...
{ _x hideObject true; true } count (playableUnits select {isPlayer _x && { !(_x isEqualTo player) }});

// Create UI & Block Escape Menu...
if !(createDialog "RscMainMenu") exitWith { call LIFE(spawnMenu) }; // Fail safe...
(findDisplay 1500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

// Setup UI Elements...
ctrlSetText[1502, player getVariable ["realname", name player]];
ctrlEnable [1503, false];
ctrlEnable [1504, false];
ctrlEnable [1505, false];
ctrlEnable [1506, false];

// Set our variables...
private _myGear = getUnitLoadout player;
private _pos = getArray(missionConfigFile >> "CfgSettings" >> worldName >> "mainMenu_position");
private _objects = getArray(missionConfigFile >> "CfgSettings" >> worldName >> "objects");
private _animations = getArray (missionConfigFile >> "CfgSettings" >> "mainMenu_animations");

// Create map objects...
{
	_x params ["_class", "_cPos"];

	private _object = _class createVehicleLocal [_cPos select 0, _cPos select 1, _cPos select 2];
	_object setDir (_cPos select 3);
	_object setVehiclePosition [[_cPos select 0, _cPos select 1, _cPos select 2], [], 0, "CAN_COLLIDE"];
	_object allowDamage false;

	PHX_Main_Objects pushBack _object;
} forEach _objects;

// Create our mannequin...
PHX_Mannequin = "C_man_1" createVehicleLocal [_pos select 0, _pos select 1, _pos select 2];
PHX_Mannequin setDir (_pos select 3);
PHX_Mannequin_Dir = _pos select 3;
PHX_Mannequin setVehiclePosition [[_pos select 0, _pos select 1, _pos select 2], [], 0, "CAN_COLLIDE"];
PHX_Mannequin setFace (face player);
PHX_Mannequin allowDamage false;
PHX_Mannequin setUnitLoadout _myGear;
removeAllWeapons PHX_Mannequin;
PHX_Mannequin setVariable["rank", (player getVariable ["rank", 1]), true];

// Animations!
PHX_Mannequin switchMove (selectRandom _animations);
PHX_Mannequin addEventHandler ["AnimDone", {
	params ["_unit"];
	private _animations = getArray (missionConfigFile >> "CfgSettings" >> "mainMenu_animations");
	_unit switchMove (selectRandom _animations);
}];

[PHX_Mannequin, true, playerSide] call PHX(playerSkins);

// Create our camera...
PHX_Camera = "CAMERA" camCreate (getPos PHX_Mannequin);
showCinemaBorder false;
PHX_Camera cameraEffect ["INTERNAL","BACK"];
PHX_Camera camSetTarget (PHX_Mannequin modelToWorld [0,0,1]);
PHX_Camera camSetPos (PHX_Mannequin modelToWorld [0,2.5,1.5]);
PHX_Camera camSetFov 0.65;
PHX_Camera camSetFocus [100,1];
PHX_Camera camCommit 0;

cutText ["","BLACK IN"];
sleep 0.5;

{
	private _ctrl = CONTROL(1500, _x);

	_ctrl ctrlSetFade 0;
	_ctrl ctrlCommit 0.5;
} forEach [
	1501, 1502, 1503, 1504, 1505, 1506
];

ctrlEnable [1503, true];
ctrlEnable [1504, true];
ctrlEnable [1505, true];
ctrlEnable [1506, true];