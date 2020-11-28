class RscProcessing {
	idd = 5000;
	name = "RscProcessing";
  	onLoad = "";

    class ControlsBackground {
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
			x = safeZoneX + safeZoneW * 0.45375;
			y = safeZoneY + safeZoneH * 0.37;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.29333334;
        };

        class PageTitle : Life_RscText {
            idc = -1;
            moving = true;
            colorBackground[] = {0.09,0.09,0.09,1};
			x = safeZoneX + safeZoneW * 0.45375;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02222223;
            text = "Processing Menu";
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class Cost: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.456875;
			y = safeZoneY + safeZoneH * 0.61;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.02222223;
			text = "Cost:";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class CostBackground: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5075;
			y = safeZoneY + safeZoneH * 0.61;
			w = safeZoneW * 0.080625;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
    };

    class Controls {
        class ListBox : Life_RscListBox {
            idc = 5001;
			x = safeZoneX + safeZoneW * 0.456875;
			y = safeZoneY + safeZoneH * 0.37511112;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.233;
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			rowHeight = 0.05;
            onLBSelChanged = "_this call PHX_fnc_ProcessingLBChanged";
        };

        class PriceText : Life_RscStructuredText {
            idc = 5002;
            text = "<t size='0.8' font='RobotoCondensedLight'> Select an item above...</t>";
			x = safeZoneX + safeZoneW * 0.505625;
			y = safeZoneY + safeZoneH * 0.61222223;
			w = safeZoneW * 0.07625;
			h = safeZoneH * 0.01888889;
        };

		class ProcessButton : Life_RscButton {
			idc = 5003;
            x = safeZoneX + safeZoneW * 0.456875;
			y = safeZoneY + safeZoneH * 0.63555556;
			w = safeZoneW * 0.13125;
			h = safeZoneH * 0.02222223;
			text = "PROCESS";
            style = 2;
			onButtonClick = "[] spawn life_fnc_processAction";
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
			font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 35) * 1);
		};

		class CloseButton : Life_RscButtonMenuIcon {
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = safeZoneX + safeZoneW * 0.575625;
			y = safeZoneY + safeZoneH * 0.34777778;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
			tooltip = "Close";
			text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
		};
    };
};