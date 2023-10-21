class RscVehicleUpgradesList {
	idd = 32000;
	name = "RscVehicleUpgradesList";
  	onLoad = "";

    class ControlsBackground {
        class Background: Life_RscBackground {
            idc = -1;
			x = safeZoneX + safeZoneW * 0.460625;
			y = safeZoneY + safeZoneH * 0.35111112;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.29111112;
            colorBackground[] = {0.16,0.16,0.16,1};
        };

        class Header : Life_RscBackground {
			x = safeZoneX + safeZoneW * 0.460625;
			y = safeZoneY + safeZoneH * 0.33;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.02222223;
            text = "Select Vehicle";
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {1,1,1,1};
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };
    class Controls{
        class ListBox:PHXListbox{
            idc = 32001;
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.35666667;
			w = safeZoneW * 0.125625;
			h = safeZoneH * 0.25777778;
            text = "";
            rowHeight = 0.05;
            colorBackground[] = {0.102,0.102,0.102,1};
            colorText[] = {1,1,1,1};
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class Perform:Life_RscButton {
            idc = -1;
			onButtonClick = "PHX_Upgrade = (PHX_MyCars select (lbCurSel 32001)); closeDialog 0; createDialog 'RscVehicleUpgrades'";
			x = safeZoneX + safeZoneW * 0.46375;
			y = safeZoneY + safeZoneH * 0.61666667;
			w = safeZoneW * 0.125625;
			h = safeZoneH * 0.022;
            style = 2;
            text = "SELECT";
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
