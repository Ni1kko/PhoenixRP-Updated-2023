class RscCraftingMenu {
	idd = 8000;
	name = "RscCraftingMenu";
  	onLoad = "";

  	class ControlsBackground {
		class MainBackground: Life_RscBackground{
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.293751 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.506 * safezoneH;
		};

		class HeaderBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.293751 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.022 * safezoneH;
        };

        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.293751 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.033 * safezoneH;
        };

		class PageTitle : Life_RscText {
            idc = -1;
            text = "Crafting Menu";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.237187 * safezoneW;
            h = 0.022 * safezoneH;
        };
	};

	class Controls {
		class CloseButton : Life_RscButtonMenuIcon {
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.690781 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Close"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

		class SearchBox : Life_RscEdit {
			idc = 8002;
			text = "";
			colorBackground[] = {0,0,0,1};
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class MainInfo:Life_RscStructuredText{
			idc = 8003;
            x = 0.597969 * safezoneW + safezoneX;
            y = 0.28 * safezoneH + safezoneY;
            w = 0.103125 * safezoneW;
            h = 0.429 * safezoneH;
            style = 0;
			text = "";
            colorBackground[] = {0, 0, 0, 1};
		};

		class CraftButton : Life_RscButtonMenu {
			idc = 8004;
			x = safeZoneX + safeZoneW * 0.628906;
			y = safeZoneY + safeZoneH * 0.726;
			w = safeZoneW * 0.0721875;
			h = safeZoneH * 0.022;
			text = "Craft Item";
			onButtonClick = "[] call PHX_fnc_craft";
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

		class amountEdit: Life_RscEdit
		{
			idc = 8005;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.726 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.022 * safezoneH;
			text = "1";
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 0};
		};

		class BlueprintsView : Life_RscControlsGroup {
			idc = 8001;
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.304 * safezoneH + safezoneY;
			w = 0.293906 * safezoneW;
			h = 0.407 * safezoneH;
			colorBackground[] = {0, 0, 0, 1};

			class Controls {};
		};
	};
};