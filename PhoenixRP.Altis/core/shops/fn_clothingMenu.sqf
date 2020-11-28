#include "..\..\script_macros.hpp"
/*
    File: fn_clothingMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Opens and initializes the clothing store menu.
    Started clean, finished messy.
*/
#include "..\..\script_macros.hpp"
params ["","","",["_shop","",[""]]];

if (_shop isEqualTo "") exitWith {};

#define CFG missionConfigFile >> "CfgClothing" >> worldName

if !(isNull objectParent player) exitWith {["You cannot do this while you are in a vehicle.","red"] call PHX_fnc_notify;};

/* License check & config validation */
if !(isClass(CFG)) exitWith {}; //Bad config entry.

private _shopTitle = (getText (CFG >> _shop >> "title"));
private _shopSide = (getText (CFG >> _shop >> "side"));
private _conditions = (getText (CFG >> _shop >> "conditions"));

private _exit = false;

private "_flag";

if !(_shopSide isEqualTo "") then {
    _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; case east: {"hav"}; default {"civ"}};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

_exit = [_conditions] call life_fnc_levelCheck;
if !(_exit) exitWith {NOTIFY("You do not have the required license and/or level!","red");};

//Save old inventory
[] call life_fnc_saveGear;
life_oldClothes = uniform player;
life_olduniformItems = uniformItems player;
life_oldBackpack = backpack player;
life_oldVest = vest player;
life_oldVestItems = vestItems player;
life_oldBackpackItems = backpackItems player;
life_oldGlasses = goggles player;
life_oldHat = headgear player;

/* Open up the menu */
createDialog "RscClothingStore";
disableSerialization;

ctrlSetText [3103, _shopTitle];

clothingNVG = false;

(findDisplay 3100) displaySetEventHandler ["KeyDown","
    switch (_this select 1) do {
        case 1: {
            closeDialog 0; 
            [] call PHX_fnc_playerSkins;
        };
        case 49: {
            camUseNVG (!clothingNVG);
            clothingNVG = !clothingNVG;
        };
    };
"];

sliderSetRange [3107, 0, 360];

private _filter = (findDisplay 3100) displayCtrl 3105;
{
    _filter lbAdd _x
} forEach ["Clothing","Hats","Glasses","Vests","Backpack"];

life_clothing_store = _shop;

/* Store license check */
if (isClass(missionConfigFile >> "CfgLicenses" >> life_clothing_store)) then {
    _flag = M_CONFIG(getText,"CfgLicenses",life_clothing_store,"side");
    _displayName = M_CONFIG(getText,"CfgLicenses",life_clothing_store,"displayName");
    if !(LICENSE_VALUE(life_clothing_store,_flag)) exitWith {
        [format ["You need a %1 to buy from this shop!",_displayName],"red"] call PHX_fnc_notify;
        closeDialog 0;
    };
};

//initialize camera view
life_shop_cam = "CAMERA" camCreate getPos player;
showCinemaBorder false;
life_shop_cam cameraEffect ["Internal", "Back"];
life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
life_shop_cam camSetPos (player modelToWorld [1,4,2]);
life_shop_cam camSetFOV .33;
life_shop_cam camSetFocus [50, 0];
life_shop_cam camCommit 0;
life_cMenu_lock = false;

if (isNull (findDisplay 3100)) exitWith {};

private _list = (findDisplay 3100) displayCtrl 3101;
[0,0] call life_fnc_clothingFilter;

[] call PHX(playerSkins);

waitUntil {isNull (findDisplay 3100) || { isDowned(player) || { life_istazed } || { life_isknocked } }};

life_shop_cam cameraEffect ["TERMINATE","BACK"];
camUseNVG false;
camDestroy life_shop_cam;
clothingNVG = nil;
life_clothing_filter = 0;

if (isNil "life_clothesPurchased" || { isDowned(player) || { life_istazed } || { life_isknocked } }) exitWith {
    life_clothing_purchase = [-1,-1,-1,-1,-1];
    [] call LIFE(stripDownPlayer);
    [] call LIFE(loadGear);
    [] call PHX(playerSkins);
};

life_clothesPurchased = nil;

//Check uniform purchase.
if ((life_clothing_purchase select 0) isEqualTo -1) then {
    if (life_oldClothes != uniform player) then {player addUniform life_oldClothes;};
};
//Check hat
if ((life_clothing_purchase select 1) isEqualTo -1) then {
    if (life_oldHat != headgear player) then {
        if (life_oldHat isEqualTo "") then {
            removeHeadGear player;
        } else {
            player addHeadGear life_oldHat;
        };
    };
};
//Check glasses
if ((life_clothing_purchase select 2) isEqualTo -1) then {
    if (life_oldGlasses != goggles player) then {
        if (life_oldGlasses isEqualTo "") then  {
            removeGoggles player;
        } else {
            player addGoggles life_oldGlasses;
        };
    };
};
//Check Vest
if ((life_clothing_purchase select 3) isEqualTo -1) then {
    if (life_oldVest != vest player) then {
        if (life_oldVest isEqualTo "") then {removeVest player;} else {
            player addVest life_oldVest;
            {
                [_x,true,false,false,true] call life_fnc_handleItem;
                true
            } count life_oldVestItems;
        };
    };
};

//Check Backpack
if ((life_clothing_purchase select 4) isEqualTo -1) then {
    if (life_oldBackpack != backpack player) then {
        if (life_oldBackpack isEqualTo "") then {removeBackpack player;} else {
            removeBackpack player;
            player addBackpack life_oldBackpack;
            {
                [_x,true,true] call life_fnc_handleItem;
                true
            } count life_oldBackpackItems;
        };
    };
};

life_clothing_purchase = [-1,-1,-1,-1,-1];
[] call life_fnc_saveGear;
[] call PHX(playerSkins);