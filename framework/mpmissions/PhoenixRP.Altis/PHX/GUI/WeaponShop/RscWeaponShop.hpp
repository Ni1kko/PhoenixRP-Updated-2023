class RscWeaponShop {
	idd = 7400;
	name = "RscWeaponShop";
	
	class ControlsBackground {
		class Title: Life_RscText {
			idc = 7401;
			x = safeZoneX + safeZoneW * 0.336875;
			y = safeZoneY + safeZoneH * 0.31555556;
			w = safeZoneW * 0.3375;
			h = safeZoneH * 0.02222223;
			text = "Gun Store";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.336875;
			y = safeZoneY + safeZoneH * 0.33777778;
			w = safeZoneW * 0.3375;
			h = safeZoneH * 0.28111112;
			colorBackground[] = {0.2,0.2,0.2,1};
		};	
	};

	class Controls {
		class TabWeapons: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.336875;
			y = safeZoneY + safeZoneH * 0.34111112;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Weapons";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) /30) * 1);
			onButtonClick = "[""weps""] call PHX_fnc_changeWeaponSelection";
		};

		class TabMagazines: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.42125;
			y = safeZoneY + safeZoneH * 0.34111112;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Magazines";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) /30) * 1);
			onButtonClick = "[""mags""] call PHX_fnc_changeWeaponSelection";
		};

		class TabAttachments: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.505625;
			y = safeZoneY + safeZoneH * 0.34111112;
			w = safeZoneW * 0.08375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Attachments";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) /30) * 1);
			onButtonClick = "[""accs""] call PHX_fnc_changeWeaponSelection";
		};

		class TabOther: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.59;
			y = safeZoneY + safeZoneH * 0.34111112;
			w = safeZoneW * 0.084375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Other";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) /30) * 1);
			onButtonClick = "[""items""] call PHX_fnc_changeWeaponSelection";
		};

		class Search: PHXEdit {
			idc = 7402;
			x = safeZoneX + safeZoneW * 0.33875;
			y = safeZoneY + safeZoneH * 0.36666667;
			w = safeZoneW * 0.19125;
			h = safeZoneH * 0.02222223;
			text = "";
      		colorBackground[] = {0.102,0.102,0.102,1};
    		colorDisabled[] = {0.2,0.2,0.2,1};
      		colorSelection[] = {0.902,0.902,0.902,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class SearchButton: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.530625;
			y = safeZoneY + safeZoneH * 0.36666667;
			w = safeZoneW * 0.0125;
			h = safeZoneH * 0.02222223;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			onButtonClick = "";
			text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
			tooltip = "Search";
			colorBackground[] = {0,0,0,1};
		};

		class WeaponList: PHX_RscTree {
			idc = 7403;
			x = safeZoneX + safeZoneW * 0.33875;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.204375;
			h = safeZoneH * 0.22333334;
			style = 0;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 27) * 1);
			idcSearch = 7402;
		};

		class Cart: Life_RscListBox {
			idc = 7404;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.12875;
			h = safeZoneH * 0.22333334;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 27) * 1);
		};
		
		class CartnTotal: Life_RscText {
			idc = 7405;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.36666667;
			w = safeZoneW * 0.12875;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Total: £0";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.65875;
			y = safeZoneY + safeZoneH * 0.31555556;
			w = safeZoneW * 0.015;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.336875;
			y = safeZoneY + safeZoneH * 0.61888889;
			w = safeZoneW * 0.3375;
			h = safeZoneH * 0.02777778;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};

		class AddToCart: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.33875;
			y = safeZoneY + safeZoneH * 0.62111112;
			w = safeZoneW * 0.204375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "ADD TO CART";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "call PHX_fnc_addToCart";
		};

		class Purchase: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.54375;
			y = safeZoneY + safeZoneH * 0.62111112;
			w = safeZoneW * 0.12875;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "PURCHASE";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "call PHX_fnc_checkOut";
		};
	};
};