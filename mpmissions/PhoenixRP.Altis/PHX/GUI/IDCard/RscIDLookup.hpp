class RscIDLookup {
	idd = 2600;
	name = "RscIDLookup";
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

        class HeaderBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,1};
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.379 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.044 * safezoneH;
			moving = true; // Allows it to be dragged around
        };

        class SearchBackground : Life_RscBackground {
            idc = -1;
            colorBackground[] = {0,0,0,1};
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.190781 * safezoneW;
            h = 0.044 * safezoneH;
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

        class PageTitle : Life_RscText {
            idc = -1;
            text = "ID Lookup";
            x = 0.402031 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0979687 * safezoneW;
            h = 0.022 * safezoneH;
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };
    class Controls {
		class CloseButton: Life_RscButtonMenuIcon
		{
			onButtonClick = "closeDialog 0;";
			idc = -1;
			x = 0.577344 * safezoneW + safezoneX;
            y = 0.357 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			tooltip = "Return"; 
			text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
		};

        class IDSearchInput:Life_RscEdit {
			idc = 2605;
			x = 0.407187 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.022 * safezoneH;
            text = "";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};

		class SearchButton: Life_RscButtonMenuIcon
		{
			onButtonClick = "ctrlEnable[2606, false]; [(ctrlText 2605)] remoteExec ([""fnc_lookupID"", ""PHXSRV""] call SOCK_fnc_getRemoteDestination);";
			idc = 2606;
			x = 0.572187 * safezoneW + safezoneX;
            y = 0.39 * safezoneH + safezoneY;
            w = 0.0154688 * safezoneW;
            h = 0.022 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			tooltip = "Search ID"; 
			text = "a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
		};

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
			idc = 2601;
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
			idc = 2602;
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
			idc = 2603;
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
			idc = 2604;
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