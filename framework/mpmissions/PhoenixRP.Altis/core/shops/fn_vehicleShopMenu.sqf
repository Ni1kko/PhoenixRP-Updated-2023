#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopMenu.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Blah
*/

(_this select 3) params [
    ["_shop","",[""]],
    ["_sideCheck",sideUnknown,[civilian, ""]],
    ["_spawnPoints","",["",[]]],
    ["_shopFlag","",[""]],
    ["_shopTitle","",[""]],
    ["_disableBuy",false,[true]]
];

disableSerialization;

//Long boring series of checks
if (dialog) exitWith {};
if (_shop isEqualTo "") exitWith {};

if (_sideCheck isEqualType "") then {
    _sideCheck = switch (_sideCheck) do {
        case "west": {west};
        case "east": {east};
        case "independent": {independent};
        case "civilian": {civilian};
    };
};

if (!(_sideCheck isEqualTo sideUnknown) && {!(playerSide isEqualTo _sideCheck)}) exitWith {NOTIFY("You are not allowed to use this shop!","red")};

private _conditions = M_CONFIG(getText,"CfgVehicleStores",_shop,"conditions");
if !([_conditions] call life_fnc_levelCheck) exitWith {NOTIFY("You are not allowed to use this shop!","red")};

createDialog "Life_Vehicle_Shop_v2_3D";

if (PHX_DonatorLevel < 1) then {
    ctrlEnable [2306,false];
    CONTROL(2300,2306) ctrlSetTooltip "You must be a donator to unlock this feature!";
};

life_veh_shop = [_shop,_spawnpoints,_shopFlag,_disableBuy]; //Store it so so other parts of the system can access it.

ctrlSetText [2301,_shopTitle];

if (_disableBuy || { playerSide in [west, independent, east] } || { isCID(player) } || { isHSS(player) }) then {
    //Disable the buy button.
    ctrlEnable [2309,false];
};

//Fetch the shop config.
_vehicleList = M_CONFIG(getArray,"CfgVehicleStores",_shop,"vehicles");

private _control = CONTROL(2300,2302);
lbClear _control; //Flush the list.
ctrlShow [2330,false];
ctrlShow [2304,false];

//Loop through
{
    _x params["_className"];

    private _toShow = [_x] call life_fnc_levelCheck;
    private _DLC = getText(configFile >> "CfgVehicles" >> _className >> "DLC");

    if (_toShow) then {
        _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
        _control lbAdd (_vehicleInfo select 3);
        _control lbSetPicture [(lbSize _control)-1,(_vehicleInfo select 2)];
        _control lbSetData [(lbSize _control)-1,_className];
        _control lbSetValue [(lbSize _control)-1,_forEachIndex];

        private _dlcID = getNumber(configFile >> "CfgMods" >> _DLC >> "appId");

        if (_dlcID in (getDLCs 2) && { !(_DLC isEqualTo "") }) then {
            // if we don't own this DLC then we need to display the icon...
            private _dlcIcon = getText(configFile >> "CfgMods" >> _DLC >> "logo");

            if !(_dlcIcon isEqualTo "") then {
                _control lbSetPictureRight [(lbSize _control)-1, _dlcIcon];
            };
        } else {
            if ((getNumber(missionConfigFile >> "LifeCfgVehicles" >> _classname >> "isDonator")) IsEqualTo 1) then {
                _control lbSetPictureRight [(lbSize _control)-1, "data\icons\ico_donator.paa"];
            };
        };
    };
} forEach _vehicleList;

((findDisplay 2300) displayCtrl 2302) lbSetCurSel 0;
