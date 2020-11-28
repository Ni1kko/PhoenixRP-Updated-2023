class RscPlaceables {
 idd = 20000;
 name = "RscPlaceables";
 movingEnable = false;
 enableSimulation = true;
 onLoad = "";

class ControlsBackground {
        class Background:Life_RscText{
            idc = -1;
			x = safeZoneX + safeZoneW * 0.389375;
			y = safeZoneY + safeZoneH * 0.38222223;
			w = safeZoneW * 0.24125;
			h = safeZoneH * 0.22;
            colorBackground[] = {0.16,0.16,0.16,1};
        };
		
        class Top:Life_RscTitle{
            idc = -1;
			x = safeZoneX + safeZoneW * 0.389375;
			y = safeZoneY + safeZoneH * 0.36;
			w = safeZoneW * 0.24125;
			h = safeZoneH * 0.02222223;
            style = 0;
            text = "Placeables";
            colorBackground[] = {0.09,0.09,0.09,1};
            colorText[] = {1,1,1,1};
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

		class Use:Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.394375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Placeables To Use";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Used:Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5125;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Placeables Used";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Footer:Life_RscText{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.389375;
			y = safeZoneY + safeZoneH * 0.60222223;
			w = safeZoneW * 0.24125;
			h = safeZoneH * 0.032;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
    };

	 class controls {
        class Placeables:Life_RscListBox{
            idc = 20001;
			x = safeZoneX + safeZoneW * 0.394375;
			y = safeZoneY + safeZoneH * 0.41444445;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.17777778;
            color[] = {1, 1, 1, 0.45};
      		colorActive[] = {1, 1, 1, 0.65};
			font = "RobotoCondensedLight";
    	    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			text = "";
        };

        class PlaceablesUsed:Life_RscListBox{
            idc = 20005;
			x = safeZoneX + safeZoneW * 0.5125;
			y = safeZoneY + safeZoneH * 0.41444445;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.17777778;
            color[] = {1, 1, 1, 0.45};
      		colorActive[] = {1, 1, 1, 0.65};
			font = "RobotoCondensedLight";
    	    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			text = "";
        };

        class CLOSE:Life_RscButton{
            idc = -1;
			x = safeZoneX + safeZoneW * 0.614375;
			y = safeZoneY + safeZoneH * 0.36;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class RemoveAll:Life_RscButton{
            idc = 20002;
			x = safeZoneX + safeZoneW * 0.553125;
			y = safeZoneY + safeZoneH * 0.60666667;
			w = safeZoneW * 0.075;
			h = safeZoneH * 0.02222223;
            style = 2;
            text = "REMOVE ALL";
			onButtonClick = "closeDialog 0; [] call PHX_fnc_placeablesRemoveAll";
            borderSize = 0;
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) /30) * 1);
        };

        class Place:Life_RscButton{
            idc = 20003;
			x = safeZoneX + safeZoneW * 0.3925;
			y = safeZoneY + safeZoneH * 0.60666667;
			w = safeZoneW * 0.075;
			h = safeZoneH * 0.02222223;
            style = 2;
            text = "PLACE";
			onButtonClick = "[false] spawn PHX_fnc_placeablePlace;";
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class Remove:Life_RscButton{
            idc = 20004;
			x = safeZoneX + safeZoneW * 0.473125;
			y = safeZoneY + safeZoneH * 0.60666667;
			w = safeZoneW * 0.075;
			h = safeZoneH * 0.02222223;
            style = 2;
            text = "REMOVE";
			onButtonClick = "closeDialog 0; [] call PHX_fnc_placeableDelete;";
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) /30) * 1);
        };
	};
};