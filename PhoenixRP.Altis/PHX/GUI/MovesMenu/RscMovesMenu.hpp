class RscMovesMenu {
	idd = 2900;
	name = "RscMovesMenu";
  	onLoad = "[] spawn PHX_fnc_movesMenu;";

    class ControlsBackground{
        class Background:Life_RscText {
            idc = -1;
			x = safeZoneX + safeZoneW * 0.460625;
			y = safeZoneY + safeZoneH * 0.35111112;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.29111112;
            colorBackground[] = {0.16,0.16,0.16,1};
        };

        class Title:Life_RscText {
            idc = 2901;
			x = safeZoneX + safeZoneW * 0.460625;
			y = safeZoneY + safeZoneH * 0.33;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.02222223;
            text = "Moves Menu";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {1,1,1,1};
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };
    class Controls {
        class ListBox:Life_RscListBox {
            idc = 2902;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.35666667;
			w = safeZoneW * 0.125625;
			h = safeZoneH * 0.25777778;
            text = "";
            style = 2;
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {1,1,1,1};
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class Perform:Life_RscButton{
            idc = -1;
			onButtonClick = "_move = lbData[2902,lbCurSel (2902)];_move = call compile format[""%1"", _move]; player playMove _move; closeDialog 0;";
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.61666667;
			w = safeZoneW * 0.125625;
			h = safeZoneH * 0.022;
            style = 2;
            text = "PERFORM";
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class Close:Life_RscButton{
            idc = -1;
			x = safeZoneX + safeZoneW * 0.575625;
			y = safeZoneY + safeZoneH * 0.33;
			w = safeZoneW * 0.01625;
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
