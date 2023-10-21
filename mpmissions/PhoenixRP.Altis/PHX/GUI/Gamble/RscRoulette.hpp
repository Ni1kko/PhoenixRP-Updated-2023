class RscRoulette {
	idd = 15000;
    movingEnabled = false;
    enableSimulation = true;
    name = "RscRoulette";
	onLoad = "['RscRoulette',15000] spawn PHX_fnc_guiHandler";
	
	class ControlsBackground {
		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.366875;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.273125;
			h = safeZoneH * 0.18777778;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Title: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.366875;
			y = safeZoneY + safeZoneH * 0.35888889;
			w = safeZoneW * 0.273125;
			h = safeZoneH * 0.02222223;
			text = "Roulette";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.366875;
			y = safeZoneY + safeZoneH * 0.56888889;
			w = safeZoneW * 0.273125;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};
	
	class Controls {
		class RscText_1005: PHXEdit {
			idc = 15001;
			x = safeZoneX + safeZoneW * 0.37;
			y = safeZoneY + safeZoneH * 0.57222223;
			w = safeZoneW * 0.245;
			h = safeZoneH * 0.02222223;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorDisabled[] = {0.16,0.16,0.16,1};
			colorSelection[] = {0.16,0.16,0.16,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class RscText_1006: Life_RscButton {
			idc = 15002;
			x = safeZoneX + safeZoneW * 0.62;
			y = safeZoneY + safeZoneH * 0.57222223;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DENTutorial\pictureCompleted_ca.paa";
            onButtonClick = "[] spawn PHX_fnc_rouletteBet";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
		};

		class EXIT_BTN: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.624375;
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

		class TABLE: Life_RscPictureKeepAspect {
			idc = 15005;
			x = safeZoneX + safeZoneW * 0.41;
			y = safeZoneY + safeZoneH * 0.41;
			w = safeZoneH * 0.17;
			h = safeZoneH * 0.17;
			text = "data\gamble\roulette\roulette.paa";
		};

		class POINTER: Life_RscPictureKeepAspect {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.455;
			y = safeZoneY + safeZoneH * 0.38;
			w = safeZoneH * 0.05;
			h = safeZoneH * 0.05;
			text = "data\gamble\roulette\pointer.paa";
		};		
		
		class RED: Life_RscActiveText {
			idc = 15006;
			x = safeZoneX + safeZoneW * 0.5725;
			y = safeZoneY + safeZoneH * 0.39;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.05;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			onButtonClick = "[1] spawn PHX_fnc_rouletteSpin;";
			text = "data\gamble\roulette\red.paa";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class GREEN: Life_RscActiveText {
			idc = 15007;
			x = safeZoneX + safeZoneW * 0.5725;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.05;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			onButtonClick = "[3] spawn PHX_fnc_rouletteSpin;";
			text = "data\gamble\roulette\green.paa";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};		

		class BLACK: Life_RscActiveText {
			idc = 15008;
			x = safeZoneX + safeZoneW * 0.5725;
			y = safeZoneY + safeZoneH * 0.51;
			w = safeZoneW * 0.05;
			h = safeZoneH * 0.05;
			style = 2 + ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			onButtonClick = "[2] spawn PHX_fnc_rouletteSpin;";
			text = "data\gamble\roulette\black.paa";
		};        
	};
};
