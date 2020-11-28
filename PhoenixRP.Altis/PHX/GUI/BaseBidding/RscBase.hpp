class RscBase {
    idd = 13000;
    movingEnable = true;
    enableSimulation = true;
    onload = "";

    class ControlsBackground {
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.407188 * safezoneW + safezoneX;
            y = 0.412 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.11 * safezoneH;
        };
        class HeaderBackground : Life_RscBackground {
            idc = -1;
            moving = true; // Allows it to be dragged around
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.407188 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.407188 * safezoneW + safezoneX;
	        y = 0.490 * safezoneH + safezoneY;
            w = 0.185625 * safezoneW;
            h = 0.033 * safezoneH;
        };
        class PageTitle : Life_RscText {
            idc = 13001;
            text = "Base's Bidding";
            x = 0.407188 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.12375 * safezoneW;
            h = 0.022 * safezoneH;
            font = "RobotoCondensedLight";
        };
		class HeaderTitle : Life_RscText {
            idc = -1;
            text = "Current Bid:";
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.423 * safezoneH + safezoneY;
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
            y = 0.39 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

		class CurrentBid:Life_RscStructuredText {
			idc = 13002;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.033 * safezoneH;
            text = "<t align='center' size='1.5' color='#8cff9b'>£5,000,000</t>";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

        class BidButton : Life_RscButton{
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
            y = 0.494 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "ADD BID";
            toolTip = "Increments current bid by £1,000,000";
			onButtonClick = "[] call PHX_fnc_baseBid";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
    };
};