class RscVote {
    idd = 3000;
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
            y = 0.368 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.341 * safezoneH;
			colorBackground[] = {0.09,0.09,0.09,1};
		};
        class PageTitle : Life_RscText {
            idc = 3001;
            text = "User's Ballot";
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

        class BallotInfo:Life_RscStructuredText {
			idc = 3002;
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
			idc = 3003;
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

		class CandidatesView : Life_RscControlsGroup {
			idc = 3004;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.341 * safezoneH;
			
			class Controls {

            };

        };

        class SubmitVote:Life_RscButton{
			idc = 3005;
			x = 0.546406 * safezoneW + safezoneX;
            y = 0.726 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "SUBMIT VOTE";
			onButtonClick = "call PHX_fnc_vote;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
    };
};