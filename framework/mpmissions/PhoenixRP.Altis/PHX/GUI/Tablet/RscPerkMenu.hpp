class PagePerkTitle : Life_RscText {
    idc = IDC_PERK_TITLE;
    text = "Perk Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class ClosePerkButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_PERK_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class UnlockedPerkBackground : Life_RscBackground {
	idc = IDC_PERK_UNLOCKED_BACKGROUND;
	colorBackground[] = {0,0,0,1};
	x = 0.278282 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.022 * safezoneH;
};

class UnlockedPerkTitle : Life_RscText {
    idc = IDC_PERK_UNLOCKED_TITLE;
    text = "Unlocked Perks";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class PerksView : Life_RscControlsGroup {
    idc = IDC_PERK_SCROLL;
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.302 * safezoneH + safezoneY;
    w = 0.443438 * safezoneW;
    h = 0.286 * safezoneH;
    colorBackground[] = {0, 0, 0, 0};

    class Controls {};
};

class PerkBackground : Life_RscBackground {
	idc = IDC_PERK_ACTIVE_BACKGROUND;
	colorBackground[] = {0,0,0,1};
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.588 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.022 * safezoneH;
};

class UnlockedPerksTitle : Life_RscStructuredText {
    idc = IDC_PERK_ACTIVE_TITLE;
    text = "Active Perks";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.588 * safezoneH + safezoneY;
    w = 0.443438 * safezoneW;
    h = 0.022 * safezoneH;
};

class RemovalInfo : Life_RscStructuredText {
    idc = IDC_PERK_REMOVE_INFO;
    text = "<t align='center'>Removal Cost: <t color = '#8A2BE2'>£10,000</t></t>";
    x = 0.283437 * safezoneW + safezoneX;
    y = 0.72 * safezoneH + safezoneY;
    w = 0.433125 * safezoneW;
    h = 0.022 * safezoneH;
};