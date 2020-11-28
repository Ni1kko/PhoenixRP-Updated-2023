#include "..\..\script_macros.hpp"
/*
    File: fn_virt_update.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Update and fill the virtual shop menu.
*/
disableSerialization;

private _name = "";
private _shopItems = M_CONFIG(getArray,"CfgShops",life_shop_type,"items");

private _gear = CONTROL(2400,2402);
lbClear _gear;

{
    _name = M_CONFIG(getText,"CfgItems",_x,"displayName");
    _val = ITEM_VALUE(_x);

    if (_val > 0) then {
        _gear lbAdd format ["%2 [x%1]",_val,_name];
        _gear lbSetData [(lbSize _gear)-1,_x];
        _icon = ICON(M_CONFIG(getText,"CfgItems",_x,"icon"));
        if (!(_icon isEqualTo "")) then {
            _gear lbSetPicture [(lbSize _gear)-1,_icon];
        };
    };
} forEach _shopItems;