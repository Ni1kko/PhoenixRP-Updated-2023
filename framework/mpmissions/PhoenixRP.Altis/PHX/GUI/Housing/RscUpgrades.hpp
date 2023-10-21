class RscUpgrades {
    idd = 12000;
    name = "RscUpgrades";
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "['onLoad'] spawn PHX_fnc_openUpgrades;";
	
	class ControlsBackground {
		class Top: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.02222223;
			text = "House Upgrades";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.32222223;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.31555556;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Bottom: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.63777778;
			w = safeZoneW * 0.3125;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class DescBack: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.49;
			y = safeZoneY + safeZoneH * 0.32888889;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.30333334;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};

	class Controls {
		class Listbox: Life_RscListBox {
			idc = 12001;
			x = safeZoneX + safeZoneW * 0.34625;
			y = safeZoneY + safeZoneH * 0.32888889;
			w = safeZoneW * 0.140625;
			h = safeZoneH * 0.30333334;
            colorBackground[] = {0.102,0.102,0.102,1};
      		colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onLBSelChanged = "['lbChange'] call PHX_fnc_openUpgrades";
		};

		class Desc: Life_RscStructuredText {
			idc = 12002;
			x = safeZoneX + safeZoneW * 0.49125;
			y = safeZoneY + safeZoneH * 0.33333334;
			w = safeZoneW * 0.159375;
			h = safeZoneH * 0.30222223;
			text = "";
		};

		class Upgrade: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.49;
			y = safeZoneY + safeZoneH * 0.64111112;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "UPGRADE";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "[cursorObject] spawn PHX_fnc_purchaseHouseUpgrade";
		};

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.641875;
			y = safeZoneY + safeZoneH * 0.3;
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
