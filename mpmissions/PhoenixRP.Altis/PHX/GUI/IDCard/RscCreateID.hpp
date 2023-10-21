class RscCreateID {
	idd = 2000;
	name = "RscCreateID";
  	onLoad = "";

    class ControlsBackground{
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.297 * safezoneH;
        };
        class HeaderBackground : Life_RscBackground {
            idc = -1;
            moving = true; // Allows it to be dragged around
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.654 * safezoneH + safezoneY;
            w = 0.2475 * safezoneW;
            h = 0.033 * safezoneH;
        };
		class Line:Life_RscText{
			idc = -1;
			x = 0.37625 * safezoneW + safezoneX;
            y = 0.654 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = safeZoneH * 0.00133334;
			colorBackground[] = {0,0,0,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
        class PageTitle : Life_RscText {
            idc = -1;
            text = "ID Card Creation";
            x = 0.37625 * safezoneW + safezoneX;
            y = 0.368 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };
    class Controls {

        class UsernameText:Life_RscStructuredText {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Character Name";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class UsernameInput:Life_RscEdit {
			idc = 2001;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class AgeText:Life_RscStructuredText {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.456 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Age";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class AgeDropdown:PHXCombos {
			idc = 2002;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.478 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class GenderText:Life_RscStructuredText {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.511 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Gender";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class GenderDropdown:PHXCombos {
			idc = 2003;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class EthnicityText:Life_RscStructuredText {
			idc = -1;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.566 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
            text = "Ethnicity";
			font = "RobotoCondensedLight";
            style = 0;
		};

        class EthnicityDropdown:PHXCombos {
			idc = 2004;
			x = 0.381406 * safezoneW + safezoneX;
            y = 0.588 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};
		
		class Submit : Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.546406;
			y = safeZoneY + safeZoneH * 0.661;
			w = safeZoneW * 0.0721875;
			h = safeZoneH * 0.022;
			text = "SUBMIT";
			onButtonClick = "PHX_idCard_Submitted = true";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
    };
};