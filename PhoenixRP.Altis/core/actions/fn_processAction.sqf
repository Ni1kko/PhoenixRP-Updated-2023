#include "..\..\script_macros.hpp"
/*
    File: fn_processAction.sqf
    Author: Bryan "Tonic" Boardwine
    Modified : NiiRoZz

    Description:
    Master handling for processing an item.
    NiiRoZz : Added multiprocess
*/

if (isNull PHX_ProcessingVendor) exitWith {systemChat "Vendor?"};

private _vendor = PHX_ProcessingVendor;
private _type = CONTROL_DATA(5001);

//Error check
if (isNull _vendor || {_type isEqualTo ""} || {(player distance _vendor > 10)}) exitWith {systemChat str [_vendor, _type, player distance _vendor]};
life_action_inUse = true;//Lock out other actions during processing.
closeDialog 0;
PHX_ProcessingVendor = objNull;

private _profession = [];
private _requiredLicense = "";
private _materialsRequired = "";
private _materialsGiven = "";
private _noLicenseCost = 0;
private _giveXP = 0;
private _text = "";
private _filter = true;
private _hasLicense = false;

if (isClass (missionConfigFile >> "CfgProcess" >> _type)) then {
    _filter = false;
    _materialsRequired = M_CONFIG(getArray,"CfgProcess",_type,"MaterialsReq");
    _materialsGiven = M_CONFIG(getArray,"CfgProcess",_type,"MaterialsGive");
    _requiredLicense = M_CONFIG(getText,"CfgProcess",_type,"RequiredLicense");
    _giveXP = M_CONFIG(getNumber,"CfgProcess",_type,"giveXP");
    _noLicenseCost = M_CONFIG(getNumber,"CfgProcess",_type,"NoLicenseCost");
    _profession = M_CONFIG(getArray,"CfgProcess",_type,"profession");
    _text = M_CONFIG(getText,"CfgProcess",_type,"Text");
};

if (_filter) exitWith {life_action_inUse = false;};

private _itemInfo = [_materialsRequired, _materialsGiven, _noLicenseCost, _text, _requiredLicense];
if (count _itemInfo isEqualTo 0) exitWith {life_action_inUse = false;};

//Setup vars.
private _oldItem = _itemInfo select 0;
private _newItem = _itemInfo select 1;
private _cost = _itemInfo select 2;
private _upp = _itemInfo select 3;
private _licenseRequired = _itemInfo select 4;

// Split the profession array...
private _profZone = _profession select 0;
private _profRequirement = _profession select 1;
private _profXP = _profession select 2;
private _profChance = _profession select 3;

_exit = false;
if (count _oldItem isEqualTo 0) exitWith {life_action_inUse = false;};

private _totalConversions = [];
{
    _var = ITEM_VALUE(_x select 0);
    if (_var isEqualTo 0) exitWith {_exit = true;};
    if (_var < (_x select 1)) exitWith {_exit = true;};
    _totalConversions pushBack (floor (_var/(_x select 1)));
} forEach _oldItem;

if (_exit) exitWith {life_is_processing = false; NOTIFY("You don't have enough items!","red"); life_action_inUse = false;};

if (_licenseRequired isEqualTo "" || { LICENSE_VALUE(_licenseRequired, "civ") } || { playerSide isEqualTo east }) then {
    _hasLicense = true;
};

_cost = _cost * (count _oldItem);

private _minimumConversions = _totalConversions call BIS_fnc_lowestNum;
private _oldItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _oldItemWeight = _oldItemWeight + _weight;
} count _oldItem;

private _newItemWeight = 0;
{
    _weight = ([_x select 0] call life_fnc_itemWeight) * (_x select 1);
    _newItemWeight = _newItemWeight + _weight;
} count _newItem;

_exit = false;

if (_newItemWeight > _oldItemWeight) then {
    _netChange = _newItemWeight - _oldItemWeight;
    _freeSpace = life_maxWeight - life_carryWeight;
    if (_freeSpace < _netChange) exitWith {_exit = true;};
    private _estConversions = floor(_freeSpace / _netChange);
    if (_estConversions < _minimumConversions) then {
        _minimumConversions = _estConversions;
    };
};

if (_exit) exitWith {NOTIFY("You have no inventory space to process your materials.","red"); life_is_processing = false; life_action_inUse = false;};

life_is_processing = true;

private _level = PROF_LVL(_profZone);

if (CASH < _cost && { !_hasLicense }) exitWith {[format ["You need £%1 to process without a license!",[_cost] call life_fnc_numberText],"red"] call PHX_fnc_notify; life_is_processing = false; life_action_inUse = false;};

if !(
    [
        _upp,
        ([90, 28] select (_hasLicense)),
        [
            "player distance (_this select 0) < 10", 
            [_vendor], false, 
            "[""You must remain within 10m of the processor"",""red""] call PHX_fnc_notify;"
        ],
        ([0.01, (0.01 + (_level / 2500))] select (_level > 0 && { _hasLicense })),
        ""
    ] call PHX(handleProgress)
) exitWith { life_is_processing = false; life_action_inUse = false; };

// Check one last time...
if (CASH < _cost && { !_hasLicense }) exitWith {[format ["You need £%1 to process without a license!",[_cost] call life_fnc_numberText],"red"] call PHX_fnc_notify; life_is_processing = false; life_action_inUse = false;};

{
    [false,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
} count _oldItem;

{
    [true,(_x select 0),((_x select 1)*(_minimumConversions))] call life_fnc_handleInv;
} count _newItem;

if (_minimumConversions isEqualTo (_totalConversions call BIS_fnc_lowestNum)) then {
    NOTIFY("You have processed your items!","green");
} else {
    NOTIFY("Only part of your materials could be processed due to reaching your maximum weight.","cyan");
};

if (_hasLicense) then {
    [_profZone,_profXP,_profChance] call PHX(increaseProfession); // Increase the profession...
    
    if (_giveXP isEqualTo 1) then {
        [(2 * _minimumConversions), "Processing"] spawn PHX(handleXP); // 2 XP * Processed Items
    };
} else {
    [_cost, 1, 0, "Processing Fee"] call PHX(handleMoney);
    [player, format ["%1 (%2) processed without a license for %3",profileName,getPlayerUID player,[_cost] call life_fnc_numberText], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);
};

life_is_processing = false; 
life_action_inUse = false;