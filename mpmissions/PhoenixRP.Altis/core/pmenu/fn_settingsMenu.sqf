#include "..\..\script_macros.hpp"
/*
    File: fn_settingsMenu
    Author: Bryan "Tonic" Boardwine

    Description:
    Setup the settings menu.
*/
#include "..\..\PHX\GUI\Tablet\macros.hpp"
if !(PHX_curApp isEqualTo "Settings") then { [IDC_SETTINGS_TITLE, "Settings"] call PHX_fnc_switchApp };

disableSerialization;

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

ctrlSetText[IDC_SETTINGS_FOOTEDIT, format ["%1", life_settings_viewDistanceFoot]];
ctrlSetText[IDC_SETTINGS_CAREDIT, format ["%1", life_settings_viewDistanceCar]];
ctrlSetText[IDC_SETTINGS_AIREDIT, format ["%1", life_settings_viewDistanceAir]];

/* Set up the sliders */
{
    slidersetRange [(_x select 0),100,8000];
    (_display displayCtrl (_x select 0)) sliderSetSpeed [100,100,100];
    sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [
    [IDC_SETTINGS_FOOTSLIDER,life_settings_viewDistanceFoot],
    [IDC_SETTINGS_CARSLIDER,life_settings_viewDistanceCar],
    [IDC_SETTINGS_AIRSLIDER,life_settings_viewDistanceAir]
];

if (isNil "life_settings_revealObjects") then {
    life_settings_enableNewsBroadcast = profileNamespace setVariable ["life_enableNewsBroadcast",true];
    life_settings_enableSidechannel = profileNamespace setVariable ["life_enableSidechannel",true];
    life_settings_tagson = profileNamespace setVariable ["life_settings_tagson",true];
    life_settings_revealObjects = profileNamespace setVariable ["life_settings_revealObjects",true];
    life_settings_intro = profileNamespace getVariable ["life_settings_intro", false];
    PHX_hideHUD = profileNamespace getVariable ["life_settings_hud", false];
    PHX_settings_invisibleBackpack = profileNamespace getVariable ["PHX_invisibleBackpack", false];
    PHX_settings_streamerMode = profileNamespace getVariable ["PHX_settings_streamerMode", false];
    life_settings_player = profileNamespace getVariable ["life_settings_player", true];
    PHX_settings_ignoreRequests = profileNamespace getVariable ["PHX_settings_ignoreRequests", false];
    PHX_lowDetail = profileNamespace getVariable ["PHX_lowDetail", false];
};

(_display displayCtrl IDC_SETTINGS_CHATBOX) cbSetChecked life_settings_enableSidechannel;
(_display displayCtrl IDC_SETTINGS_BROADCASTBOX) cbSetChecked life_settings_enableNewsBroadcast;
(_display displayCtrl IDC_SETTINGS_TAGSBOX) cbSetChecked life_settings_tagson;
(_display displayCtrl IDC_SETTINGS_REVEALBOX) cbSetChecked life_settings_revealObjects;
(_display displayCtrl IDC_SETTINGS_HUDBOX) cbSetChecked PHX_hideHUD;
(_display displayCtrl IDC_SETTINGS_PLYBOX) cbSetChecked life_settings_player;
(_display displayCtrl IDC_SETTINGS_INTROBOX) cbSetChecked life_settings_intro;
(_display displayCtrl IDC_SETTINGS_IBBOX) cbSetChecked PHX_settings_invisibleBackpack;
(_display displayCtrl IDC_SETTINGS_STREAMERBOX) cbSetChecked PHX_settings_streamerMode;
(_display displayCtrl IDC_SETTINGS_ALLIANCEBOX) cbSetChecked PHX_settings_ignoreRequests;
(_display displayCtrl IDC_SETTINGS_GROUPBOX) cbSetChecked PHX_settings_disableGroupIcons;
(_display displayCtrl IDC_SETTINGS_LDBOX) cbSetChecked PHX_lowDetail;

// Add backgrounds...
private _backgroundList = (_display displayCtrl IDC_SETTINGS_BGDROP);
lbClear _backgroundList;

{
    private _skinName = M_CONFIG(getText,"CfgBackgrounds",configName _x,"skinName");

    _backgroundList lbAdd format["%1", _skinName];
    _backgroundList lbSetData [(lbSize _backgroundList)-1, configName _x];

    // Set this as our current option if it's our current option...
    if((configName _x) isEqualTo PHX_settings_tabletBackground) then {
        lbSetCurSel[IDC_SETTINGS_BGDROP, (lbSize _backgroundList)-1];
    };
} forEach ("true" configClasses (missionConfigFile >> "CfgBackgrounds"));


// Add prestige colours...
private _prestigeList = (_display displayCtrl IDC_SETTINGS_NTDROP);
lbClear _prestigeList;

{
    if (_forEachIndex <= PHX_PrestigeLevel) then {
        _colourName = getText(missionConfigFile >> "CfgColours" >> _x >> "name");
        _colour = getArray(missionConfigFile >> "CfgColours" >> _x >> "rgba");

        _prestigeList lbAdd format["%1", _colourName];
        _prestigeList lbSetData [(lbSize _prestigeList)-1, str(_colour)];
    };
} forEach ["default","lightblue","red","green","blue","purple","pink","bluegrey","yellow","grey","gold"];

_prestigeList lbSetCurSel 0;

// Hides tag button
if !(isHSS(player) || { (isCID(player)) && playerSide isEqualTo Civilian }) then {
    ctrlShow [IDC_SETTINGS_TAGBUT,false];
};