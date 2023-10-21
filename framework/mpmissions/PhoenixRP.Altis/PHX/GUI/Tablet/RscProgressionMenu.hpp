class PageProgressionTitle : Life_RscText {
    idc = IDC_PROG_TITLE;
    text = "Profile Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseProgressionButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_PROG_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class nameText : Life_RscStructuredText {
    idc = IDC_PROG_NAME;
    text = "<t size='2'>Lead Dev</t>";
    x = 0.283437 * safezoneW + safezoneX;
    y = 0.304 * safezoneH + safezoneY;
    w = 0.173125 * safezoneW;
    h = 0.055 * safezoneH;
};

class curPreText : Life_RscStructuredText {
    idc = IDC_PROG_PRE_CUR;
    text = "<t align='center' size='2'>69</t>";
    x = 0.62375 * safezoneW + safezoneX;
    y = 0.291 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.044 * safezoneH;
};

class PreText : Life_RscStructuredText {
    idc = IDC_PROG_PRE;
    text = "<t align='center'>Prestige</t>";
    x = 0.62375 * safezoneW + safezoneX;
    y = 0.335 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.044 * safezoneH;
};

class curLvlText : Life_RscStructuredText {
    idc = IDC_PROG_LVL_CUR;
    text = "<t align='center' size='2'>96</t>";
    x = 0.670156 * safezoneW + safezoneX;
    y = 0.291 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.044 * safezoneH;
};

class LvlText: Life_RscStructuredText {
    idc = IDC_PROG_LVL;
    text = "<t align='center'>Level</t>";
    x = 0.670156 * safezoneW + safezoneX;
    y = 0.335 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.044 * safezoneH;
};

class PageBackground : Life_RscBackground {
    idc = IDC_PROG_BACKGROUND;
    x = 0.278281 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.352 * safezoneH;
    colorBackground[] = {0, 0, 0, 0};
	colorFrame[] = {0,0,0,1};
};

class ProfessionView : Life_RscControlsGroup {
    idc = IDC_PROG_VIEW;
    x = 0.278281 * safezoneW + safezoneX;
	y = 0.39 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.352 * safezoneH;
    colorBackground[] = {0, 0, 0, 0};
	colorFrame[] = {0,0,0,1};
    class Controls {};
};

