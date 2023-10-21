#include "..\..\script_macros.hpp"
/*
    File: fn_virt_menu.sqf
    Author: Bryan "Tonic" Boardwine
    Description:
    Initialize the virtual shop menu.
*/

params [
    ["_shopNPC", objNull, [objNull]],
    "",
    "",
    ["_shopType", "", [""]]
];

if (isNull _shopNPC || {_shopType isEqualTo ""}) exitWith {};

life_shop_type = _shopType;
life_shop_npc = _shopNPC;

private _conditions = M_CONFIG(getText,"CfgShops",_shopType,"conditions");

if !([_conditions] call life_fnc_levelCheck) exitWith {NOTIFY("You are not allowed to use this shop!","red");};

createDialog "shops_menu";

if (!isClass(missionConfigFile >> "CfgShops" >> life_shop_type)) exitWith {closeDialog 0; NOTIFY("Config does not exist?","red");}; //Make sure the entry exists..
ctrlSetText[2403, (M_CONFIG(getText,"CfgShops",life_shop_type,"name"))];

//Setup control vars.
private _item = CONTROL(2400,2401);
lbClear _item;

private _shopItems = M_CONFIG(getArray,"CfgShops",life_shop_type,"items");

{
    _displayName = M_CONFIG(getText,"CfgItems",_x,"displayName");

    _price = M_CONFIG(getNumber,"CfgItems",_x,"buyPrice");
    _isIllegal = ITEM_ILLEGAL(_x);

    if (!_isIllegal && { (toLower(life_shop_type)) in (LIFE_SETTINGS(getArray,"untaxedStores")) }) then {
        _price = round (_price * (1 + (PHX_TaxRate/100)));
    };

    if (!(_price isEqualTo -1) || { (life_shop_type isEqualTo "apc_command_market") && (_x isEqualTo "goldbar") }) then {
        _item lbAdd format ["%1  (£%2)",_displayName,[_price] call life_fnc_numberText];
        _item lbSetData [(lbSize _item)-1,_x];
        _item lbSetValue [(lbSize _item)-1,_price];
        _icon = ICON(M_CONFIG(getText,"CfgItems",_x,"icon"));
        if (!(_icon isEqualTo "")) then {
            _item lbSetPicture [(lbSize _item)-1,_icon];
        };
    };
} forEach _shopItems;

[] call life_fnc_virt_update;