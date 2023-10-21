/*
    File: fn_useItem.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Main function for item effects and functionality through the player menu.
*/
#include "..\..\script_macros.hpp"
disableSerialization;

if ((lbCurSel 23202) isEqualTo -1) exitWith {NOTIFY("You need to select an item first!","red");};
private _item = CONTROL_DATA(23202);

switch (true) do {
    case (_item in PHX_UseableItems): {
        if (((getArray(missionConfigFile >> "CfgItems" >> _item >> "edibility" >> "edible")) select 0) isEqualTo 1) then {
            if ([false,_item,1] call life_fnc_handleInv) then {
                _val = getNumber(missionConfigFile >> "CfgItems" >> _item >> "edibility" >> "value");

                if (_item in PHX_Food) then {
                    _sum = life_hunger + _val;
                    switch (true) do {
                        case (_val < 0 && _sum < 1): {life_hunger = 5;}; //This adds the ability to set the entry edible to a negative value and decrease the hunger without death
                        case (_sum > 100): {life_hunger = 100;};
                        default {life_hunger = _sum;};
                    };

                    [format["You've eaten a %1 and gained %2 hunger", ITEM_NAME(_item), _val],"green"] call PHX_fnc_notify;
                };

                if (_item in PHX_Drinks) then {
                    _sum = life_thirst + _val;

                    if (_item in ["beer","moonshine","whiskey","cider","vodka","gin"]) then {
                        [_item] call PHX_fnc_drink;
                    };

                    switch (true) do {
                        case (_val < 0 && _sum < 1): {life_thirst = 5;};
                        case (_sum > 100): {life_thirst = 100;};
                        default {life_thirst = _sum;};
                    };

                    [format["You've drunk a %1 and gained %2 thirst", ITEM_NAME(_item), _val],"green"] call PHX_fnc_notify;
                };
            };
        };
    };

    case (_item isEqualTo "firstaidkit_virtual" || {(_item isEqualTo "medikit_virtual")}): {
        ["","","",false] spawn PHX_fnc_firstAid;
        closeDialog 0;
    };

    case (_item isEqualTo "boltcutter"): {
        [cursorObject] spawn life_fnc_boltcutter;
        closeDialog 0;
    };
    
    case (_item isEqualTo "scratchcard"): {
        closeDialog 0;
        ([false,_item,1] call life_fnc_handleInv);
        createDialog "RscScratchcard";
    };

    case (_item isEqualTo "siphonpump"): {
        if !(vehicle player isEqualTo player) exitWith {["You can't do this whilst inside a vehicle!", "red"] call PHX_fnc_notify;};
        [cursorObject] spawn PHX_fnc_siphon;
        closeDialog 0;
    };
    
    case (_item isEqualTo "spikeStrip"): {
        if (!isNull life_spikestrip) exitWith {["You already have a active spike strip","red"] call PHX_fnc_notify; closeDialog 0};
        [] spawn life_fnc_spikeStrip;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelFull"): {
        if !(isNull objectParent player) exitWith {["You can't refuel the vehicle while in it!","red"] call PHX_fnc_notify};
        [cursorObject] spawn life_fnc_jerryRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "fuelEmpty"): {
        [] spawn life_fnc_jerryCanRefuel;
        closeDialog 0;
    };

    case (_item isEqualTo "lockpick"): {
        [] spawn life_fnc_lockpick;
        closeDialog 0;
    };

    case (_item in ["cigarette","cigar"]): {
      if (([false,_item,1] call life_fnc_handleInv)) then {
          [] spawn PHX_fnc_cigarette;
          closeDialog 0;
      };
    };

    case (_item isEqualTo "redgull"): {
        [] spawn PHX_fnc_redgull;
    };

    case (_item isEqualTo "gpstracker"): {
        [cursorObject] spawn PHX_fnc_trackerAction;
    };

    case (_item isEqualTo "breathalyser"): {
        if !(isPlayer cursorTarget) exitWith { ["You are not looking at anyone!", "red"] call PHX_fnc_notify };
        if !(playerSide in [west, independent]) exitwith { ["Only certain people know how to use this!", "red"] call PHX_fnc_notify };
        
        sleep 2;
        [] remoteExecCall ["PHX_fnc_breathalyse", cursorTarget];

        closeDialog 0;
    };

    case (_item in ["heroin_processed","ecstasy","cocaine_processed","marijuana","meth_processed","fentanyl","morphine"]): {
        if (([false,_item,1] call life_fnc_handleInv)) then {
            [_item] call PHX_fnc_drugs;
            closeDialog 0;
        };
    };

    default {
        NOTIFY("This item isn't usable","red");
    };
};

["Inventory"] call PHX(onLoad);
[] call PHX(hudUpdate);