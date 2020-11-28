class RscCapture {
    name = "RscCapture";
    idd = 50000;
    fadein=0;
    duration = 10e10;
    fadeout=0;
    movingEnable = 0;
    onLoad="uiNamespace setVariable ['RscCapture', _this select 0]";
    objects[]={};

    class controlsBackground {
        class Background: Life_RscText {
            idc = -1;
            colorBackground[] = {0.5,0.5,0.5,0.4};
			x = 0.386562 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class ProgressBar: Life_RscProgress {
            idc = 50001;
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.022 * safezoneH;
			colorBar[] = {0, 0, 0, 0.5};
			colorFrame[] = {0, 0, 0, 0};
        };

		class PercentageText: Life_RscStructuredText {
            idc = 50002;
            text = "69%";
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
			};
        };

        class CapText: Life_RscStructuredText {
            idc = 50003;
            text = "Press <t color = '#8A2BE2'>[ESCAPE]</t> to cancel";
            x = 0.386562 * safezoneW + safezoneX;
            y = 0.085 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.022 * safezoneH;
			class Attributes
			{
				align = "center";
			};
        };
    };
};