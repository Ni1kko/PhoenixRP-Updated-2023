/*
    @File: fn_giveItem.sqf

    @Author: Jack "Scarso" Farhall

    @Description: Gives items...
*/
#include "..\..\script_macros.hpp"
params[
    ["_mode", "", [""]],
    ["_item", "", [""]],
    ["_val", "", [""]],
    ["_unit",cursorObject,[objNull]]
];

switch (_mode) do {
    case "Load": {
        if !(createDialog "RscItemMenu") exitWith {};
        "Update" call LIFE(giveItem);
    };

    case "Update": {
        if (isNull (findDisplay 8000)) exitWith {};

        private _list = CONTROL(8000, 8004);
		lbClear _list;
		
		{
			if(ITEM_VALUE(configName _x) > 0) then {
				_list lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x),(getText(_x >> "displayName"))];
				_list lbSetData [(lbSize _list)-1,configName _x];
				_icon = ICON(M_CONFIG(getText,"CfgItems",configName _x,"icon"));
				if !(_icon isEqualTo "") then {
					_list lbSetPicture [(lbSize _list)-1,_icon];
				};
			};
		} foreach ("true" configClasses (missionConfigFile >> "CfgItems"));

		if(((lbSize _list)-1) isEqualTo -1) then {
			_list lbAdd "You don't have any items...";
			_list lbSetData [(lbSize _list)-1,""];
		};
    };

    case "Give": {
        ctrlEnable [8003,false];

        private _value = ctrlText 8002;

        if ((lbCurSel 8004) isEqualTo -1) exitWith { NOTIFY("You didn't select an item you wanted to give...","red"); ctrlEnable [8003,true]; };

        if (isNil "_unit" || { player distance _unit > 5 }) exitWith { NOTIFY("The selected player is not within range...","red"); ctrlEnable [8003,true]; };
        if (isNull _unit || {_unit isEqualTo player}) exitWith {};

        private _item = lbData [8004, lbCurSel 8004];

        if !([_value] call LIFE_fnc_isNumber) exitWith { NOTIFY("You didn't enter an actual number format...","red"); ctrlEnable [8003,true]; };
        if (parseNumber _value <= 0) exitWith { NOTIFY("You need to enter an actual amount you want to give...","red"); ctrlEnable [8003,true]; };
        if !([false,_item, parseNumber _value] call life_fnc_handleInv) exitWith { NOTIFY("You don't have that many of this item...","red"); ctrlEnable [8003,true]; };

        [_unit, _value, _item, player] remoteExecCall ["life_fnc_receiveItem", _unit];
        [format ["You gave %1 %2 x%3.", _unit getVariable ["realname", name _unit], _value, M_CONFIG(getText,"CfgItems",_item,"displayName")],"cyan"] call PHX_fnc_notify;

        "Update" call LIFE(giveItem);
        [3] call SOCK_fnc_updatePartial;

        ctrlEnable [8003,true];
    };

    case "Rob": {
        if (!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {["You can't give that many!", "red"] call PHX_fnc_notify};
        [_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];

        private _myInv = [[], life_carryWeight, life_maxWeight];

        {
            private _value = (ITEM_VALUE(configName _x));
            if (_value > 0) then {
                (_myInv select 0) pushBack [_x, _value];
            };
        } forEach ("true" configClasses (missionConfigFile >> "CfgItems"));
        ["recieveHostageInventory", _myInv, player, "RobUpdate"] remoteExecCall ["PHX_fnc_robInventory", _unit];
    };

    case "GiveHostage": {
        if (!([false,_item,(parseNumber _val)] call life_fnc_handleInv)) exitWith {["You can't give that many!", "red"] call PHX_fnc_notify};
        [_unit,_val,_item,player] remoteExecCall ["life_fnc_receiveItem",_unit];

        private _buttons = [3509,3507,3508,3510];
        {ctrlShow[_x,true];} forEach _buttons;
        ["getHostageInventory", player, "UpdateOnly"] remoteExecCall ["PHX_fnc_robInventory", _unit];
    };
};