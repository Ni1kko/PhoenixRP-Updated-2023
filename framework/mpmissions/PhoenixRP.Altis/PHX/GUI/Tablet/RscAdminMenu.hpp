class PageAdminTitle : Life_RscText {
    idc = IDC_ADMIN_TITLE;
    text = "Admin Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseAdminButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_ADMIN_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class MainAdminHeader : Life_RscText {
	idc = IDC_ADMIN_MAIN_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Player Information:";
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.335156 * safezoneW;
	h = 0.022 * safezoneH;
};

class SecondaryAdminHeader : Life_RscText {
	idc = IDC_ADMIN_SECOND_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Players:";
	x = 0.618595 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
};

class InfoBox : Life_RscStructuredText {
	idc = IDC_ADMIN_INFO_BOX;
	style = "0x10 + 0x200";
	text = "";
	colorBackground[] = {0.05,0.05,0.05,1};
	colorDisabled[] = {0.05,0.05,0.05,1};
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.304 * safezoneH + safezoneY;
	w = 0.335156 * safezoneW;
	h = 0.305 * safezoneH;
};

class AdminPlayersList: Life_RscListBox {
    idc = IDC_ADMIN_LIST;
	sizeEx = 0.030;
	onLBSelChanged = "_this spawn PHX_fnc_queryPlayer";
    x = 0.618595 * safezoneW + safezoneX;
    y = 0.326 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.282 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class AdminSearchBox : Life_RscEdit {
	idc = IDC_ADMIN_SEARCH;
	text = "";
	colorBackground[] = {0,0,0,1};
	x = 0.618595 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.103125 * safezoneW;
	h = 0.022 * safezoneH;
};

// ["0.278281 * safezoneW + safezoneX","0.676 * safezoneH + safezoneY","0.103125 * safezoneW","0.022 * safezoneH"]
// ["0.391719 * safezoneW + safezoneX","0.676 * safezoneH + safezoneY","0.103125 * safezoneW","0.022 * safezoneH"]