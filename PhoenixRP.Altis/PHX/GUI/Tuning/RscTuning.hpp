class RscTuning {
    idd = 2100;
    name="RscTuning";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "ctrlShow [2109,false];";
    onUnLoad = "[2100] call life_fnc_3dPreviewExit;";

	class ControlsBackground{
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.0101562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.418 * safezoneH;
        };
        class HeaderBackground : Life_RscBackground {
            idc = -1;
            moving = true; // Allows it to be dragged around
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.0101562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.0101562 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
            w = 0.159844 * safezoneW;
            h = 0.033 * safezoneH;
        };
		class Line:Life_RscText{
			idc = -1;
			x = 0.0101562 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
			w = 0.159844 * safezoneW;
			h = safeZoneH * 0.00133334;
			colorBackground[] = {0,0,0,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
        class PageTitle : Life_RscText {
            idc = -1;
            text = "Tuning Shop";
            x = 0.0101562 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};

	class Controls{
		class CloseButton: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.154531 * safezoneW + safezoneX;
            y = 0.302 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

		class List_Of_Cars:PHXListbox{
			idc = 2102;
			x = safeZoneX + safeZoneW * 0.0153125;
			y = safeZoneY + safeZoneH * 0.335;
			w = safeZoneW * 0.149531;
			h = safeZoneH * 0.176;
            onLBSelChanged = "[2100, 2102] call life_fnc_vehiclecolor3DRefresh;";
            color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			rowHeight = 0;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
		};

		class Buy:Life_RscButton{
			idc = 2109;
			x = safeZoneX + safeZoneW * 0.0926562;
			y = safeZoneY + safeZoneH * 0.693;
			w = safeZoneW * 0.0721875;
			h = safeZoneH * 0.022;
			text = "REPAINT";
			onButtonClick = "call PHX_fnc_repaint;";
			borderSize = 0;
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
		};

		class RED: pMenuStructuredText
        {
        	idc = -1;
            text = "RED";
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.522 * safezoneH + safezoneY;
        	w = 0.103125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class REDSLIDER: life_RscXSliderH
        {
        	idc = 2110;
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.544 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.022 * safezoneH;
            text = "";
            onSliderPosChanged = "[2100, 2102,[(round(sliderPosition 2110) / 100),(round(sliderPosition 2111) / 100),(round(sliderPosition 2112) / 100),1]] call life_fnc_vehiclecolor3DRefresh;";
        };
        class GREEN: pMenuStructuredText
        {
            idc = -1;
            text = "GREEN";
            x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.577 * safezoneH + safezoneY;
        	w = 0.103125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class GREENSLIDER: life_RscXSliderH
        {
        	idc = 2111;
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.599 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.022 * safezoneH;
            text = "";
            onSliderPosChanged = "[2100, 2102,[(round(sliderPosition 2110) / 100),(round(sliderPosition 2111) / 100),(round(sliderPosition 2112) / 100),1]] call life_fnc_vehiclecolor3DRefresh;";
        };
        class BLUE: pMenuStructuredText
        {
            idc = -1;
            text = "BLUE";
            x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.632 * safezoneH + safezoneY;
        	w = 0.103125 * safezoneW;
        	h = 0.022 * safezoneH;
        };
        class BLUESLIDER: life_RscXSliderH
        {
        	idc = 2112;
        	x = 0.0153125 * safezoneW + safezoneX;
        	y = 0.654 * safezoneH + safezoneY;
        	w = 0.149531 * safezoneW;
        	h = 0.022 * safezoneH;
            text = "";
            onSliderPosChanged = "[2100, 2102,[(round(sliderPosition 2110) / 100),(round(sliderPosition 2111) / 100),(round(sliderPosition 2112) / 100),1]] call life_fnc_vehiclecolor3DRefresh;";
        };
	};
};