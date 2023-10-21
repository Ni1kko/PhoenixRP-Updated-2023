class RscLegality {
    idd = 4000;
    movingEnable = true;
    enableSimulation = true;
    onload = "";

    class ControlsBackground {
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.506 * safezoneH;
        };
        class HeaderBackground : Life_RscBackground {
            idc = -1;
            moving = true; // Allows it to be dragged around
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.37625 * safezoneW + safezoneX;
	        y = 0.72 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.033 * safezoneH;
        };
		class Line:Life_RscText{
			idc = -1;
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.00133334 * safezoneH;
			colorBackground[] = {0,0,0,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
        class BallotInfoBackground:Life_RscBackground {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.077 * safezoneH;
			colorBackground[] = {0.09,0.09,0.09,1};
		};
        class CandidatesBackground:Life_RscBackground {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.429 * safezoneH;
			colorBackground[] = {0.09,0.09,0.09,1};
		};
        class PageTitle : Life_RscText {
            idc = 4001;
            text = "Legality Legislation";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };

	class Controls {
		class CloseButton: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.608281 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

        class ItemsView : Life_RscControlsGroup {
			idc = 4002;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.429 * safezoneH;
			
			class Controls {

            };

        };

        class SubmitChanges:Life_RscButton{
			idc = 4003;
			x = 0.546406 * safezoneW + safezoneX;
            y = 0.726 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "SUBMIT CHANGES";
			onButtonClick = "call PHX_fnc_changeLegality";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
    };
};