class ProfessionButton : Life_RscButtonMenu {
	idc = IDC_PROG_PROF_BUTTON;
    style = ST_CENTER;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.368;
	w = safeZoneW * 0.0670312;
	h = safeZoneH * 0.022;
	text = "Professions";
	onButtonClick = "[""Professions""] call PHX_fnc_onLoad;";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class AchievementsButton : Life_RscButtonMenu {
	idc = IDC_PROG_ACH_BUTTON;
    style = ST_CENTER;
	x = safeZoneX + safeZoneW * 0.345312;
	y = safeZoneY + safeZoneH * 0.368;
	w = safeZoneW * 0.0670312;
	h = safeZoneH * 0.022;
	text = "Achievements";
	onButtonClick = "[""Achievements""] call PHX_fnc_onLoad;";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class TitlesButton : Life_RscButtonMenu {
	idc = IDC_PROG_TITLES_BUTTON;
    style = ST_CENTER;
	x = safeZoneX + safeZoneW * 0.412343;
	y = safeZoneY + safeZoneH * 0.368;
	w = safeZoneW * 0.0670312;
	h = safeZoneH * 0.022;
	text = "Titles";
	onButtonClick = "[""Titles""] call PHX_fnc_onLoad;";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class LoyaltyButton : Life_RscButtonMenu {
	idc = IDC_PROG_LOYA_BUTTON;
    style = ST_CENTER;
	x = safeZoneX + safeZoneW * 0.479374;
	y = safeZoneY + safeZoneH * 0.368;
	w = safeZoneW * 0.0670312;
	h = safeZoneH * 0.022;
	text = "Loyalty Rewards";
	onButtonClick = "[""Loyalty""] call PHX_fnc_onLoad;";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class SettingsButton : Life_RscButtonMenu {
	idc = IDC_PROG_SETT_BUTTON;
    style = ST_CENTER;
	x = safeZoneX + safeZoneW * 0.546405;
	y = safeZoneY + safeZoneH * 0.368;
	w = safeZoneW * 0.0670312;
	h = safeZoneH * 0.022;
	text = "Settings";
	onButtonClick = "[""DonatorSettings""] call PHX_fnc_onLoad;";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class PrestigeButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[] spawn PHX_fnc_prestige";
    idc = IDC_PROG_PRES_BUTTON;
    x = 0.597969 * safezoneW + safezoneX;
    y = 0.306 * safezoneH + safezoneY;
    w = 0.020625 * safezoneW;
    h = 0.033 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Prestige";
    text = "\a3\3den\Data\CfgWaypoints\transportUnload_ca.paa";
};

class DonatorIcons: PHX_RscTree
{
    idc = IDC_PROG_DONT_LIST;
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.401 * safezoneH + safezoneY;
    w = 0.134062 * safezoneW;
    h = 0.33 * safezoneH;
    colorBackground[] = {0,0,0,0.7};
    sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
};

class RED: Life_RscStructuredText
{
    idc = IDC_PROG_DONT_RED_TEXT;
    text = "<t align='center'>RED %</t>";
    x = 0.422656 * safezoneW + safezoneX;
    y = 0.412 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.033 * safezoneH;
};
class REDSLIDER: life_RscXSliderH
{
    idc = IDC_PROG_DONT_RED_SLIDER;
    x = 0.474218 * safezoneW + safezoneX;
    y = 0.412 * safezoneH + safezoneY;
    w = 0.190781 * safezoneW;
    h = 0.033 * safezoneH;
    text = "";
    onSliderPosChanged = "[5,_this select 1] call life_fnc_s_onSliderChange";
};
class REDEDIT: Life_RscEdit
{
    idc = IDC_PROG_DONT_RED_EDIT;
    x = 0.670156 * safezoneW + safezoneX;
    y = 0.412 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.033 * safezoneH;
    font = "PuristaLight";
    text = "";
};
class GREEN: Life_RscStructuredText
{
    idc = IDC_PROG_DONT_GRE_TEXT;
    text = "<t align='center'>GREEN %</t>";
    x = 0.422656 * safezoneW + safezoneX;
    y = 0.456 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.033 * safezoneH;
};
class GREENSLIDER: life_RscXSliderH
{
    idc = IDC_PROG_DONT_GRE_SLIDER;
    x = 0.474218 * safezoneW + safezoneX;
    y = 0.456 * safezoneH + safezoneY;
    w = 0.190781 * safezoneW;
    h = 0.033 * safezoneH;
    text = "";
    onSliderPosChanged = "[6,_this select 1] call life_fnc_s_onSliderChange";
};
class GREENEDIT: Life_RscEdit
{
    idc = IDC_PROG_DONT_GRE_EDIT;
    x = 0.670156 * safezoneW + safezoneX;
    y = 0.456 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.033 * safezoneH;
    font = "PuristaLight";
    text = "";
};
class BLUE: Life_RscStructuredText
{
    idc = IDC_PROG_DONT_BLU_TEXT;
    text = "<t align='center'>BLUE %</t>";
    x = 0.422656 * safezoneW + safezoneX;
    y = 0.5 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.033 * safezoneH;
};
class BLUESLIDER: life_RscXSliderH
{
    idc = IDC_PROG_DONT_BLU_SLIDER;
    x = 0.474218 * safezoneW + safezoneX;
    y = 0.5 * safezoneH + safezoneY;
    w = 0.190781 * safezoneW;
    h = 0.033 * safezoneH;
    text = "";
    onSliderPosChanged = "[7,_this select 1] call life_fnc_s_onSliderChange";
};
class BLUEEDIT: Life_RscEdit
{
    idc = IDC_PROG_DONT_BLU_EDIT;
    x = 0.670156 * safezoneW + safezoneX;
    y = 0.5 * safezoneH + safezoneY;
    w = 0.0464063 * safezoneW;
    h = 0.033 * safezoneH;
    font = "PuristaLight";
    text = "";
};

class NameCombo: PHXCombos
{
    idc = IDC_PROG_DONT_NME_TYP;
    x = 0.587656 * safezoneW + safezoneX;
    y = 0.555 * safezoneH + safezoneY;
    w = 0.134062 * safezoneW;
    h = 0.022 * safezoneH;
};

class SaveDNTButton : Life_RscButtonMenu {
	idc = IDC_PROG_DONT_SVE_BUT;
	x = safeZoneX + safeZoneW * 0.644374;
	y = safeZoneY + safeZoneH * 0.709;
	w = safeZoneW * 0.0773437;
	h = safeZoneH * 0.022;
	text = "Save Settings";
	onButtonClick = "call PHX_fnc_setDonatorSettings";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class DonatorBlock : CtrlStaticBackgroundDisableTiles {
    idc = IDC_PROG_DONATOR_BLOCK;
    x = 0.278281 * safezoneW + safezoneX;
	y = 0.401 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.33 * safezoneH;
    colorBackground[] = { 1, 1, 1, 1 };
    tileW = 4 / (64 * pixelW);
	tileH = 2 / (64 * pixelH);
    tooltip = "You must become a sponsor to access these features...";
};