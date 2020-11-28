class PageTitle : Life_RscText {
    idc = IDC_INV_TITLE;
    text = "Inventory Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_INV_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class itemList: Life_RscListBox {
    idc = IDC_INV_LIST;
    rowHeight = 0.09;
    sizeEx = 0.033;
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.211406 * safezoneW;
    h = 0.418 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
    onLBDblClick = "[23202,23205] call PHX_fnc_setEdit;";
};

class RemoveButton: Life_RscButtonMenu {
    idc = IDC_INV_REMOVE;
    text = "Remove";
    onButtonClick = "[] call life_fnc_removeItem;";
    x = 0.448437 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};

class itemEdit: Life_RscEdit {
    idc = IDC_INV_EDIT;
    text = "1";
    sizeEx = 0.030;
    x = 0.391719 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.0515625 * safezoneW;
    h = 0.022 * safezoneH;
};

class UseButton: Life_RscButtonMenu {
    idc = IDC_INV_USE;
    text = "Use";
    onButtonClick = "[] call life_fnc_useItem;";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.709 * safezoneH + safezoneY;
    w = 0.061875 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0.5};
};

class LicenseList: Life_RscListBox
{
    idc = IDC_INV_LICENSE_LIST;
    rowHeight = 0.09;
    sizeEx = 0.033;
    x = 0.494844 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.226875 * safezoneW;
    h = 0.462 * safezoneH;
    colorBackground[] = {-1,-1,-1,0.6};
};