class RscDisplayGarage {
    idd = 2800;
    movingEnable = true;
    enableSimulation = true;
    onload = "";

    class ControlsBackground {
        class Background : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.16,0.16,0.16,1};
            x = 0.335 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.418 * safezoneH;
        };
        class FooterBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0.102,0.102,0.102,1};
            x = 0.335 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.0327 * safezoneH;
        };
        class PageTitle : Life_RscText {
            idc = -1;
            text = "Garage";
            x = 0.335 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.33 * safezoneW;
            h = 0.022 * safezoneH;
			font = "RobotoCondensedLight";
			colorBackground[] = {0.09,0.09,0.09,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };

	class Controls {
		class CloseButton: Life_RscButtonMenuIcon {
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.649531 * safezoneW + safezoneX;
            y = 0.291 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};
		
		class VehicleList:Life_RscListBox {
			idc = 2802;
			x = 0.340156 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.341 * safezoneH;
			onLBSelChanged = "_this call life_fnc_garageLBChange;";
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			rowHeight = 0;
		};
		class PlayerList:Life_RscListBox {
			idc = 2808;
			x = 0.484531 * safezoneW + safezoneX;
            y = 0.324 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.341 * safezoneH;
			onLBSelChanged = "";
			color[] = {0.09,0.09,0.09,1};
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			rowHeight = 0;
		};
        class VehicleInfo:Life_RscStructuredText{
			idc = 2803;
            x = 0.484531 * safezoneW + safezoneX;
            y = 0.325 * safezoneH + safezoneY;
            w = 0.175313 * safezoneW;
            h = 0.341 * safezoneH;
            style = 0;
			text = "<br/><br/><br/><t align='center' size='1.2'>Select a Vehicle...</t>";
            colorBackground[] = {0.1,0.1,0.1,1};
		};
        class TransferVeh:Life_RscButton{
			idc = 2809;
			x = 0.587656 * safezoneW + safezoneX;
            y = 0.68 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "TRANSFER";
			onButtonClick = "[] spawn PHX_fnc_transferVehicle;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
        class RetrieveVeh:Life_RscButton{
			idc = 2804;
			x = 0.587656 * safezoneW + safezoneX;
            y = 0.68 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "RETRIEVE";
			onButtonClick = "[] spawn life_fnc_unimpound;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
        class SellVeh:Life_RscButton{
			idc = 2805;
			x = 0.512656 * safezoneW + safezoneX;
            y = 0.68 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "SELL";
			onButtonClick = "[] spawn life_fnc_sellGarage;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
        class Garage:Life_RscButton{
			idc = 2807;
			x = 0.340156 * safezoneW + safezoneX;
            y = 0.68 * safezoneH + safezoneY;
            w = 0.095 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "GARAGE";
			onButtonClick = "[-1, 2800] call PHX_fnc_changePage;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
        class Transfers:Life_RscButton{
			idc = 2806;
			x = 0.340156 * safezoneW + safezoneX;
            y = 0.68 * safezoneH + safezoneY;
            w = 0.095 * safezoneW;
            h = 0.022 * safezoneH;
			style = 2;
			text = "TRANSFER";
			onButtonClick = "[1, 2800] call PHX_fnc_changePage;";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
            colorBackgroundDisabled[] = {0.05,0.05,0.05,0.8};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
    };
};