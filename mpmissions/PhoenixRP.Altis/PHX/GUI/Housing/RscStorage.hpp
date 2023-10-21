class RscStorage {
    idd = 11000;
    name = "RscStorage";
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "";
	
	class ControlsBackground {
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.258 * safezoneH + safezoneY;
            w = 0.4125 * safezoneW;
            h = 0.473 * safezoneH;
        };

        class HeaderBackground : Life_RscBackground {
            idc = -1;
            moving = true; // Allows it to be dragged around
            colorBackground[] = {0.09,0.09,0.09,1};
            x = 0.29375 * safezoneW + safezoneX;
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
            text = "Storage Management";
            x = 0.29375 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.022 * safezoneH;
			font = "RobotoCondensedLight";
        };

		class InvHeader : Life_RscText {
			idc = -1;
			colorBackground[] = {0,0,0,1};
			text = "My Inventory";
			x = 0.298906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoCondensedLight";
			style = 2;
		};

		class HouseHeader : Life_RscText {
			idc = 11009;
			colorBackground[] = {0,0,0,1};
			text = "House Inventory";
			x = 0.448438 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.149531 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoCondensedLight";
			style = 2;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class CatHeader : Life_RscText {
			idc = -1;
			colorBackground[] = {0,0,0,1};
			text = "Current Catagory";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.643 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
			font = "RobotoCondensedLight";
			style = 2;
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
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

        class InvList : Life_RscListBox {
            idc = 11001;
            x = safeZoneX + safeZoneW * 0.298906;
            y = safeZoneY + safeZoneH * 0.302;
            w = safeZoneW * 0.144375;
            h = safeZoneH * 0.385;
            color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			rowHeight = 0.03;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            onLBSelChanged = "";
        };

		class InvEdit: Life_RscEdit {
			idc = 11011;
			text = "1";
            x = safeZoneX + safeZoneW * 0.298906;
            y = safeZoneY + safeZoneH * 0.687;
            w = safeZoneW * 0.149531;
            h = safeZoneH * 0.022;
		};

        class HouseList : Life_RscListBox {
            idc = 11002;
            x = safeZoneX + safeZoneW * 0.448438;
            y = safeZoneY + safeZoneH * 0.302;
            w = safeZoneW * 0.149531;
            h = safeZoneH * 0.385;
            color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			rowHeight = 0.03;
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
            onLBSelChanged = "";
        };

		class HouseEdit: Life_RscEdit {
			idc = 11010;
			text = "1";
            x = safeZoneX + safeZoneW * 0.448438;
            y = safeZoneY + safeZoneH * 0.687;
            w = safeZoneW * 0.149531;
            h = safeZoneH * 0.022;
		};

		class IconList: PHXCombos {
			idc = 11007;
			text = "";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class CatagoryName: Life_RscEdit {
			idc = 11008;
			text = "";
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.665 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.022 * safezoneH;
		};

		class ToHouse : Life_RscButton {
			idc = 11003;
			x = safeZoneX + safeZoneW * 0.298906;
			y = safeZoneY + safeZoneH * 0.726;
			w = safeZoneW * 0.144375;
			h = safeZoneH * 0.022;
			text = "TRANSFER TO HOUSE";
			onButtonClick = "[_this select 0] call PHX_fnc_storeStorage";
			style = 2;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class FromHouse : Life_RscButton {
			idc = 11004;
			x = safeZoneX + safeZoneW * 0.448438;
			y = safeZoneY + safeZoneH * 0.726;
			w = safeZoneW * 0.149531;
			h = safeZoneH * 0.022;
			text = "TRANSFER TO MYSELF";
			onButtonClick = "[_this select 0] call PHX_fnc_takeStorage";
			style = 2;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class SaveCatagory : Life_RscButton {
			idc = 11005;
			x = safeZoneX + safeZoneW * 0.603125;
			y = safeZoneY + safeZoneH * 0.726;
			w = safeZoneW * 0.0979687;
			h = safeZoneH * 0.022;
			text = "SAVE SETTINGS";
			onButtonClick = "[] call PHX_fnc_saveCategory";
			style = 2;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class CatagoryView : Life_RscControlsGroup {
			idc = 11006;
			x = 0.603125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.352 * safezoneH;
			colorBackground[] = {0, 0, 0, 0};
			colorFrame[] = {0,0,0,1};
			class Controls {};
		};
    };
};