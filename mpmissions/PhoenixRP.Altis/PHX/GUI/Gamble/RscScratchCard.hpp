class RscScratchCard {
	idd = 17000;
    movingEnabled = false;
    enableSimulation = true;
    name = "RscScratchCard";
	onLoad = "['RscScratchCard',17000] spawn PHX_fnc_guiHandler;";

	class ControlsBackground {
		class Background: Life_RscPicture {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.350625;
			y = safeZoneY + safeZoneH * 0.34666667;
			w = safeZoneW * 0.33;
			h = safeZoneH * 0.30555556;
			text = "data\gamble\scratchcard\scratchcard.paa";
		};
	};

	class Controls {
		class S1:Life_RscActiveText {
			idc = 17001;
			x = safeZoneX + safeZoneW * 0.505625;
			y = safeZoneY + safeZoneH * 0.42511112;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[1] spawn PHX_fnc_scratchCard;";
		};

		class S2:Life_RscActiveText {
			idc = 17002;
			x = safeZoneX + safeZoneW * 0.545625;
			y = safeZoneY + safeZoneH * 0.42511112;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[2] spawn PHX_fnc_scratchCard;";
		};

		class S3:Life_RscActiveText {
			idc = 17003;
			x = safeZoneX + safeZoneW * 0.585625;
			y = safeZoneY + safeZoneH * 0.42511112;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[3] spawn PHX_fnc_scratchCard;";
		};

		class S4:Life_RscActiveText {
			idc = 17004;
			x = safeZoneX + safeZoneW * 0.505625;
			y = safeZoneY + safeZoneH * 0.47944445;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[4] spawn PHX_fnc_scratchCard;";
		};

		class S5:Life_RscActiveText {
			idc = 17005;
			x = safeZoneX + safeZoneW * 0.545625;
			y = safeZoneY + safeZoneH * 0.47944445;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[5] spawn PHX_fnc_scratchCard;";
		};

		class S6:Life_RscActiveText {
			idc = 17006;
			x = safeZoneX + safeZoneW * 0.585625;
			y = safeZoneY + safeZoneH * 0.47944445;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[6] spawn PHX_fnc_scratchCard;";
		};

		class S7:Life_RscActiveText {
			idc = 17007;
			x = safeZoneX + safeZoneW * 0.505625;
			y = safeZoneY + safeZoneH * 0.53277778;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[7] spawn PHX_fnc_scratchCard;";
		};

		class S8:Life_RscActiveText {
			idc = 17008;
			x = safeZoneX + safeZoneW * 0.545625;
			y = safeZoneY + safeZoneH * 0.53277778;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[8] spawn PHX_fnc_scratchCard;";
		};

		class S9:Life_RscActiveText {
			idc = 17009;
			x = safeZoneX + safeZoneW * 0.585625;
			y = safeZoneY + safeZoneH * 0.53277778;
			w = safeZoneW * 0.04;
			h = safeZoneH * 0.04;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[9] spawn PHX_fnc_scratchCard;";
		};

		class Bonus:Life_RscActiveText {
			idc = 17010;
			x = safeZoneX + safeZoneW * 0.4635;
			y = safeZoneY + safeZoneH * 0.555;
			w = safeZoneW * 0.045;
			h = safeZoneH * 0.045;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			text = "data\gamble\scratchcard\default.paa";
			onButtonClick = "[] spawn PHX_fnc_scratchcardBonus;";
		};

		class CLOSE:Life_RscButton { 
			idc = -1;
			x = safeZoneX + safeZoneW * 0.63;
			y = safeZoneY + safeZoneH * 0.34;
			w = safeZoneW * 0.020625;
			h = safeZoneH * 0.03666667;
			text = "X";
			onButtonClick = "closeDialog 0;";
			colorText[] = {0,0,0,1};
			colorBackgroundFocused[] = {1,1,1,0};
    		colorBackground2[] = {0.75,0.75,0.75,0};
   			colorFocused[] = {0,0,0,0};
			colorBackgroundActive[] = {0,0,0,0};
    		color[] = {0,0,0,0};
			color2[] = {0,0,0,0};
    		colorDisabled[] = {1,1,1,0};
			colorBackground[] = {0,0,0,0};
		};		
	};
};
