class PageSettingsTitle : Life_RscText {
    idc = IDC_SETTINGS_TITLE;
    text = "Settings Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseSettingsButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_SETTINGS_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class VDonFoot: Life_RscText {
	idc = IDC_SETTINGS_FOOTTXT;
	text = "On Foot:";
    x = 0.524 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
};

class VDinCar: Life_RscText {
	idc = IDC_SETTINGS_CARTXT;
	text = "On Car:";
    x = 0.524 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
};

class VDinAir: Life_RscText {
	idc = IDC_SETTINGS_AIRTXT;
	text = "On Air:";
    x = 0.524 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
};

class VD_onfoot_slider: life_RscXSliderH {
	idc = IDC_SETTINGS_FOOTSLIDER;
	text = "";
	onSliderPosChanged = "[0,_this select 1] call life_fnc_s_onSliderChange;";
	tooltip = "View distance while on foot.";
    x = 0.566031 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.022 * safezoneH;
};

class VD_car_slider: life_RscXSliderH {
	idc = IDC_SETTINGS_CARSLIDER;
	text = "";
	onSliderPosChanged = "[1,_this select 1] call life_fnc_s_onSliderChange;";
	tooltip = "View distance while in a land vehicle/";
    x = 0.566031 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.022 * safezoneH;
};

class VD_air_slider: life_RscXSliderH {
	idc = IDC_SETTINGS_AIRSLIDER;
	text = "";
	onSliderPosChanged = "[2,_this select 1] call life_fnc_s_onSliderChange;";
	tooltip = "View distance while in a air vehicle.";
    x = 0.566031 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.022 * safezoneH;
};

class VD_onfoot_value: Life_RscEdit {
	idc = IDC_SETTINGS_FOOTEDIT;
	text = "";
	onChar = "[_this select 0, _this select 1,'ground',false] call life_fnc_s_onChar;";
	onKeyUp = "[_this select 0, _this select 1,'ground',true] call life_fnc_s_onChar;";
    x = 0.680469 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
};

class VD_car_value: Life_RscEdit {
	idc = IDC_SETTINGS_CAREDIT;
	text = "";
	onChar = "[_this select 0, _this select 1,'vehicle',false] call life_fnc_s_onChar;";
	onKeyUp = "[_this select 0, _this select 1,'vehicle',true] call life_fnc_s_onChar;";
    x = 0.680469 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
};

class VD_air_value: Life_RscEdit {
	idc = IDC_SETTINGS_AIREDIT;
	text = "";
	onChar = "[_this select 0, _this select 1,'air',false] call life_fnc_s_onChar;";
	onKeyUp = "[_this select 0, _this select 1,'air',true] call life_fnc_s_onChar;";
    x = 0.680469 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.04125 * safezoneW;
    h = 0.022 * safezoneH;
};

