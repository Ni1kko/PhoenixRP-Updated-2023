class RscHigherOrLower {
	idd = 13000;
    movingEnabled = false;
    enableSimulation = true;
    name = "RscHigherOrLower";
	onLoad = "['RscHigherOrLower',13000] spawn PHX_fnc_guiHandler";
	
	class ControlsBackground {
		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.366875;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.273125;
			h = safeZoneH * 0.23666667;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Title: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.366875;
			y = safeZoneY + safeZoneH * 0.35888889;
			w = safeZoneW * 0.273125;
			h = safeZoneH * 0.02222223;
			text = "Higher Or Lower";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.366875;
			y = safeZoneY + safeZoneH * 0.61777778;
			w = safeZoneW * 0.273125;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};
	
	class Controls {
		class RscText_1005: PHXEdit {
			idc = 13001;
			x = safeZoneX + safeZoneW * 0.37;
			y = safeZoneY + safeZoneH * 0.62111112;
			w = safeZoneW * 0.245;
			h = safeZoneH * 0.02222223;
			text = "";
			colorBackground[] =  {0,0,0,1};
			colorDisabled[] = {0.16,0.16,0.16,1};
			colorSelection[] = {0.16,0.16,0.16,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class RscText_1006: Life_RscButton {
			idc = 13002;
			x = safeZoneX + safeZoneW * 0.62;
			y = safeZoneY + safeZoneH * 0.62111112;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DENTutorial\pictureCompleted_ca.paa";
            onButtonClick = "[] spawn PHX_fnc_higherLower";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
		};

		class EXIT_BTN: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.62375;
			y = safeZoneY + safeZoneH * 0.35888889;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            onButtonClick = "closeDialog 0; life_action_inUse = false;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class S1: Life_RscPictureKeepAspect {
			idc = 13005;
			x = safeZoneX + safeZoneW * 0.349375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S2: Life_RscPictureKeepAspect {
			idc = 13006;
			x = safeZoneX + safeZoneW * 0.394375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S3: Life_RscPictureKeepAspect {
			idc = 13007;
			x = safeZoneX + safeZoneW * 0.439375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S4: Life_RscPictureKeepAspect {	
			idc = 13008;
			x = safeZoneX + safeZoneW * 0.484375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S5: Life_RscPictureKeepAspect {
			idc = 13009;
			x = safeZoneX + safeZoneW * 0.529375;
			y = safeZoneY + safeZoneH * 0.39111112;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S6: Life_RscPictureKeepAspect {
			idc = 13010;
			x = safeZoneX + safeZoneW * 0.349375;
			y = safeZoneY + safeZoneH * 0.50333334;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S7: Life_RscPictureKeepAspect {
			idc = 13011;
			x = safeZoneX + safeZoneW * 0.394375;
			y = safeZoneY + safeZoneH * 0.50333334;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S8: Life_RscPictureKeepAspect {
			idc = 13012;
			x = safeZoneX + safeZoneW * 0.439375;
			y = safeZoneY + safeZoneH * 0.50333334;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S9: Life_RscPictureKeepAspect {
			idc = 13013;
			x = safeZoneX + safeZoneW * 0.484375;
			y = safeZoneY + safeZoneH * 0.50333334;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class S10: Life_RscPictureKeepAspect {
			idc = 13014;
			x = safeZoneX + safeZoneW * 0.529375;
			y = safeZoneY + safeZoneH * 0.50333334;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.11;
			text = "";
		};

		class Higher: Life_RscActiveText {
			idc = 13015;
			x = safeZoneX + safeZoneW * 0.60125;
			y = safeZoneY + safeZoneH * 0.41888889;
			w = safeZoneW * 0.035;
			h = safeZoneH * 0.04888889;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			onButtonClick = "[] spawn PHX_fnc_higherBet;";
			text = "data\gamble\higherlower\up.paa";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class Lower: Life_RscActiveText {
			idc = 13016;
			x = safeZoneX + safeZoneW * 0.60125;
			y = safeZoneY + safeZoneH * 0.53111112;
			w = safeZoneW * 0.035;
			h = safeZoneH * 0.04888889;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			onButtonClick = "[] spawn PHX_fnc_lowerBet;";
			text = "data\gamble\higherlower\lower.paa";
		};

		class Cashout: Life_RscButton {
			idc = 13017;
			x = safeZoneX + safeZoneW * 0.60125;
			y = safeZoneY + safeZoneH * 0.58444445;
			w = safeZoneW * 0.029375;
			h = safeZoneH * 0.02444445;
			style = 2;
			text = "CASHOUT";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			onButtonClick = "[] spawn PHX_fnc_higherLowerCashout; closeDialog 0;";
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	};
};
