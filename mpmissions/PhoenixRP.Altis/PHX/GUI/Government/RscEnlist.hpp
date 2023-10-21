class RscEnlist {
 	idd = 3100;
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
        class ExampleInfoBackground:Life_RscBackground {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.077 * safezoneH;
			colorBackground[] = {0.09,0.09,0.09,1};
		};
        class ConditionsBackground:Life_RscBackground {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.209 * safezoneH;
			colorBackground[] = {0.09,0.09,0.09,1};
		};
        class PageTitle : Life_RscText {
            idc = 3101;
            text = "Election Enlistment Form";
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

        class ExampleInfo:Life_RscStructuredText {
			idc = 3102;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.18375 * safezoneW;
            h = 0.077 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
            style = 0;
		};

        class ExampleChecbox:Life_Checkbox {
			idc = 3103;
			x = 0.5825 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.055 * safezoneH;
            // Make it look as if it's not disabled...
            colorDisabled[] =
            {
                1,
                1,
                1,
                0.7
            };
		};

        class DescriptionText:Life_RscText {
			idc = 3106;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            text = "Candidate Description (Max 64 Characters):";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class DescriptionEdit:Life_RscEdit {
			idc = 3107;
            x = 0.381406 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class PictureText:Life_RscText {
			idc = 3108;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
            text = "Party:";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class PictureCombo:Life_RscCombo {
			idc = 3109;
            x = 0.443281 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class Picture:Life_RscPictureKeepAspect {
			idc = 3110;
            x = 0.391719 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.066 * safezoneH;
            colorText[] = {1,1,1,1};
			text = "";
		};

        class ConditionInfo:Life_RscStructuredText {
			idc = 3111;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.5 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.209 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
            style = 0;
		};

        class CreateButton:Life_RscButton{
			idc = 3105;
			x = 0.546406 * safezoneW + safezoneX;
            y = 0.726 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "SUBMIT FORM";
			onButtonClick = "call PHX_fnc_enlist;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
    };
};