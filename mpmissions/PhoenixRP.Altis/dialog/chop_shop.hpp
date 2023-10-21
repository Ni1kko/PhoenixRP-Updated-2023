class Chop_Shop {
    idd = 39400;
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Background: Life_RscText {
            idc = -1;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.28333334;
			colorBackground[] = {0.2,0.2,0.2,1};
        };

        class Title: Life_RscText {
            idc = -1;
			x = safeZoneX + safeZoneW * 0.44375;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02222223;
			text = "Chop Shop";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
            moving = true;
        };

		class Price: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.4475;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.0525;
			h = safeZoneH * 0.02222223;
			text = "Price:";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			
		};

		class Price2: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.50125;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.07625;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

        class priceInfo: Life_RscStructuredText {
            idc = 39401;
            text = "";
			x = safeZoneX + safeZoneW * 0.50125;
			y = safeZoneY + safeZoneH * 0.54777778;
			w = safeZoneW * 0.075625;
			h = safeZoneH * 0.01777778;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };

    class controls {
        class vehicleList: Life_RscListBox {
            idc = 39402;
            onLBSelChanged = "_this call life_fnc_chopShopSelection";
			x = safeZoneX + safeZoneW * 0.4475;
			y = safeZoneY + safeZoneH * 0.32555556;
			w = safeZoneW * 0.13;
			h = safeZoneH * 0.22111112;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class BtnSell: Life_RscButton {
            idc = -1;
            onButtonclick = "[] spawn life_fnc_chopShopSell;";
			x = safeZoneX + safeZoneW * 0.4475;
			y = safeZoneY + safeZoneH * 0.57444445;
			w = safeZoneW * 0.13;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "SELL";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class BtnClose: Life_RscButton {
            idc = -1;
            onButtonClick = "closeDialog 0";
			x = safeZoneX + safeZoneW * 0.565625;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            tooltip = "Close";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };
    };
};