#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleShopBuy.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Does something with vehicle purchasing.
*/
scopeName "vehicleBuy";

params [
    ["_mode",true,[true]],
    ["_plateManaged",false,[true]],
    ["_plate", "", [""]]
];

if (player getVariable ["isAdmin", false]) exitWith { ["You can't buy or rent vehicles while on-duty"] spawn PHX(notify) };

if ((lbCurSel 2302) isEqualTo -1) exitWith {NOTIFY("You did not pick a vehicle!","red"); closeDialog 0;};

if !(_plateManaged) exitWith {
    private _action = false;

    if (playerSide isEqualTo civilian) then {
        ((findDisplay 2300) displayCtrl 2302) ctrlEnable false;
        _action = [
            format[
                "Are you sure you wish to %1 this vehicle?",
                [ "rent", "buy" ] select (_mode)
            ],"Purchase Confirmation", "Purchase", "Cancel"
        ] call PHX_fnc_confirmBox;
    } else {
        _action = true;
        ((findDisplay 2300) displayCtrl 2302) ctrlEnable true;
    };

    if !(_action) exitWith {[format["You've chosen to cancel the %1 of this vehicle.", [ "rental", "purchase" ] select (_mode)], "red"] call PHX_fnc_notify;};

    if ((lbCurSel 2302) isEqualTo -1) exitWith {
        ["You did not pick a vehicle!", "red"] call PHX_fnc_notify;
        breakOut "vehicleBuy";
    };

    _plate = ctrlText 2306;
    if (_plate isEqualTo "Enter plate number...") then {_plate = ""};
    if ((count _plate) > 8 && !(_plate isEqualTo "")) exitWith { NOTIFY("The number plate must be less than 9 characters", "red") };
    if ((count _plate) < 3 && !(_plate isEqualTo "")) exitWith { NOTIFY("The number plate must be more than 2 characters", "red") };

    if ((toLower _plate) in LIFE_SETTINGS(getArray,"blockedWords")) exitWith { NOTIFY("You've included a naughty word in your number plate!", "red") };

    if (PHX_DonatorLevel < 1 && { !([_plate] call LIFE_fnc_isNumber) } && !(_plate isEqualTo "")) exitWith { NOTIFY("Only lifetime donators can include letters in their number plates!", "red"); breakOut "vehicleBuy"; };
    [_mode, _plate] remoteExecCall ["TON_fnc_checkPlate", RSERV];
};

private _className = lbData[2302,(lbCurSel 2302)];
private _vIndex = lbValue[2302,(lbCurSel 2302)];
private _vehicleList = M_CONFIG(getArray,"CfgVehicleStores",(life_veh_shop select 0),"vehicles");
private _shopSide = M_CONFIG(getText,"CfgVehicleStores",(life_veh_shop select 0),"side");

private _initalPrice = M_CONFIG(getNumber,"LifeCfgVehicles",_className,"price");
if (HAS_PERK("haggler")) then { _initalPrice  = _initalPrice  * 0.9 };

private _buyMultiplier = 1;
private _rentMultiplier = LIFE_SETTINGS(getNumber,"vehicle_rental_multiplier");

private _purchasePrice = round(_initalPrice * _rentMultiplier);

if (_mode) then {
    _purchasePrice = round(_initalPrice * _buyMultiplier);

    if (playerSide in [west, independent, east] || { isCID(player) || isHSS(player) }) then {
        [format ["Faction members are unable to buy vehicles..."]] spawn PHX(notify);
        breakOut "vehicleBuy";
    };
};

private _conditions = M_CONFIG(getText,"LifeCfgVehicles",_className,"conditions");

if !([_conditions] call life_fnc_levelCheck) exitWith {NOTIFY("You do not have the required license and/or level!","red");};

private _colorIndex = lbValue[2304,(lbCurSel 2304)];

if (_purchasePrice < 0) exitWith {closeDialog 0;}; //Bad price entry

private _spawnPoints = life_veh_shop select 1;
private _spawnPoint = "";

if ((life_veh_shop select 0) isEqualTo "nhs_air_store") then {
    if (nearestObjects[(getMarkerPos _spawnPoints),["Air"],35] isEqualTo []) exitWith {_spawnPoint = (_spawnPoints select 0)};
} else {
    //Check if there is multiple spawn points and find a suitable spawnpoint.
    if (_spawnPoints isEqualType []) then {
        //Find an available spawn point.
        {
            if ((nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) isEqualTo []) exitWith {_spawnPoint = _x};
            true
        } count _spawnPoints;
    } else {
        if (nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5] isEqualTo []) exitWith {_spawnPoint = _spawnPoints};
    };
};

