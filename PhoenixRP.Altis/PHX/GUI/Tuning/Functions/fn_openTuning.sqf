/*
	@File: fn_openTuning.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Opens the Tuning UI...
*/
#include "..\..\..\..\script_macros.hpp"
params [
  "", "", "",
  ["_params", [1, ""], [[]]]
];

if (count _params <= 0) exitWith {};

_params params [["_mode", 0, [0]],["_marker", "", [""]]];

if !(playerSide isEqualTo civilian) exitWith { NOTIFY("The Tuning Store is for civilians only!", "red") };

disableSerialization;

switch (_mode) do {
	case 1: {
		private _selection = lbData[2001,(lbCurSel 2001)];
	
		if (_selection isEqualTo "") exitWith { NOTIFY("You must select a vehicle to tune!", "red") };

		PHX_MyCar = (parseNumber(_selection));
		_selection = PHX_MyCars select PHX_MyCar;

		if !((count (_selection getVariable["dbInfo",[]])) > 0) exitWith { NOTIFY("Internal Error", "red") };

		private _class = typeOf _selection;

		closeDialog 0;

		private _colIndex = _selection getVariable "Life_VEH_color";

		[_class, _colIndex, 2100, "RscTuning"] call life_fnc_3dPreviewInit;

		waitUntil { !isNull (findDisplay 2100) };
		
		private _colors = M_CONFIG(getArray,"LifeCfgVehicles",_class,"textures");

		_ctrl = CONTROL(2100,2102);
		lbClear _ctrl;

		private _side = call {
			if (playerSide isEqualTo west) exitWith { ["cop"] };
			if (playerSide isEqualTo independent) exitWith { ["med"] };
			if (playerSide isEqualTo east) exitWith { ["havoc"] };
			["reb", "civ"];
		};

		private _textures = [];

		{
			if ((_x select 1) in _side && ((_selection getVariable "Life_VEH_color") != _forEachIndex)) then {

				private _toShow = [_x] call life_fnc_levelCheck;
				if (_toShow) then {
					_ctrl lbAdd (_x select 0);
					_ctrl lbSetData [(lbSize _ctrl)-1,"Preset"];
					_ctrl lbSetValue [(lbSize _ctrl)-1,_forEachIndex];

					_textures pushBack _x;
				};
			};
		} forEach _colors;
		
		// Paint Job....
		if (PHX_DonatorLevel > 0) then {
			_textures pushBack "CustomPaintJob";
			_ctrl lbAdd "Custom Paint Job (RGB)";
			_ctrl lbSetData [(lbSize _ctrl)-1,"Custom"];
			_ctrl lbSetValue [(lbSize _ctrl)-1,((count _textures) - 1)];

			{
				slidersetRange [_x,0,100];
				CONTROL(2100,_x) sliderSetSpeed [1,1,1];
			} forEach [2110,2111,2112];
		} else {
			{
				ctrlEnable [_x, false];
				CONTROL(2100, _x) ctrlSetTooltip "Donator Feature Only...";
			} forEach [2110,2111,2112];
		};

		if ((count _textures) <= 0) exitWith { NOTIFY("This vehicle has no textures to switch to..", "red"); closeDialog 0; };

		_ctrl lbSetCurSel 0;
	};

	default {
		if (_marker isEqualTo "") exitWith {};

		PHX_MyCars = ((nearestObjects [getMarkerPos _marker, ["Car", "Air", "Ship"], 30]) select {
			((_x getVariable ["vehicle_info_owners", []] param [0, []]) param [0, "-1"]) isEqualTo getPlayerUID player &&
			(count (_x getVariable ["vehicle_info_owners", []])) > 0
		});

		if ((count PHX_MyCars) <= 0) exitWith { NOTIFY("You have no vehicles near the tunning store!", "red"); closeDialog 0; };

		createDialog "RscTuningList";
		waitUntil { !isNull (findDisplay 2000) };

		private _vehList = CONTROL(2000, 2001);
		lbClear _vehList;

		{
			private _className = typeOf _x;

			_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
			_vehList lbAdd (_vehicleInfo select 3);
			_vehList lbSetPicture [(lbSize _vehList)-1,(_vehicleInfo select 2)];
			_vehList lbSetData [(lbSize _vehList)-1,str(_forEachIndex)];
		} forEach PHX_MyCars;
	};
};