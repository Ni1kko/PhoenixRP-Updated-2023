/*
	Author: Maverick Applications
	Desc: Altis Life Shipwreck
*/

if (hasInterface) exitWith 
{
	if (isNil "life_wrecklooting") then 
	{
		player addEventHandler ["Respawn", {call PHX_fnc_loadShipwreck} ];
	};
	
	life_wrecklooting = false;
    
	player addAction["Retrieve the loot",
	{
        [] spawn {
            if (life_wrecklooting) exitWith {};
            life_wrecklooting = true;
            private _allGood = true;
            sleep random(1.9);
			private _index = -1;
            private _lootArray = ((nearestObjects[player,["Land_Wreck_Traw_F"], 20]) select 0) getVariable["wreckloot", []];
            if (_lootArray isEqualTo []) exitWith {};
            {
                if ([true,_x,1] call life_fnc_handleInv) then {
                    _index = _forEachIndex;
                } else {
                    _allGood = false;
                };
                if (!_allGood) exitWith {["You can not carry all the loot. Make some room first!", "red"] call PHX_fnc_notify;};
            } forEach _lootArray;
            if (_allGood) then {
                ["You successfully claimed the wreck's loot for you!", "green"] call PHX_fnc_notify;
                ((nearestObjects[player,["Land_Wreck_Traw_F"], 20]) select 0) setVariable ["wreckloot", [], true];
            } else {
				for "_i" from 0 to _index do {_lootArray deleteAt 0;};
                ((nearestObjects[player,["Land_Wreck_Traw_F"], 20]) select 0) setVariable ["wreckloot", _lootArray, true];
            };
            life_wrecklooting = false;
        };
    },"",0,false,false,"",'!life_wrecklooting && ((count nearestObjects[player,["Land_Wreck_Traw_F"], 20]) != 0) && (count(((nearestObjects[player,["Land_Wreck_Traw_F"], 20]) select 0) getVariable["wreckloot", []]) != 0)'];
};
	
if (!isServer) exitWith {};

[] spawn PHX_fnc_initShipwreck;