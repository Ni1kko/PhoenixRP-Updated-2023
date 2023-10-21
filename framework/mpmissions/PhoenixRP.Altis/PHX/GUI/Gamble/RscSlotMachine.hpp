class RscSlotMachine {
    idd = 5780;
    movingEnabled = false;
    enableSimulation = true;
    name = "RscSlotMachine";

    class controlsBackground {
    	class Background: Life_RscText {
    	idc = -1;
		x = safeZoneX + safeZoneW * 0.366875;
		y = safeZoneY + safeZoneH * 0.38111112;
		w = safeZoneW * 0.273125;
		h = safeZoneH * 0.18777778;
		colorBackground[] = {0.2,0.2,0.2,1};
    };

    class Footer: Life_RscText {
		idc = -1;
		x = safeZoneX + safeZoneW * 0.366875;
		y = safeZoneY + safeZoneH * 0.56888889;
		w = safeZoneW * 0.273125;
		h = safeZoneH * 0.03;
		colorBackground[] = {0.102,0.102,0.102,1};
      };

    class Title: Life_RscText {
		idc = -1;
		text = "Slot Machine";
		x = safeZoneX + safeZoneW * 0.366875;
		y = safeZoneY + safeZoneH * 0.35888889;
		w = safeZoneW * 0.273125;
		h = safeZoneH * 0.02222223;
		colorBackground[] = {0.09,0.09,0.09,1};
		colorText[] = {1,1,1,1};
		font = "RobotoCondensedLight";
		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
      };
    };

class controls {
	class SLOT_1: life_RscPicture{
		idc = 5771;
		text = "data\gamble\slots\slot_empty.paa";
		x = safeZoneX + safeZoneW * 0.359375;
		y = safeZoneY + safeZoneH * 0.38888889;
		w = safeZoneW * 0.08625;
		h = safeZoneH * 0.17333334;
    };

	class SLOT_2: life_RscPicture {
		idc = 5772;
		text = "data\gamble\slots\slot_empty.paa";
		x = safeZoneX + safeZoneW * 0.45;
		y = safeZoneY + safeZoneH * 0.38888889;
		w = safeZoneW * 0.08625;
		h = safeZoneH * 0.17333334;
    };

	class SLOT_3: life_RscPicture {
		idc = 5773;
		text = "data\gamble\slots\slot_empty.paa";
		x = safeZoneX + safeZoneW * 0.540625;
		y = safeZoneY + safeZoneH * 0.38888889;
		w = safeZoneW * 0.08625;
		h = safeZoneH * 0.17333334;
    };

	class Close:Life_RscButton{
		idc = -1;
		x = safeZoneX + safeZoneW * 0.624;
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

	class RscText_1005:PHXEdit{
		idc = 5778;
			x = safeZoneX + safeZoneW * 0.37;
			y = safeZoneY + safeZoneH * 0.57222223;
			w = safeZoneW * 0.245;
			h = safeZoneH * 0.02222223;
			text = "";
			colorBackground[] =  {0,0,0,1};
			colorDisabled[] = {0.16,0.16,0.16,1};
			colorSelection[] = {0.16,0.16,0.16,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
	};

	class RscText_1006:Life_RscButton{
		idc = 5782;
		x = safeZoneX + safeZoneW * 0.62;
		y = safeZoneY + safeZoneH * 0.57222223;
		w = safeZoneW * 0.015625;
		h = safeZoneH * 0.02222223;
		style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
		text = "\a3\3DEN\Data\Displays\Display3DENTutorial\pictureCompleted_ca.paa";
		onButtonClick = "[] spawn PHX_fnc_slotSpin";
		colorBackground[] = {0,0,0,1};
		colorFocused[] = {0.09,0.09,0.09,1};
		colorBackgroundActive[] = {0.03,0.03,0.03,1};
	};
  };
};
