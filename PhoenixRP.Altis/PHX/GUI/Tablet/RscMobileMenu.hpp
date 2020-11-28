class PageMobileTitle : Life_RscText {
    idc = IDC_MOBILE_TITLE;
    text = "Mobile Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseMobileButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_MOBILE_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class MainHeader : Life_RscText {
	idc = IDC_MOBILE_MAIN_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Message:";
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.324844 * safezoneW;
	h = 0.022 * safezoneH;
};

class SecondaryHeader : Life_RscText {
	idc = IDC_MOBILE_SECOND_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Contacts:";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};

class EditBox : Life_RscEdit {
	idc = IDC_MOBILE_INPUT_BOX;
	style = "0x10 + 0x200";
	text = "";
	colorBackground[] = {0.05,0.05,0.05,1};
	colorDisabled[] = {0.05,0.05,0.05,1};
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.304 * safezoneH + safezoneY;
	w = 0.324844 * safezoneW;
	h = 0.438 * safezoneH;
};

class MsgViewBox : Life_RscStructuredText {
	idc = IDC_MOBILE_MSG_VIEW_BOX;
	style = "0x10 + 0x200";
	text = "";
	colorBackground[] = {0.05,0.05,0.05,1};
	colorDisabled[] = {0.05,0.05,0.05,1};
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.304 * safezoneH + safezoneY;
	w = 0.324844 * safezoneW;
	h = 0.438 * safezoneH;
};

class ContactList: Life_RscListBox {
    idc = IDC_MOBILE_LIST;
	sizeEx = 0.030;
    x = 0.608279 * safezoneW + safezoneX;
    y = 0.326 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.318 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class SendMSGButton : Life_RscButtonMenu {
	idc = IDC_MOBILE_SendButton;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.672;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "SEND MESSAGE";
	onButtonClick = "[false] call PHX_fnc_sendMessage";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class InboxButton : Life_RscButtonMenu {
	idc = IDC_MOBILE_INBOX_BUTTON;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.696;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "View Inbox";
	onButtonClick = "call PHX_fnc_toggleInbox";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class SendMSGAsAdminButton : Life_RscButtonMenu {
	idc = IDC_MOBILE_SendAsAdminButton;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.72;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "SEND AS ADMIN";
	onButtonClick = "[true] call PHX_fnc_sendMessage";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class DeleteButton : Life_RscButtonMenu {
	idc = IDC_MOBILE_DELETE_BUTTON;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.696;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "Delete Message";
	onButtonClick = "[((findDisplay 23000) displayCtrl 23805), (lbData[23805,lbCurSel 23805]), true] call PHX_fnc_handleMessage";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class INCLUDE_LOCATION: Life_Checkbox {
	idc = IDC_MOBILE_CHECK_LOCATION;
	onCheckedChanged = "";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.647 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
};

class LocationText : Life_RscText {
	idc = IDC_MOBILE_TEXT_LOCATION;
	text = "Include Location";
	colorBackground[] = {0,0,0,0};
	x = 0.62375 * safezoneW + safezoneX;
	y = 0.647 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.022 * safezoneH;
};

class SearchBox : Life_RscEdit {
	idc = IDC_MOBILE_SEARCH;
	text = "";
	colorBackground[] = {0,0,0,1};
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};