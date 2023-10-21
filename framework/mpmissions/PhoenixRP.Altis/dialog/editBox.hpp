class editBox {
	idd = 22000;
    movingEnabled = false;
    enableSimulation = true;
    name = "editBox";

	class ControlsBackground {
		class Top: Life_RscText {
			idc = 22001;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.40444445;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.02222223;
			text = "";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			moving = true;
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.42666667;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.05777778;
			colorBackground[] = {0.2,0.2,0.2,1};
		};	

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.48444445;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.028;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};
	
	class Controls {
		class Edit: Life_RscEdit {
			idc = 22002;
			x = safeZoneX + safeZoneW * 0.45375;
			y = safeZoneY + safeZoneH * 0.44555556;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
            colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {0.902,0.902,0.902,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			text = "";
		};

		class OK: Life_RscButton {
			idc = 22003;
			x = safeZoneX + safeZoneW * 0.465;
			y = safeZoneY + safeZoneH * 0.48777778;
			w = safeZoneW * 0.06;
			h = safeZoneH * 0.02;
			style = 2;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class CANCEL: Life_RscButton {
			idc = 22004;
			x = safeZoneX + safeZoneW * 0.5275;
			y = safeZoneY + safeZoneH * 0.48777778;
			w = safeZoneW * 0.06;
			h = safeZoneH * 0.02;
			style = 2;
			text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	};
};
