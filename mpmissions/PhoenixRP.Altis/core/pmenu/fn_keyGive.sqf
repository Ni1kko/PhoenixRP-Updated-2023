/*
    @File: fn_keyGive.sqf
    @Author: Jack "Scarso" Farhall
    @Description: Gives keys...
*/
#include "..\..\script_macros.hpp"

_this params [
    ["_mode", "Load", [""]]
];

switch (_mode) do {
    case "Load": {
        if !(createDialog "RscItemMenu") exitWith {};

        private _giveButton = (CONTROL(8000, 8003));
        _giveButton ctrlRemoveAllEventHandlers "ButtonClick";
        _giveButton ctrlSetEventHandler ["ButtonClick", "['Give'] call life_fnc_keyGive"];

        ctrlShow [8002, false];
        "Update" call LIFE(keyGive);
    };

    case "Update": {
        if (isNull (findDisplay 8000)) exitWith {};

        private _list = CONTROL(8000, 8004);
		lbClear _list;
		
		for "_i" from 0 to (count life_vehicles)-1 do {
			_veh = life_vehicles select _i;
			if (!isNull _veh && alive _veh) then {
				_color = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _veh),"textures") select (_veh getVariable "Life_VEH_color")) select 0);
				if (isNil "_color") then {_color = ""};
				_text = format ["(%1)",_color];
				if (_text isEqualTo "()") then {
					_text = "";
				};

				private _distance = round(player distance _veh);
				if (_distance >= 100) then { _distance = ">100" };

				_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");

				if !((_veh getVariable ["house_name", ""]) isEqualTo "") then {
					_name = format["%1 (%2)", (_veh getVariable ["house_name", ""]), _name];
				};

				_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
				_list lbAdd format ["%1 %3 - [Distance: %2m]",_name,_distance,_text];

				if (_pic != "pictureStaticObject") then {
					_list lbSetPicture [(lbSize _list)-1,_pic];
				};
				_list lbSetData [(lbSize _list)-1,str(_i)];
			};
		};

		if(((lbSize _list)-1) isEqualTo -1) then {
			_list lbAdd "You don't have any keys...";
			_list lbSetData [(lbSize _list)-1,""];
		};
    };

    case "Give": {
        ctrlEnable [8003, false];

        if (isNull life_pInact_curTarget || { (life_pInact_curTarget distance player) > 5 }) exitWith { NOTIFY("This player is not within range", "red"); ctrlEnable [8003,true];};
        if (life_pInact_curTarget isEqualTo player) exitWith {};

        private _dialog = findDisplay 8000;
        private _list = _dialog displayCtrl 8004;

        private _sel = lbCurSel _list;
        if ((_list lbData _sel) isEqualTo "") exitWith { NOTIFY("You did not select a vehicle.","red"); ctrlEnable [8003, true] };

        private _vehicle = _list lbData _sel;
        _vehicle = life_vehicles select parseNumber(_vehicle);

        private _uid = getPlayerUID life_pInact_curTarget;
        private _owners = _vehicle getVariable "vehicle_info_owners";
        private _index = [_uid,_owners] call LIFE_fnc_index;
        if (_index isEqualTo -1) then  {
            _owners pushBack [_uid,life_pInact_curTarget getVariable ["realname",name life_pInact_curTarget]];
            _vehicle setVariable ["vehicle_info_owners",_owners,true];
        };

        private _name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

        [format ["You have given %1 keys to your %2.",life_pInact_curTarget getVariable ["realname",name life_pInact_curTarget],_name],"green"] call PHX_fnc_notify;
        [_vehicle,life_pInact_curTarget,player] remoteExecCAll ["LIFE_fnc_clientGetKey",life_pInact_curTarget];

        "Update" call LIFE(keyGive);
        ctrlEnable [8003, true];
    };
};