class PlayerTagsHeader: Life_RscText {
	idc = IDC_SETTINGS_TAGSTXT;
	text = "Show Player Tags";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class PlayerTagsONOFF: Life_Checkbox {
	tooltip = "Controls whether or not players will have name tags above their head.";
	idc = IDC_SETTINGS_TAGSBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['tags', _this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class SideChatHeader: Life_RscText {
	idc = IDC_SETTINGS_CHATTXT;
	text = "Show Side Channel";
	colorBackground[] = {0,0,0,1};
    x = 0.396 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class SideChatONOFF: Life_Checkbox {
	tooltip = "Switch side-channel mode, turn this off if you don't want to talk with players from your side.";
	idc = IDC_SETTINGS_CHATBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['sidechat',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.505656 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class RevealHeader: Life_RscText {
	idc = IDC_SETTINGS_REVEALTXT;
	text = "Reveal Nearby Objects";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class RevealONOFF: Life_Checkbox {
	tooltip = "Automatically reveals nearest objects within 15m, turn this setting off if you are experiencing performance issues.";
	idc = IDC_SETTINGS_REVEALBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['objects',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class AANHeader: Life_RscText {
	idc = IDC_SETTINGS_AANTXT;
	text = "Disable AAN Banner";
	colorBackground[] = {0,0,0,1};
    x = 0.396 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class AANONOFF: Life_Checkbox {
	tooltip = "Switching this off will mean that all AAN Banners will be changed into notifications.";
	idc = IDC_SETTINGS_BROADCASTBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['broadcast',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.505656 * safezoneW + safezoneX;
    y = 0.305 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class IntroHeader: Life_RscText {
	idc = IDC_SETTINGS_INTROTXT;
	text = "Mute Intro Music";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class IntroONOFF: Life_Checkbox {
	tooltip = "This allows you to mute the intro music when spawning in.";
	idc = IDC_SETTINGS_INTROBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['intro',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class HUDHeader: Life_RscText {
	idc = IDC_SETTINGS_HUDTXT;
	text = "Hide HUD";
	colorBackground[] = {0,0,0,1};
    x = 0.396 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class HUDONOFF: Life_Checkbox {
	tooltip = "This allows you to hide the health, food and thirst bars from your HUD";
	idc = IDC_SETTINGS_HUDBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['hud',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.505656 * safezoneW + safezoneX;
    y = 0.33 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class PLAYERHeader: Life_RscText {
	idc = IDC_SETTINGS_PLYTXT;
	text = "Show Own Player";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.355 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class PLAYERONOFF: Life_Checkbox {
	tooltip = "This setting dictates whether or not your name tag will be displayed above your head.";
	idc = IDC_SETTINGS_PLYBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['player',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.355 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class INVISIBLEHeader: Life_RscText {
	idc = IDC_SETTINGS_IBTXT;
	text = "Invisible Backpack";
	colorBackground[] = {0,0,0,1};
    x = 0.396 * safezoneW + safezoneX;
    y = 0.355 * safezoneH + safezoneY;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class INVISIBLEONOFF: Life_Checkbox {
	tooltip = "Locally hides your backpack";
	idc = IDC_SETTINGS_IBBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['invisible',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.505656 * safezoneW + safezoneX;
    y = 0.355 * safezoneH + safezoneY;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class ALLIANCEHeader: Life_RscText {
	idc = IDC_SETTINGS_ALLIANCETXT;
	text = "Ignore Requests";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.38 * safezoneH + safezoneY‬;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class ALLIANCEONOFF: Life_Checkbox {
	tooltip = "Ignores alliance requests from other groups.";
	idc = IDC_SETTINGS_ALLIANCEBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['alliance',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.38 * safezoneH + safezoneY‬;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class STREAMERHeader: Life_RscText {
	idc = IDC_SETTINGS_STREAMERTXT;
	text = "Streamer Mode";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.405 * safezoneH + safezoneY‬;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class STREAMERONOFF: Life_Checkbox {
	tooltip = "Hides various things for content creators.";
	idc = IDC_SETTINGS_STREAMERBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['streamer',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.405 * safezoneH + safezoneY‬;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class LOWDETAILHEADER: Life_RscText {
	idc = IDC_SETTINGS_LDTXT;
	text = "Low Detail Mode";
	colorBackground[] = {0,0,0,1};
    x = 0.396 * safezoneW + safezoneX;
    y = 0.38 * safezoneH + safezoneY‬;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class LOWDETAILONOFF: Life_Checkbox {
	tooltip = "Hides grass, may improve performance.";
	idc = IDC_SETTINGS_LDBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['lowdetail',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.505656 * safezoneW + safezoneX;
    y = 0.38 * safezoneH + safezoneY‬;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class GROUPICONHEADER: Life_RscText {
	idc = IDC_SETTINGS_GROUPTXT;
	text = "Disable Group Icons";
	colorBackground[] = {0,0,0,1};
    x = 0.396 * safezoneW + safezoneX;
    y = 0.405 * safezoneH + safezoneY‬;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class GROUPICONONOFF: Life_Checkbox {
	tooltip = "Hides group hexagons.";
	idc = IDC_SETTINGS_GROUPBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['group',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.505656 * safezoneW + safezoneX;
    y = 0.405 * safezoneH + safezoneY‬;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class NOTIFYHeader: Life_RscText {
	idc = IDC_SETTINGS_NOTIFYTXT;
	text = "Disable Notification Sound";
	colorBackground[] = {0,0,0,1};
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.43 * safezoneH + safezoneY‬;
    w = 0.103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class NOTIFYONOFF: Life_Checkbox {
	tooltip = "Disables the sound from notifications.";
	idc = IDC_SETTINGS_NOTIFYBOX;
	sizeEx = 0.04;
	onCheckedChanged = "['notify',_this select 1] call life_fnc_s_onCheckedChange;";
    x = 0.382406 * safezoneW + safezoneX;
    y = 0.43 * safezoneH + safezoneY‬;
    w = 0.0103125 * safezoneW;
    h = 0.022 * safezoneH;
};

class BGHeader: Life_RscText {
	idc = IDC_SETTINGS_BGTXT;
	text = "Tablet Background";
	colorBackground[] = {0,0,0,1};
    x = 0.525781 * safezoneW + safezoneX;
    y = 0.368 * safezoneH + safezoneY‬;
    w = 0.108281 * safezoneW;
    h = 0.022 * safezoneH;
};

class BGDropdown: PHXCombos {
    idc = IDC_SETTINGS_BGDROP;
    text = "";
    x = 0.639219 * safezoneW + safezoneX;
    y = 0.368 * safezoneH + safezoneY;
    w = 0.0825 * safezoneW;
    h = 0.022 * safezoneH;
};

class BGButton : Life_RscButtonMenu {
	idc = IDC_SETTINGS_BGBUT;
	x = 0.525781 * safezoneW + safezoneX;
	y = safeZoneY + safeZoneH * 0.393;
	w = 0.108281 * safezoneW;
	h = safeZoneH * 0.022;
	text = "SET BACKGROUND";
	onButtonClick = "[] call PHX_fnc_changeBackground;";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class NTHeader: Life_RscText {
	idc = IDC_SETTINGS_NTTXT;
	text = "Prestige Nametag Colour";
	colorBackground[] = {0,0,0,1};
    x = 0.525781 * safezoneW + safezoneX;
    y = 0.418 * safezoneH + safezoneY‬;
    w = 0.108281 * safezoneW;
    h = 0.022 * safezoneH;
};

class NTDropdown: PHXCombos {
    idc = IDC_SETTINGS_NTDROP;
    text = "";
    x = 0.639219 * safezoneW + safezoneX;
    y = 0.418 * safezoneH + safezoneY;
    w = 0.0825 * safezoneW;
    h = 0.022 * safezoneH;
};

class NTButton : Life_RscButtonMenu {
	idc = IDC_SETTINGS_NTBUT;
	x = 0.525781 * safezoneW + safezoneX;
	y = safeZoneY + safeZoneH * 0.443;
	w = 0.108281 * safezoneW;
	h = safeZoneH * 0.022;
	text = "SET NAMETAG COLOUR";
	onButtonClick = "PHX_NameColour = (parseSimpleArray (lbData[24342,(lbCurSel 24342)])); profileNamespace setVariable['nameColour', PHX_NameColour]; player setVariable ['nameColour', PHX_NameColour, true];";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class TAGButtons : Life_RscButtonMenu {
	idc = IDC_SETTINGS_TAGBUT;
	x = safeZoneX + safeZoneW * 0.639219;
	y = safeZoneY + safeZoneH * 0.518;
	w = safeZoneW * 0.0825;
	h = safeZoneH * 0.022;
	text = "SET NAMETAG";
	onButtonClick = "[] spawn PHX_fnc_setTag";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};
