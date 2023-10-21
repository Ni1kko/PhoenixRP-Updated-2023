class Life_Vehicle_Shop_v2_3D {
    idd = 2300;
    name = "life_vehicle_shop";
    movingEnable = 0;
    enableSimulation = 1;

	class ControlsBackground {
		class Top: Life_RscText {
			idc = 2301;
			x = safeZoneX + safeZoneW * 0.375625;
			y = safeZoneY + safeZoneH * 0.31222223;
			w = safeZoneW * 0.258125;
			h = safeZoneH * 0.02222223;
			text = "Vehicle Shop";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Background_Left: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.375625;
			y = safeZoneY + safeZoneH * 0.33444445;
			w = safeZoneW * 0.258125;
			h = safeZoneH * 0.30222223;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Textbackground: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5075;
			y = safeZoneY + safeZoneH * 0.33777778;
			w = safeZoneW * 0.12375;
			h = safeZoneH * 0.24444445;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.375625;
			y = safeZoneY + safeZoneH * 0.636;
			w = safeZoneW * 0.258125;
			h = safeZoneH * 0.02777778;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};

	class Controls {
		class List_Of_Cars: Life_RscListBox {
			idc = 2302;
			x = safeZoneX + safeZoneW * 0.37875;
			y = safeZoneY + safeZoneH * 0.33777778;
			w = safeZoneW * 0.1275;
			h = safeZoneH * 0.26888889;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onLBSelChanged = "_this call life_fnc_vehicleShopLBChange";
		};

		class Drop_Down: PHXCombos {
			idc = 2304;
			x = safeZoneX + safeZoneW * 0.37875;
			y = safeZoneY + safeZoneH * 0.60888889;
			w = safeZoneW * 0.2525;
			h = safeZoneH * 0.02222223;
			colorBackgroundActive[] = {0.721, 0, 0, 1};
            colorFocused[] = {0.09, 0.09, 0.09, 1};
            colorText[] = {0.8,0.8,0.8,1};
            colorBackground[] = {0,0,0,1};
            colorBackgroundDisabled[] = {0,0,0,1};
            font = "RobotoCondensedLight";
            maxHistoryDelay = 0;
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
            wholeHeight = 0.3;
            class ComboScrollBar : Life_RscScrollBar{};
        };

		class Rent: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.4625;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "RENT";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "[false] spawn life_fnc_vehicleShopBuy;";
		};

		class Buy: Life_RscButton {
			idc = 2309;
			x = safeZoneX + safeZoneW * 0.3775;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.0835;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "BUY";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "[true] spawn life_fnc_vehicleShopBuy;";
		};

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.618125;
			y = safeZoneY + safeZoneH * 0.31222223;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            tooltip = "Close";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
			onButtonClick = "closeDialog 0;";
		};

		class Text: Life_RscStructuredText {
			idc = 2303;
			x = safeZoneX + safeZoneW * 0.506;
			y = safeZoneY + safeZoneH * 0.339;
			w = safeZoneW * 0.125;
			h = safeZoneH * 0.24444445;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
		};

		class Preview: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5475;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.084375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "PREVIEW";
			colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
            onButtonClick = "[(lbData[2302,(lbCurSel 2302)]), lbValue[2304,(lbCurSel 2304)]] call life_fnc_3dPreviewInit;";
		};

		class Edit: PHXEdit {
			idc = 2306;
			x = safeZoneX + safeZoneW * 0.5075;
			y = safeZoneY + safeZoneH * 0.58333334;
			w = safeZoneW * 0.12375;
			h = safeZoneH * 0.02333334;
			text = "Enter plate number...";
      		colorBackground[] = {0.102,0.102,0.102,1};
    		colorDisabled[] = {0.2,0.2,0.2,1};
      		colorSelection[] = {0.902,0.902,0.902,1};
    		colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			toolTip = "Enter custom number plate";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	};
};