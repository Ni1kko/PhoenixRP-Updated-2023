class RscWatchlist {
    idd = 36000;
    name = "RscWatchlist";
    movingEnable = 0;
    enableSimulation = 1;
	
	class ControlsBackground {
		class Top: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3825;
			y = safeZoneY + safeZoneH * 0.35888889;
			w = safeZoneW * 0.2375;
			h = safeZoneH * 0.02222223;
			text = "Watch List";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3825;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.2375;
			h = safeZoneH * 0.21777778;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
	};

	class Controls {
		class Listbox: Life_RscListBox {
			idc = 36001;
			x = safeZoneX + safeZoneW * 0.38625;
			y = safeZoneY + safeZoneH * 0.38555556;
			w = safeZoneW * 0.23;
			h = safeZoneH * 0.20555556;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onLBDblClick = "[] call PHX_fnc_removeWatchList;";
		};

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.605;
			y = safeZoneY + safeZoneH * 0.35888889;
			w = safeZoneW * 0.014375;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
	};
};
