/*
	@File: fn_handleMarkers.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Creates or destroys our Markers Event Handler...
*/
#include "..\..\..\script_macros.hpp"
#define MAPDISPLAY ((findDisplay 12) displayCtrl 51)
#define MARKER (getText (configfile >> "CfgMarkers" >> "mil_triangle" >> "icon"))
#define INJUREDMARKER "pictureHeal"
params [["_isOn", false, [true]]];

if (isNil "PHX_MRK_EVT_INDX") then { PHX_MRK_EVT_INDX = -1 };

if (_isOn) then {
	MAPDISPLAY ctrlRemoveEventHandler ["Draw", PHX_MRK_EVT_INDX];
	PHX_MRK_EVT_INDX = -1;
} else {
	PHX_MRK_EVT_INDX = (MAPDISPLAY ctrlAddEventHandler ["Draw", {

		if !(player getVariable ["isAdmin", false]) exitWith { MAPDISPLAY ctrlRemoveEventHandler ["Draw", PHX_MRK_EVT_INDX] };
		
		{

          private _color = (switch (side _x) do {
            case east: {"colorOPFOR"};
            case west: {"colorBLUFOR"};
            case independent: {"colorIndependent"};
            default {"colorCivilian"};
          }) call PHX(colorConfigToRGBA);

          (_this # 0) drawIcon [([MARKER, INJUREDMARKER] select (isDowned(_x))), _color, visiblePosition _x, 26, 26, getDir _x, _x getVariable ["realname", name _x], 1, 0.043, "TahomaB", "right"];
          true
        } count (allPlayers - entities "HeadlessClient_F");
	}]);
};