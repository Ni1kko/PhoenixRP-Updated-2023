class shops_menu {
  idd = 2400;
  name= "shops_menu";
  movingEnable = 0;
  enableSimulation = 1;

	class ControlsBackground {
		class Background:Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.358125;
			y = safeZoneY + safeZoneH * 0.35;
			w = safeZoneW * 0.293125;
			h = safeZoneH * 0.34111112;
			colorBackground[] = {0.16,0.16,0.16,1};
		};

		class Shop_Inventory_Title:Life_RscText{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.363125;
			y = safeZoneY + safeZoneH * 0.35666667;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Shop Inventory";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

        class Top:Life_RscText {
			idc = 2403;
			x = safeZoneX + safeZoneW * 0.358125;
			y = safeZoneY + safeZoneH * 0.32777778;
			w = safeZoneW * 0.293125;
			h = safeZoneH * 0.02222223;
			style = 0;
			text = "Altis Market";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Your_Inventory_Title:Life_RscText{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.508125;
			y = safeZoneY + safeZoneH * 0.35666667;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Your Inventory";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	};

	class Controls {
		class Shop_Inventory:Life_RscListBox{
			idc = 2401;
			x = safeZoneX + safeZoneW * 0.363125;
			y = safeZoneY + safeZoneH * 0.38;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.23222223;
            color[] = {1, 1, 1, 0.45};
            colorActive[] = {1, 1, 1, 0.65};
			font = "RobotoCondensedLight";
    	    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Your_Inventory:Life_RscListBox {
			idc = 2402;
			x = safeZoneX + safeZoneW * 0.508125;
			y = safeZoneY + safeZoneH * 0.38;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.23222223;
            color[] = {1, 1, 1, 0.45};
            colorActive[] = {1, 1, 1, 0.65};
			font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onLBDblClick = "[2402,2405] call PHX_fnc_setEdit;";
		};

		class Shop_Inventory_Input:Life_RscEdit{
			idc = 2404;
			x = safeZoneX + safeZoneW * 0.3625;
			y = safeZoneY + safeZoneH * 0.61555556;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02;
			style = 0;
			text = "1";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorDisabled[] = {1,1,1,1};
			colorSelection[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Your_Inventory_Input:Life_RscEdit {
			idc = 2405;
			x = safeZoneX + safeZoneW * 0.5075;
			y = safeZoneY + safeZoneH * 0.61555556;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02;
			style = 0;
			text = "1";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorDisabled[] = {1,1,1,1};
			colorSelection[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Sell_Item:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5075;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02;
			style = 2;
			text = "SELL ITEM";
			onButtonClick = "[false] call life_fnc_virt_sell";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Buy_Item:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3625;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02;
			style = 2;
			text = "BUY ITEM";
			onButtonClick = "[false] spawn life_fnc_virt_buy;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Buy_Item5:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.3625;
			y = safeZoneY + safeZoneH * 0.66222223;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "BUY X5";
			onButtonClick = "[true] spawn life_fnc_virt_buy;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	
		class Sell_Item5:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.5075;
			y = safeZoneY + safeZoneH * 0.66222223;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "SELL X5";
			onButtonClick = "[true] spawn life_fnc_virt_sell;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};	

		class Close:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.635625;
			y = safeZoneY + safeZoneH * 0.32777778;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            tooltip = "Close";
			onButtonClick = "closeDialog 0;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
	};
};
