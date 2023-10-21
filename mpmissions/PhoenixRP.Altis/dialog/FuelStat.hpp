class Life_FuelStat {
    idd = 20300;
    name = "life_fuelStat";
    movingEnabled = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2330,false];";

	class ControlsBackground {
		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.383125;
			y = safeZoneY + safeZoneH * 0.35777778;
			w = safeZoneW * 0.26875;
			h = safeZoneH * 0.25111112;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Top: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.383125;
			y = safeZoneY + safeZoneH * 0.33555556;
			w = safeZoneW * 0.26875;
			h = safeZoneH * 0.02222223;
			text = "Fuel Station";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Vehicles: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.38625;
			y = safeZoneY + safeZoneH * 0.36111112;
			w = safeZoneW * 0.126875;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Vehicles";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Information: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.520625;
			y = safeZoneY + safeZoneH * 0.36111112;
			w = safeZoneW * 0.126875;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "Information";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Backgroundstu: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.520625;
			y = safeZoneY + safeZoneH * 0.38444445;
			w = safeZoneW * 0.126875;
			h = safeZoneH * 0.21888889;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.383125;
			y = safeZoneY + safeZoneH * 0.60777778;
			w = safeZoneW * 0.26875;
			h = safeZoneH * 0.02777778;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};

	class Controls {
		class Vehicles_Box: Life_RscListBox {
			idc = 20302;
			x = safeZoneX + safeZoneW * 0.38625;
			y = safeZoneY + safeZoneH * 0.38444445;
			w = safeZoneW * 0.126875;
			h = safeZoneH * 0.21888889;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onLBSelChanged = "_this call life_fnc_fuelLBChange";
		};

		class Slider: life_RscXSliderH {
			idc = 20304;
			x = safeZoneX + safeZoneW * 0.520625;
			y = safeZoneY + safeZoneH * 0.58111112;
			w = safeZoneW * 0.12625;
			h = safeZoneH * 0.02;
			text = "";
			onSliderPosChanged = "[3,_this select 1] call life_fnc_s_onSliderChange;";
		};

		class Refuel: Life_RscButton {
			idc = 20309;
			x = safeZoneX + safeZoneW * 0.548125;
			y = safeZoneY + safeZoneH * 0.61;
			w = safeZoneW * 0.1025;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "REFUEL";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
            onButtonClick = "[] spawn life_fnc_fuelRefuelCar;";
		};

		class CLOSE: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.63625;
			y = safeZoneY + safeZoneH * 0.33555556;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
			tooltip = "Close";
			colorBackground[] = {0,0,0,1};
			colorFocused[] = {0.09,0.09,0.09,1};
			colorBackgroundActive[] = {0.03,0.03,0.03,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onButtonClick = "closeDialog 0; life_action_inUse = false;";
		};

		class Top_Text: Life_RscStructuredText {
			idc = 20303;
			x = safeZoneX + safeZoneW * 0.519375;
			y = safeZoneY + safeZoneH * 0.38555556;
			w = safeZoneW * 0.131875;
			h = safeZoneH * 0.15111112;
			text = "";
		};

		class Total: Life_RscText {
			idc = 20305;
			x = safeZoneX + safeZoneW * 0.520625;
			y = safeZoneY + safeZoneH * 0.54111112;
			w = safeZoneW * 0.13;
			h = safeZoneH * 0.02;
			text = "";
			font = "RobotoCondensedLight";
		};
	};
};
