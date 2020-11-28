class RscBroadcast {
    idd = 9000;
    movingEnable = true;
    enableSimulation = true;
    onload = "";

    class ControlsBackground {
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.407188 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.132 * safezoneH;
        };
        class HeaderBackground : Life_RscBackground {
            idc = -1;
            moving = true; // Allows it to be dragged around
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.407188 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.407188 * safezoneW + safezoneX;
	        y = 0.533 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class PageTitle : Life_RscText {
            idc = -1;
            text = "Broadcast Panel";
            x = 0.407188 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
		class HeaderTitle : Life_RscText {
            idc = -1;
            text = "Header:";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
        };
		class InfoTitle : Life_RscText {
            idc = -1;
            text = "Information:";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.467 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

	class Controls {
		class CloseButton: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.577344 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

		class HeaderEdit:Life_RscEdit {
			idc = 9001;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

		class InfoEdit:Life_RscEdit {
			idc = 9002;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.033 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class MakeBroadcast : Life_RscButton{
			idc = -1;
			x = 0.515469 * safezoneW + safezoneX;
            y = 0.538 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "BROADCAST";
			onButtonClick = "[] call PHX_fnc_AANBroadcast";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
    };
};