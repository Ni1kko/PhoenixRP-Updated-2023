class RscMail {
	idd = 35000;
	name = "RscMail";
	
	class ControlsBackground {
		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.334062;
			y = safeZoneY + safeZoneH * 0.293778;
			w = safeZoneW * 0.340312;
			h = safeZoneH * 0.418;
			colorBackground[] = {0.2,0.2,0.2,1};
		};	

		class Title: Life_RscText {
			idc = 35001;
			x = safeZoneX + safeZoneW * 0.334062;
			y = safeZoneY + safeZoneH * 0.293778;
			w = safeZoneW * 0.340312;
			h = safeZoneH * 0.022;
			text = "Mail - Inbox";
			moving = true; // Allows it to be dragged around
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	};

	class Controls {

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.659844;
			y = safeZoneY + safeZoneH * 0.293778;
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

		class ListHeaderBackground: Life_RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.328124 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};

		class ListHeader: Life_RscListNBox {
			idc = 35002;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.328124 * safezoneW;
			h = 0.022 * safezoneH;
			text = "";	
			rowHeight = 0.04;
			sizeEx = 0.038;
			columns[] = {0,0.3,0.6};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;

			class Items {
				class From {
					text = "From";
					value = 0;
				};
				class Type {
					text = "Type";
					value = 0;
				};
				class Contents {
					text = "Contents";
					value = 0;
				};
			};
		};

		class ListBackground: Life_RscText
		{
			idc = -1;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.328124 * safezoneW;
			h = 0.33 * safezoneH;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class InboxList: Life_RscListNBox {
			idc = 35003;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.346 * safezoneH + safezoneY;
			w = 0.328124 * safezoneW;
			h = 0.33 * safezoneH;
			text = "";	
			rowHeight = 0.04;
			sizeEx = 0.038;
			columns[] = {0,0.3,0.6};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
		};
		
		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.334062;
			y = safeZoneY + safeZoneH * 0.684;
			w = safeZoneW * 0.340312;
			h = safeZoneH * 0.0277778;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
		};

		class Claim: Life_RscButton {
			idc = 35004;
			x = safeZoneX + safeZoneW * 0.597969;
			y = safeZoneY + safeZoneH * 0.69;
			w = safeZoneW * 0.0721875;
			h = safeZoneH * 0.018;
			style = 2;
			text = "CLAIM";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "call PHX_fnc_claimMail";
		};
	};
};