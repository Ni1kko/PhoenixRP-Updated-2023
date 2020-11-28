/*
    File: fn_setupEVH.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Master eventhandler file
*/

/* Incapacitation System */
player addEventHandler ["Killed", {_this call PHX_fnc_onKilled}];
player addEventHandler ["HandleDamage", {_this call PHX_fnc_onDamaged}];
player addEventHandler ["Respawn", {_this call PHX_fnc_onRespawn}];

/* Seatbelt System */
player addEventHandler ["GetOutMan", {_this call PHX_fnc_onGetOut}];

player addEventHandler ["GetInMan", {
    player setVariable ["seatbelt",([false, true] select ((PHX_Perks findIf { _x isEqualTo "secondNature" }) > -1)),true];
    [] call PHX_fnc_hudUpdate;
    setCurrentChannel 4;
}];

/* Other */
player addEventHandler ["Take", {_this call life_fnc_onTakeItem}];
player addEventHandler ["Put", {[] call PHX_fnc_hudUpdate}];
player addEventHandler ["Fired", {_this call PHX_fnc_onFire}];
player addEventHandler ["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler ["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler ["HandleRating", {0}];

addMissionEventHandler ["Map", {_this spawn PHX_fnc_mapMarkers}];