class life_spawn_selection {
    idd = 38500;
    movingEnable = 0;
    enableSimulation = 1;

	class ControlsBackground {
		class Top: Life_RscTitle {
			idc = 38501;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.31111112;
			w = safeZoneW * 0.3875;
			h = safeZoneH * 0.02222223;
			text = "Spawn Selection";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Background: Life_RscTitle {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.33222223;
			w = safeZoneW * 0.3875;
			h = safeZoneH * 0.33111112;
			colorBackground[] = {0.16,0.16,0.16,1};
		};

		class Map: Life_RscMapControl {
			idc = 38502;
			x = safeZoneX + safeZoneW * 0.433125;
			y = safeZoneY + safeZoneH * 0.34333334;
			w = safeZoneW * 0.25375;
			h = safeZoneH * 0.30777778;
			maxSatelliteAlpha = 0.75;
            alphaFadeStartScale = 1.15;
            alphaFadeEndScale = 1.29;
		};

		class Bottom: Life_RscTitle {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.66333334;
			w = safeZoneW * 0.3875;
			h = safeZoneH * 0.03;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class SelectionBG: Life_RscTitle {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.315;
			y = safeZoneY + safeZoneH * 0.34333334;
			w = safeZoneW * 0.111875;
			h = safeZoneH * 0.31;
			colorBackground[] = {0.09,0.09,0.09,1};
		};
	};

	class Controls {
		class Selection: Life_RscListNBox {
			idc = 38510;
			x = safeZoneX + safeZoneW * 0.315;
			y = safeZoneY + safeZoneH * 0.34333334;
			w = safeZoneW * 0.111875;
			h = safeZoneH * 0.31;
			color[] = {0.09,0.09,0.09,1};
			colorDisabled[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			rowHeight = 0.05;
            drawSideArrows = 0;
            idcLeft = -1;
            idcRight = -1;
			text = "";
            onLBSelChanged = "_this call life_fnc_spawnPointSelected;";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Spawn: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.533125;
			y = safeZoneY + safeZoneH * 0.66666667;
			w = safeZoneW * 0.159375;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "SPAWN";
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
			font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
            onButtonClick = "closeDialog 0; [] spawn life_fnc_spawnConfirm";
		};

		class Preload: Life_RscButton {
			idc = 38511;
			x = safeZoneX + safeZoneW * 0.310625;
			y = safeZoneY + safeZoneH * 0.66666667;
			w = safeZoneW * 0.11;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "PRELOAD";
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
			font = "PuristaLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			onButtonClick = "['preloadSpawn',_this select 1] call life_fnc_s_onCheckedChange;";
		};
	};
};
