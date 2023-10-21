/*
    @File: fn_hudUpdate.sqf

    @Author: Daniel Stuart
    @Editor: Jack "Scarso" Farhall (Toggle Display, XP System, Cash Text + Icons System)

    @Description: Updates the HUD when it needs to.
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
#define CTRL(DIS,IDC) (DIS displayCtrl IDC)

if (life_firstSpawn) exitWith {};

disableSerialization;

private _display = ("RscPlayerHUD" call PHXUI_fnc_getLayer);

if (isNull _display) exitWith { call PHX_fnc_hudSetup };

private _allElements = [
    // Backgrounds
    CTRL(_display, IDC_LIFE_BAR_FOOD_BACK),
    CTRL(_display, IDC_LIFE_BAR_WATER_BACK),
    CTRL(_display, IDC_LIFE_BAR_HEALTH_BACK),
    CTRL(_display, IDC_LIFE_BAR_XP_BACK),
    // Progress Bars
    CTRL(_display, IDC_LIFE_BAR_FOOD),
    CTRL(_display, IDC_LIFE_BAR_WATER),
    CTRL(_display, IDC_LIFE_BAR_HEALTH),
    CTRL(_display, IDC_LIFE_BAR_XP),
    // Text
    CTRL(_display, IDC_LIFE_FOOD_TEXT),
    CTRL(_display, IDC_LIFE_WATER_TEXT),
    CTRL(_display, IDC_LIFE_HEALTH_TEXT),
    CTRL(_display, IDC_LIFE_CASH_TEXT),
    CTRL(_display, IDC_LIFE_XP_TEXT)
];

// Toggle HUD Visibility if it's changed...
if !(PHX_hideHUD isEqualTo PHX_Last_hideHUD) then { 
    { _x ctrlShow (!(PHX_hideHUD)) } forEach _allElements;
    PHX_Last_hideHUD = PHX_hideHUD;
};

// Update UI Elements...
CTRL(_display, IDC_LIFE_BAR_FOOD) progressSetPosition (1 / (100 / life_hunger));
CTRL(_display, IDC_LIFE_BAR_WATER) progressSetPosition (1 / (100 / life_thirst));
CTRL(_display, IDC_LIFE_BAR_HEALTH) progressSetPosition (1 - (damage player));

CTRL(_display, IDC_LIFE_FOOD_TEXT) ctrlSetStructuredText parseText format["Food<t align='right'>%1</t>", [life_hunger, "%"] joinString ""];
CTRL(_display, IDC_LIFE_WATER_TEXT) ctrlSetStructuredText parseText format["Water<t align='right'>%1</t>", [life_thirst, "%"] joinString ""];
CTRL(_display, IDC_LIFE_HEALTH_TEXT) ctrlSetStructuredText parseText format["Health<t align='right'>%1</t>", [round((1 - (damage player)) * 100), "%"] joinString ""];

// Update Cash!
CTRL(_display, IDC_LIFE_CASH_TEXT) ctrlSetStructuredText parseText format["<t align='right'>£%1</t>", [CASH] call life_fnc_numberText];

private _icons = [];

// Delete all previous icons...
{
	if (_x isEqualType []) then {
		for "_i" from 0 to (count (_x) - 1) do { ctrlDelete (_x select _i) };
	} else {
		ctrlDelete _x;
	};
} forEach PHX_UI_Elements;
PHX_UI_Elements = []; // Wipe it...

// Get our active icons...
if !([player, "comms"] call PHX(hasItem)) then { _icons pushBack "nomic.paa" }; // Check if we have communications...
if !(soundVolume isEqualTo 1) then { _icons pushBack "nocomms.paa" };
if !(isNull objectParent player) then {
    if (!(player getVariable ["seatbelt", false]) && {((vehicle player) isKindOf "Car")}) then { _icons pushBack "seatbelt.paa" }; // Seatbelt Icon...

    // Car Unlocked / Locked Icon...
    _icons pushBack ([
        "carUnlocked.paa",
        "carLocked.paa"
    ] select ((locked (vehicle player)) isEqualTo 2));
};

if !(isNull objectParent player && (isNil{ ((vehicle player) getVariable "vehicle_upgrades") })) then {
    private _nos = (((vehicle player) getVariable ['vehicle_upgrades',[]]) select 3);

    if (_nos > 0) then {
        for "_i" from 0 to (_nos - 1) do {
            _icons pushBack "nos.paa"
        };
    };
};

// Define the increase variables for the icons...
#define X_INC 0.021625
#define W_INC 0.020625

private _IDC = IDC_LIFE_ICON_CREATION;
private _xVal = 0.0153125;
// Create new icons...
{
    private _icon = LIFEdisplay ctrlCreate ["Life_RscPictureKeepAspect", _IDC];
    _icon ctrlSetPosition [_xVal * safezoneW + safezoneX, 0.951 * safezoneH + safezoneY, 0.020625 * safezoneW, 0.033 * safezoneH];
    _icon ctrlsetText format["%1", ICON(_x)];

    PHX_UI_Elements pushBack _icon; // So we can delete it later if required...
    _IDC = _IDC + 1; // Increase IDC...
    _xVal = _xVal + X_INC; // Increase X Value...

    _icon ctrlCommit 0; // Commit the icon changes...
} forEach _icons;