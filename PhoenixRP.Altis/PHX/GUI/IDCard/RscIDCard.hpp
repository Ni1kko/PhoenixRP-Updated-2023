class RscIDCard {
	idd = 2500;
	name = "RscIDCard";
  	onLoad = "";
	movingEnable = true;
    enableSimulation = true;

    class ControlsBackground{
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.176 * safezoneH;
			moving = true; // Allows it to be dragged around
        };

        class BackgroundPicture : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,1};
            x = 0.407187 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.099 * safezoneH;
        };
    };
    class Controls {

        class UsernameText:Life_RscStructuredText {
			idc = -1;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.434 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Name";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class UsernameInput:Life_RscStructuredText {
			idc = 2501;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class AgeText:Life_RscStructuredText {
			idc = -1;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "<t align='left'>Age</t><t align='right'>Gender</t>";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class AgeInput:Life_RscStructuredText {
			idc = 2502;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class EthnicityText:Life_RscStructuredText {
			idc = -1;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Ethnicity";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class EthnicityInput:Life_RscStructuredText {
			idc = 2503;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class IDText:Life_RscStructuredText {
			idc = -1;
			x = 0.407187 * safezoneW + safezoneX;
            y = 0.544 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Unique ID";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class IDInput:Life_RscStructuredText {
			idc = 2504;
			x = 0.407187 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};
    };
};