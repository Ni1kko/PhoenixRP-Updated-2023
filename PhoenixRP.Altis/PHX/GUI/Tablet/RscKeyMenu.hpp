class KeyPageTitle : Life_RscText {
    idc = IDC_KEY_TITLE;
    text = "Key Chain";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class KeyCloseButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_KEY_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class KeyList: Life_RscListBox {
    idc = IDC_KEY_LIST;
    rowHeight = 0.09;
    sizeEx = 0.033;
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.443438 * safezoneW;
    h = 0.418 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

/*

class PlayersList: Life_RscCombo {
    idc = IDC_KEY_PLAYERS;
    text = "";
    x = 0.510313 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.0979687 * safezoneW;
    h = 0.022 * safezoneH;
};

class GiveKeyButton: Life_RscButtonMenu {
    idc = IDC_KEY_GIVE;
    text = "Give";
    onButtonClick = "[] call life_fnc_keyGive";
    x = 0.618594 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.0515625 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};

*/

class DropKeyButton: Life_RscButton {
    idc = IDC_KEY_DROP;
    style = 2;
    text = "Drop";
    onButtonClick = "[] call life_fnc_keyDrop";
    x = 0.675313 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};

class SpreadKeyButton: Life_RscButton {
    idc = IDC_KEY_SPREAD;
    style = 2;
    text = "Spread";
    onButtonClick = "[] call PHX_fnc_spreadKeys";
    tooltip = "Gives keys to everyone in your vehicle";
    x = 0.615313 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};