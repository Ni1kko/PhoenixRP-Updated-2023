#include "macros.hpp"

class RscTitleLoading {
	idd = IDD_LOADING_TITLE;
	name = "RscTitleLoading";
  	onLoad = "uiNamespace setVariable ['RscTitleLoading',_this select 0]";
	duration = 10e10;
	fadeIn = 0;
	fadeOut = 0;

    class ControlsBackground {
		class ProgressBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,1};
           	x = 0.396875 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.028 * safezoneH;
        };

        class PHXLogo : Life_RscPictureKeepAspect {
            idc = -1;
            text = "data\ui\logo.paa";
            x = 0.427812 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.144375 * safezoneW;
            h = 0.22 * safezoneH;
        };
    };

    class Controls {
		class TileBackground : CtrlStaticBackgroundDisableTiles {colorBackground[] = { 0, 0, 0, 1 };};

		class ProgressBar : Life_RscProgress {
			idc = IDC_LOADING_BAR;
            colorBar[] = {0.75, 0, 0, 0.9};
           	x = 0.396875 * safezoneW + safezoneX;
            y = 0.555 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.028 * safezoneH;
		};

		class Text : Life_RscStructuredText {
			idc = IDC_LOADING_TEXT;
			style = ST_VCENTER;
            x = 0.396875 * safezoneW + safezoneX;
            y = 0.558 * safezoneH + safezoneY;
            w = 0.20625 * safezoneW;
            h = 0.028 * safezoneH;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1)";
			class Attributes
			{
				font = "RobotoCondensed";
				color = "#ffffff";
				colorLink = "#D09B43";
				align = "center";
				shadow = 1;
			};
		};
	};
};