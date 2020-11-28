#include "macros.hpp"

class RscPlayerMenu {
    idd = IDD_TABLET_MAIN;
    movingEnable = false;
    enableSimulation = true;
    onload = "";

    // Main Body...
    class ControlsBackground {
        class TabletImage : life_RscPicture {
            idc = -1;
            text = "data\ui\tablet.paa"; 
            x = 0.2525 * safezoneW + safezoneX;
            y = 0.06 * safezoneH + safezoneY;
            w = 0.495 * safezoneW;
            h = 0.858 * safezoneH;
        };
    };

    // Inner Tablet...
    class Controls {
        class Background_Colour : Life_RscText {
            idc = 101;
            colorBackground[] = {0,0,0,0};
            x = 0.2699 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.459 * safezoneW;
			h = 0.512 * safezoneH;
        };

        class Background_Image : Life_RscPicture {
            idc = 102;
            text = "";
            x = 0.2699 * safezoneW + safezoneX;
			y = 0.234 * safezoneH + safezoneY;
			w = 0.459 * safezoneW;
			h = 0.512 * safezoneH;
        };

        // Include all pages...
        #include "RscMainMenu.hpp"
        #include "RscInventoryMenu.hpp"
        #include "RscKeyMenu.hpp"
        #include "RscMarketMenu.hpp"
        #include "RscPerkMenu.hpp"
        #include "RscProgressionMenu.hpp"
        #include "RscMobileMenu.hpp"
        #include "RscAdminMenu.hpp"
        #include "RscGangMenu.hpp"
        #include "RscSettingsMenu.hpp"
        #include "RscWantedMenu.hpp"
    };
};