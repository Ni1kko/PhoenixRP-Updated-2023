/*
	@File: fn_handleESP.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Creates or destroys our ESP Event Handler...
*/
#include "..\..\..\script_macros.hpp"
params [["_isOn", false, [true]]];

if (isNil "PHX_ESP_EVT_INDX") then { PHX_ESP_EVT_INDX = -1 };

if (_isOn) then {
	removeMissionEventHandler ["Draw3D", PHX_ESP_EVT_INDX];
	PHX_ESP_EVT_INDX = -1;
} else {
	PHX_ESP_EVT_INDX = addMissionEventHandler ["Draw3D", {

		if !(player getVariable ["isAdmin", false]) exitWith { removeMissionEventHandler ["Draw3D", PHX_ESP_EVT_INDX] };

		{
			private _color = switch (side _x) do {
				case west: {[0,0,0.5,1]};
				case east: {[0,0.6,0,1]};
				case independent: {[0,0.5,0,1]};
				default {[0,1,0,1]};
			};
			
			private _textPos = (_x modelToWorldVisual (_x selectionPosition "pilot")) vectorAdd [0, 0, 0.3];

			private _pos = getPosATL _x;
			if((getTerrainHeightASL [_pos select 0,_pos select 1]) < 0) then {
				_pos = getPosASL _x;
			};

			private _botLeft = _x modelToWorldVisual [-0.5,0,0];
			private _botRight = _x modelToWorldVisual [0.5,0,0];
			private _topLeft = _x modelToWorldVisual [-0.5,0,0];
			private _topRight = _x modelToWorldVisual [0.5,0,0];

			_botLeft set [2, _pos select 2];
			_botRight set [2, _pos select 2];
			_topLeft set [2, (_textPos # 2) + .1];
			_topRight set [2, (_textPos # 2) + .1];

			drawIcon3D ["", _color, _textPos, 0, 0, 0, format ["%1(%2m) %3HP", (_x getVariable "realname"), round (player distance _x), round ((damage _x - 1) * 100)], 1, 0.04, 'EtelkaNarrowMediumPro'];
			drawLine3D [_botLeft, _botRight, _color];
			drawLine3D [_botRight, _topRight, _color];
			drawLine3D [_topRight, _topLeft, _color];
			drawLine3D [_topLeft, _botLeft, _color];

		} count (playableUnits select {positionCameraToWorld [0,0,0] distance _x < 1000 && {isPlayer _x} && {!(getPlayerUID _x isEqualTo "")}});
	}];
};