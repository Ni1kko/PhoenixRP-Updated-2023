class RscTransactions {
    idd = 21000;
    name = "RscTransactions";
    movingEnable = 0;
    enableSimulation = 1;
	
	class ControlsBackground {
		class Top: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.32222223;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02222223;
			text = "Transactions";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.34375;
			y = safeZoneY + safeZoneH * 0.34333334;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.31555556;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class ListBoxHeaderBackground: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.348125;
			y = safeZoneY + safeZoneH * 0.35111112;
			w = safeZoneW * 0.290625;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0,0,0,1};
		};

		class ListboxBackground: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.348125;
			y = safeZoneY + safeZoneH * 0.37333334;
			w = safeZoneW * 0.290625;
			h = safeZoneH * 0.27777778;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};

	class Controls {
		class ListBoxHeader: Life_RscListNBox {
			idc = 21001;
			x = safeZoneX + safeZoneW * 0.348125;
			y = safeZoneY + safeZoneH * 0.35111112;
			w = safeZoneW * 0.290625;
			h = safeZoneH * 0.02222223;
			text = "";	
			font = "RobotoCondensedLight";
			rowHeight = 0.04;
			columns[] = {0,0.45,0.6,0.8};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);

			class Items {
				class Transaction {
					text = "Transaction";
					value = 0;
				};
				class From {
					text = "From";
					value = 0;
				};
				class In {
					text = "In";
					value = 0;
				};
				class Out {
					text = "Out";
					value = 0;
				};
			};
		};

		class Listbox: Life_RscListNBox {
			idc = 21002;
			x = safeZoneX + safeZoneW * 0.348125;
			y = safeZoneY + safeZoneH * 0.37333334;
			w = safeZoneW * 0.290625;
			h = safeZoneH * 0.27777778;
			text = "";	
			rowHeight = 0.04;
			columns[] = {0,0.45,0.6,0.8};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.628125;
			y = safeZoneY + safeZoneH * 0.32222223;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02111112;
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
