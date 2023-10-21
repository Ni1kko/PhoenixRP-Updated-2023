#include "..\..\..\..\script_macros.hpp"
/*
	@File: fn_robInventory.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Loads the UI for robbing virtual inventories and handles all related functions.
	@Usage: 
		- ["loadUI"] call PHX_fnc_robInventory; - Load UI
		- ["updateLists"] call PHX_fnc_robInventory; - Updates lists of hostage and player inventories.
		- ["getHostageInventory", ME]  remoteExecCall["PHX_fnc_robInventory", HOSTAGE]; - Gets the current vItems of our hostage.
		- ["recieveHostageInventory", INV]  remoteExecCall["PHX_fnc_robInventory", ROBBER]; - Used as a "callback" to the person robbing us with our inventory.

	@Returns:
		- Nothing
*/

params [
	["_mode", "", [""]]
];

if(isNil "_mode" || (_mode isEqualTo "")) exitWith {}; // Stop us here if we don't actually have a function...

switch (_mode) do {
	case "loadUI": {
		if !(IsNull (FindDisplay 3500)) exitWith {};
		_hostage = param [1,objNull, [objNull]];
		if ((_hostage getVariable ["trunk_in_use",false])) exitWith {["Someone else is already viewing this players inventory!", "red"] call PHX_fnc_notify;};
		_hostage setVariable["trunk_in_use",true,true];
		_hostage setVariable["trunk_in_use_by",player,true];
		_restrained = isRestrained(_hostage);
		disableSerialization;
		if (!createDialog "RscRobInventory") exitWith {["UI creation failed!", "red"] call PHX_fnc_notify;};
		
		PHX_hostage = _hostage;
		["updateLists"] call PHX_fnc_robInventory;

		// For monitoring the UI and hostage conditions...
		[_hostage, _restrained] spawn {
			waitUntil {
				isNull (findDisplay 3500) ||
				{ !(_this select 1 isEqualTo (isRestrained(_this select 0))) } ||
				{ !alive (_this select 0) }
			};
			_this select 0 setVariable["trunk_in_use",false,true];
			_this select 0 setVariable["trunk_in_use_by",objNull,true];
			closeDialog 0;
		};
	};
	case "updateLists": {
		_playerList = CONTROL(3500,3503);
		_hostageList = CONTROL(3500,3502);

		ctrlSetText[3501,format["Hostage - %1", name PHX_hostage]];
		lbCLear _playerList;
		lbCLear _hostageList;
		//Player Inventory Items
		{
			_val = ITEM_VALUE(configName _x);

			if (_val > 0) then {
				_playerList lbAdd format["[%1] - %2",_val,(getText(_x >> "displayName"))];
				_playerList lbSetData [(lbSize _playerList)-1,configName _x];
				_icon = (getText(_x >> "icon"));
				if (!(_icon isEqualTo "")) then {
					_playerList lbSetPicture [(lbSize _playerList)-1,ICON(_icon)];
				};
			};
		} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

		//Hostage Inventory Items
		{
			// If we're an array do this
			if (_x isEqualType []) then {
				{
					private _item = (_x select 0); // The item.
					private _val = (_x select 1); // How many of this item we have.

					if (_val > 0) then {
						_hostageList lbAdd format["[%1] - %2",_val,(getText(_item >> "displayName"))];
						_hostageList lbSetData [(lbSize _hostageList)-1,configName _item];
						_icon = (getText(_item >> "icon"));
						if (!(_icon isEqualTo "")) then {
							_hostageList lbSetPicture [(lbSize _hostageList)-1,ICON(_icon)];
						};
					};
				} forEach _x;
			};
		} forEach PHX_hostageInv;

		ctrlSetText[3501,format["Trunk (%1/%2)", PHX_hostageInv select 1, PHX_hostageInv select 2]];
	};
	case "getHostageInventory": {
		_robber = param [1,objNull, [objNull]];
		_mode = param [2, "", [""]];
		if(player getVariable["trunk_in_use",false] && !((player getVariable["trunk_in_use_by",nil]) isEqualTo _robber)) exitWith {
			[format ["Someone else is already viewing %1's inventory!", name player], "red"] call PHX(notify);
		};

		_myInv = [[], life_carryWeight, life_maxWeight];

		{
			private _val = (ITEM_VALUE(configName _x));
			if (_val > 0) then {
				(_myInv select 0) pushBack [_x, _val];
			};
		} forEach ("true" configClasses (missionConfigFile >> "CfgItems"));

		["recieveHostageInventory", _myInv, player, _mode]  remoteExecCall["PHX_fnc_robInventory", _robber];
	};
	case "recieveHostageInventory": {
		// The hostage inventory will return an array of items in index 0.
		// Weight of items in index 1.
		// Total possible carry weight in index 2;
		PHX_hostageInv = param [1,[[],0,0],[[]]]; // Get the inventory we've been sent.
		_hostage = param [2,objNull, [objNull]];
		_mode = param [3, "", [""]];
		PHX_recievedUpdate = true;

		if(_mode isEqualTo "") then {
			["loadUI", _hostage] call PHX_fnc_robInventory;
		} else {
			["updateLists"] call PHX_fnc_robInventory;
		};
	};
	// Handling these here made me feel happy
	case "takeItem": {
		private _valMode = param[1, "One", [""]]; // Default to take "one" item
		
		// Disable all buttons to stop auto clickers...
		// Take Button, Take All Button, Store Button,Store All Button
		private _buttons = [3509,3507,3508,3510];
		{ctrlShow[_x,false];} forEach _buttons;

		// Don't want to take something we've not selected.
		if ((lbCurSel 3502) isEqualTo -1 || (lbData [3502,(lbCurSel 3502)]) isEqualTo "") exitWith {
			["You need to select an item from the hostage to take!", "red"] call PHX_fnc_notify;
			{ctrlShow[_x,true];} forEach _buttons; // Renable Buttons...
		};

		// Getting the value of our item
		private _value = ctrlText 3505;
		if(_valMode isEqualTo "All") then {
			{
				if (_x isEqualType []) then {
					{
						if((configName(_x select 0)) isEqualTo lbData [3502,(lbCurSel 3502)]) exitWith {
							private _val = (_x select 1); // How many of this item we have.

							if (_val > 0) then {
								_value = str(_val);
							};
						};
					} forEach _x;
				};
			} forEach PHX_hostageInv;
		};

		// Tell their client to send us the item...
		PHX_recievedUpdate = false;
		["Rob",lbData [3502,(lbCurSel 3502)], _value, player] remoteExecCall ["life_fnc_giveItem", PHX_hostage];
		
		waitUntil { !PHX_recievedUpdate };
		{ctrlShow[_x,true];} forEach _buttons; // Renable Buttons...
	};
	case "giveItem": {
		private _valMode = param[1, "One", [""]]; // Default to take "one" item

		// Disable all buttons to stop auto clickers...
		// Take Button, Take All Button, Store Button,Store All Button
		private _buttons = [3509,3507,3508,3510];
		{ctrlShow[_x,false];} forEach _buttons;

		// Don't want to take something we've not selected.
		if ((lbCurSel 3503) isEqualTo -1 || (lbData [3503,(lbCurSel 3503)]) isEqualTo "") exitWith {
			["You need to select an item to give to the hostage!", "red"] call PHX_fnc_notify;
			{ctrlShow[_x,true];} forEach _buttons; // Renable Buttons...
		};

		// Getting the value of our item
		private _item = lbData [3503,(lbCurSel 3503)];
		private _value = ctrlText 3505;
		if(_valMode isEqualTo "All") then {
			_value = str(ITEM_VALUE(_item));
		};

		["GiveHostage",lbData [3503,(lbCurSel 3503)], _value, PHX_hostage] call life_fnc_giveItem;
	};
};