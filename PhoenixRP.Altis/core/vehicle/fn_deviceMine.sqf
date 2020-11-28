#include "..\..\script_macros.hpp"
/*
    File: fn_deviceMine.sqf
    Author: Bryan "Tonic" Boardwine
    Modified: Devilfloh
    Description:
    Starts automated mining of resource from the tempest device. Not integrated with percents.
*/

params [
    ["_vehicle",objNull,[objNull]]
];

private _isMineral = true;
if (isNull _vehicle) exitWith {};

if (!isNil {_vehicle getVariable "mining"}) exitWith {
    NOTIFY("This vehicle is already mining...","red");
};

if (fuel _vehicle isEqualTo 0) exitWith {
    NOTIFY("The device is out of fuel.","red");
};

closeDialog 0; //Close the interaction menu.
life_action_inUse = true; //Lock out the interaction menu for a bit..

private _weight = [_vehicle] call life_fnc_vehicleWeight;
if ((_weight select 1) >= (_weight select 0)) exitWith {
    NOTIFY("The device is full.","red");
    life_action_inUse = false;
};

//check if we are in the resource zone for any of the resources
private _zone = "";
private _resource = "";
private _resourceZones = "";
private _inv = "";
private _itemIndex = "";
private _curConfig = "";
private _isMineral = 0;
private _sum = 0;
private _itemWeight = 0;
private _random = 0;
private _space = 0;
private _resourceCfg = missionConfigFile >> "CfgGathering";

for "_i" from 0 to count(_resourceCfg)-1 do {
    _curConfig = (_resourceCfg select _i);
    _resource = getText(_curConfig >> "gathered");
    _resourceZones = getArray(_curConfig >> "zones");
    _zoneSize = getNumber(_curConfig >> "zoneSize");
    _canUseDevice = getNumber(_curConfig >> "canUseDevice");

    {
        if ((player distance (getMarkerPos _x)) < _zoneSize) exitWith {
            _zone = _x;
        };
    } forEach _resourceZones;

    if (_zone != "") exitWith {_isMineral = false;};
};

if (_zone isEqualTo "") exitWith {
    NOTIFY("You are not near a resource area.","red");
    life_action_inUse = false;
};

if (_canUseDevice isEqualTo 0) exitWith {
    NOTIFY("The device can't be used on this zone.","red");
    life_action_inUse = false;
};

_vehicle setVariable ["mining",true,true]; //Lock the device

life_action_inUse = false; //Unlock it since it's going to do it's own thing...

for "_i" from 0 to 1 step 0 do {
    if (!alive _vehicle || isNull _vehicle) exitWith {};

    if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
        NOTIFY("You cannot turn the vehicle on when mining.","red");
    };

    if (fuel _vehicle isEqualTo 0) exitWith {
        NOTIFY("The device is out of fuel.","red");
    };

    NOTIFY("The device is mining...","green");
    _time = time + 27;

    //Wait for 27 seconds with a 'delta-time' wait.
    waitUntil {
        if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
            _vehicle setVariable ["mining",nil,true];
            NOTIFY("You cannot turn the vehicle on when mining.","red");
            true
        };

        if (round(_time - time) < 1) exitWith {
            true
        };

        if (fuel _vehicle < 0.1) exitWith {
            _vehicle setVariable ["mining",nil,true];
            NOTIFY("The device is out of fuel.","red");
            true
        };

        sleep 0.2;
        false
    };

    if ((isEngineOn _vehicle) || ((speed _vehicle) > 5)) exitWith {
        _vehicle setVariable ["mining",nil,true];
        NOTIFY("You cannot turn the vehicle on when mining.","red");
    };

    _vehicle_data = _vehicle getVariable ["Trunk",[[],0]];
    _inv = +(_vehicle_data select 0);
    _space = (_vehicle_data select 1);
    _itemIndex = [_resource,_inv] call LIFE_fnc_index;
    _weight = [_vehicle] call life_fnc_vehicleWeight;
    _random = 10 + round((random(10)));
    _sum = [_resource,_random,(_weight select 1),(_weight select 0)] call life_fnc_calWeightDiff; // Get a sum base of the remaining weight..

    if (_sum < 1) exitWith {
        NOTIFY("The device is full","red");
        _vehicle setVariable ["mining",nil,true];
    };

    if (_itemIndex isEqualTo -1) then {
        _inv pushBack [_resource,_sum];
    } else {
        _val = (_inv select _itemIndex) select 1;
        _inv set [_itemIndex,[_resource,_val + _sum]];
    };

    if (fuel _vehicle < 0.1) exitWith {
        _vehicle setVariable ["mining",nil,true];
        NOTIFY("The device is out of fuel.","red");
    };

    //Locality checks...
    if (local _vehicle) then {
        _vehicle setFuel (fuel _vehicle)-0.05;
    } else {
        [_vehicle,(fuel _vehicle)-0.05] remoteExecCall ["life_fnc_setFuel",_vehicle];
    };

    if (fuel _vehicle < 0.1) exitWith {
        NOTIFY("The device is out of fuel.","red");
        _vehicle setVariable ["mining",nil,true];
    };

    [format ["Completed cycle - The device has mined %1 %2",_sum,(M_CONFIG(getText,"CfgItems",_resource,"displayName"))],"green"] call PHX_fnc_notify;
    _itemWeight = ([_resource] call life_fnc_itemWeight) * _sum;
    _vehicle setVariable ["Trunk",[_inv,_space + _itemWeight],true];
    _weight = [_vehicle] call life_fnc_vehicleWeight;
    _sum = [_resource,_random,(_weight select 1),(_weight select 0)] call life_fnc_calWeightDiff; //Get a sum base of the remaining weight..

    if (_sum < 1) exitWith {
        _vehicle setVariable ["mining",nil,true];
        NOTIFY("The device is full","red");
    };

    sleep 2;
};

_vehicle setVariable ["mining",nil,true];