if (_spawnPoint isEqualTo "") exitWith {NOTIFY("There is a vehicle currently blocking the spawn point...","red"); closeDialog 0;};

private _displayName = (getText(configFile >> "CfgVehicles" >> _className >> "displayName"));

if !(playerSide in [west, independent, east] || { isCID(player) || isHSS(player) }) then {
    if (CASH < _purchasePrice) exitWith {
        [format ["You do not have enough cash to purchase this vehicle. Amount Lacking: £%1",[_purchasePrice - CASH] call life_fnc_numberText],"red"] spawn PHX(notify);
        breakOut "vehicleBuy";
        closeDialog 0;
    };

    [_purchasePrice, 1, 0, (format["Purchased a %1",_displayName])] call PHX(handleMoney);

    [format ["You bought a %1 for £%2", _displayName, [_purchasePrice] call life_fnc_numberText]] spawn PHX(notify);
} else {
    [format ["You bought a %1", _displayName]] spawn PHX(notify);
};

//Spawn the vehicle and prep it.
private "_vehicle";

if ((life_veh_shop select 0) in ["nhs_air_store", "air_so1"]) then {
    _vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
    waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
    _vehicle allowDamage false;
    _hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50];
    if (_hs isEqualTo []) then {
        _vehicle setPos (getMarkerPos _spawnPoint);
        _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
        _vehicle setDir (markerDir _spawnPoint);
    } else {
        _vehicle setPosATL ((_hs select 0) modelToWorld [-0.4,-4,12.65]);
    };
    sleep 0.6;
} else {
    _vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
    waitUntil {!isNil "_vehicle" && {!isNull _vehicle}}; //Wait?
    _vehicle allowDamage false; //Temp disable damage handling..
    _vehicle setPos (getMarkerPos _spawnPoint);
    _vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
    _vehicle setDir (markerDir _spawnPoint);
};

_vehicle lock 2;

[_vehicle,_colorIndex] call life_fnc_colorVehicle;
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle setVariable ["trunk_in_use",false,true];
_vehicle setVariable ["vehicle_info_owners",[[getPlayerUID player,profileName]],true];
_vehicle setVariable ["vehicle_upgrades",[0,0,0,0,[]],true];

// _vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.

if (_className in ["B_UAV_01_F","O_UAV_01_F"]) then {
    createVehicleCrew _vehicle;
    _vehicle setAutonomous false;
};

//Side Specific actions.
switch (playerSide) do {
    case west: {
        _vehicle setVariable ["isAPC",true,true];
        [_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
        [_vehicle] spawn PHX_fnc_tracker;
        _vehicle addItemCargoGlobal ["Toolkit",2];
    };
    case civilian: { 
        _vehicle addItemCargoGlobal ["Toolkit",1];
    };
    case independent: {
        _vehicle setVariable ["isNHS",true,true];
        [_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
        [_vehicle] spawn PHX_fnc_tracker;
        _vehicle addItemCargoGlobal ["Toolkit",2];
    };
    case east: { 
        _vehicle setVariable ["isHAV",true,true];
        _vehicle addItemCargoGlobal ["Toolkit",2];
    };
};

_vehicle allowDamage true;
_vehicle setAmmoCargo 0;
_vehicle setFuelCargo 0;
_vehicle setRepairCargo 0;

_vehicle setPlateNumber _plate;

life_vehicles pushBack _vehicle;

//Always handle key management by the server
[getPlayerUID player,playerSide,_vehicle,1] remoteExecCall ["TON_fnc_keyManagement",RSERV];

if (_mode) then {
    if !(_className in LIFE_SETTINGS(getArray,"vehicleShop_rentalOnly")) then {
        [(getPlayerUID player),playerSide,_vehicle,_colorIndex,1,(HAS_PERK("Scrambler")),_plate] remoteExecCall (["fnc_vehicleCreate","TON"] call SOCK_fnc_getRemoteDestination);
    };

    [50, "Buying a Vehicle"] spawn PHX_fnc_handleXP;
};

if (playerSide isEqualTo civilian) then {
    [player, format ["%1 (%2) bought a %3 for %4. Bank Balance: %5 On Hand Balance: %6",profileName,getPlayerUID player,getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_purchasePrice] call life_fnc_numberText,[BANK] call life_fnc_numberText,[CASH] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

closeDialog 0; //Exit the menu.
true;