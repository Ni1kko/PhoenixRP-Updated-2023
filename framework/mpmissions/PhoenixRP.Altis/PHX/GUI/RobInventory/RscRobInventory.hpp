class RscRobInventory {
    idd = 3500;
    name = "RscRobInventory";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
        class Background:Life_RscText{
            idc = -1;
            x = safeZoneX + safeZoneW * 0.365625;
            y = safeZoneY + safeZoneH * 0.34555556;
            w = safeZoneW * 0.275;
            h = safeZoneH * 0.33666667;
            colorBackground[] = {0.16,0.16,0.16,1};
            colorText[] = {0.498,0.9922,0.5686,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };

        class Player_Inventory: Life_RscText {
            colorBackground[] = {0.102,0.102,0.102,1};
            idc = -1;
            x = safeZoneX + safeZoneW * 0.505;
            y = safeZoneY + safeZoneH * 0.35333334;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.02222223;
            style = 2;
            colorText[] = {1,1,1,1};
            text = "Player Inventory";
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class Hostage_Inventory: Life_RscText {
            colorBackground[] = {0.102,0.102,0.102,1};
            idc = -1;
            x = safeZoneX + safeZoneW * 0.37;
            y = safeZoneY + safeZoneH * 0.35333334;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.02222223;
            style = 2;
            colorText[] = {1,1,1,1};
            text = "Hostage Inventory";
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class Top: Life_RscText {
            colorBackground[] = {0.09,0.09,0.09,1};
            idc = 3501;
            text = "";
            x = safeZoneX + safeZoneW * 0.365625;
            y = safeZoneY + safeZoneH * 0.32333334;
            w = safeZoneW * 0.275;
            h = safeZoneH * 0.02222223;
            font = "RobotoCondensedLight";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };
    };

    class Controls {
        class HostageGear:Life_RscListBox{
            idc = 3502;
            text = "";
            x = safeZoneX + safeZoneW * 0.37;
            y = safeZoneY + safeZoneH * 0.37777778;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.22;
            color[] = {1, 1, 1, 0.45};
      		colorActive[] = {1, 1, 1, 0.65};
			font = "RobotoCondensedLight";
    		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
      		};

        class PlayerGear: Life_RscListBox {
            idc = 3503;
            text = "";
			x = safeZoneX + safeZoneW * 0.505;
			y = safeZoneY + safeZoneH * 0.37777778;
			w = safeZoneW * 0.13;
			h = safeZoneH * 0.21888889;
            color[] = {1, 1, 1, 0.45};
      		colorActive[] = {1, 1, 1, 0.65};
			font = "RobotoCondensedLight";
    		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
      		};

        class HostageEdit: Life_RscEdit {
            idc = 3505;
            text = "1";
			x = safeZoneX + safeZoneW * 0.369375;
			y = safeZoneY + safeZoneH * 0.60111112;
			w = safeZoneW * 0.13;
			h = safeZoneH * 0.02111112;
            colorBackground[] = {0.102,0.102,0.102,1};
        	colorDisabled[] = {0.2,0.2,0.2,1};
      		colorSelection[] = {0.902,0.902,0.902,1};
      		colorText[] = {1,1,1,1};
            font = "PuristaLight";
      		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class PlayerEdit: Life_RscEdit {
            idc = 3506;
            text = "1";
			x = safeZoneX + safeZoneW * 0.505;
			y = safeZoneY + safeZoneH * 0.60111112;
			w = safeZoneW * 0.13;
			h = safeZoneH * 0.02111112;
      		colorBackground[] = {0.102,0.102,0.102,1};
    		colorDisabled[] = {0.2,0.2,0.2,1};
      		colorSelection[] = {0.902,0.902,0.902,1};
    		colorText[] = {1,1,1,1};
      		font = "PuristaLight";
      		sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class Take:Life_RscButton{
            idc = 3509;
            x = safeZoneX + safeZoneW * 0.369375;
            y = safeZoneY + safeZoneH * 0.62555556;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.02222223;
            text = "TAKE";
            borderSize = 0;
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            onButtonClick = "['takeItem', 'One'] call PHX_fnc_robInventory;";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class TakeAll:Life_RscButton{
            idc = 3507;
            x = safeZoneX + safeZoneW * 0.369375;
            y = safeZoneY + safeZoneH * 0.65111112;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.02222223;
            text = "TAKE ALL";
            borderSize = 0;
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            onButtonClick = "['takeItem', 'All'] call PHX_fnc_robInventory;";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class StoreItem:Life_RscButton{
            idc = 3510;
            x = safeZoneX + safeZoneW * 0.505;
            y = safeZoneY + safeZoneH * 0.62555556;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.02222223;
            text = "STORE";
            borderSize = 0;
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            onButtonClick = "['giveItem', 'One'] call PHX_fnc_robInventory;";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class StoreAll: Life_RscButton {
            idc = 3508;
            x = safeZoneX + safeZoneW * 0.505;
            y = safeZoneY + safeZoneH * 0.65111112;
            w = safeZoneW * 0.13;
            h = safeZoneH * 0.02222223;
            text = "STORE ALL";
            borderSize = 0;
            colorBackground[] = {0,0,0,1};
            colorText[] = {1,1,1,1};
            font = "PuristaLight";
            onButtonClick = "['giveItem', 'All'] call PHX_fnc_robInventory;";
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
        };

        class ButtonClose: Life_RscButton {
            idc = -1;
            x = safeZoneX + safeZoneW * 0.624375;
            y = safeZoneY + safeZoneH * 0.32333334;
            w = safeZoneW * 0.015625;
            h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
        };
    };
};