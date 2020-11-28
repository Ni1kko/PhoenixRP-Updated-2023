class PageWantedTitle : Life_RscText {
    idc = IDC_WANTED_TITLE;
    text = "Police National Computer";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseWantedButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_WANTED_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class CitizensHeader : Life_RscText {
	idc = IDC_WANTED_PEOPLE_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Citizens";
	x = 0.283437 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};

class CitizensSearch : Life_RscEdit {
	idc = IDC_WANTED_SEARCH;
	text = "";
	colorBackground[] = {0,0,0,1};
	x = 0.283437 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.022 * safezoneH;
};

class SearchWantedButton: Life_RscButtonMenuIcon
{
	idc = IDC_WANTED_SEACH_BUTTON;
	text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
	x = 0.381406 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0, 0, 0, 1};
	tooltip = "Search Citizens";
	OnButtonClick = "";
};

class CitizensList: Life_RscListBox {
    idc = IDC_WANTED_PEOPLE;
	sizeEx = 0.030;
    x = 0.283437 * safezoneW + safezoneX;
    y = 0.324 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.382 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class RequestButton : Life_RscButtonMenu {
	idc = IDC_WANTED_REQUEST;
	x = safeZoneX + safeZoneW * 0.283437;
	y = safeZoneY + safeZoneH * 0.709;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "Request Record";
	onButtonClick = "call life_fnc_wantedGrab";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class RecordHeader : Life_RscText {
	idc = IDC_WANTED_RECORD_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Criminal Record";
	x = 0.402031 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};

class RecordList: Life_RscListBox {
    idc = IDC_WANTED_RECORD_LIST;
	sizeEx = 0.030;
    x = 0.40203 * safezoneW + safezoneX;
    y = 0.302 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.405 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class PardonButton : Life_RscButtonMenu {
	idc = IDC_WANTED_PARDON;
	x = safeZoneX + safeZoneW * 0.402031;
	y = safeZoneY + safeZoneH * 0.709;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "Pardon Crime";
	onButtonClick = "call life_fnc_pardon";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class CrimesHeader : Life_RscText {
	idc = IDC_WANTED_RECORD_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Crimes";
	x = 0.520625 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.0928125 * safezoneW;
	h = 0.022 * safezoneH;
};

class CrimesList: Life_RscListBox {
    idc = IDC_WANTED_CRIME_LIST;
	sizeEx = 0.030;
    x = 0.520625 * safezoneW + safezoneX;
    y = 0.302 * safezoneH + safezoneY;
    w = 0.0928125 * safezoneW;
    h = 0.405 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class AddButton : Life_RscButtonMenu {
	idc = IDC_WANTED_ADD;
	x = safeZoneX + safeZoneW * 0.520625;
	y = safeZoneY + safeZoneH * 0.709;
	w = safeZoneW * 0.0928125;
	h = safeZoneH * 0.022;
	text = "Add Crime";
	onButtonClick = "call life_fnc_wantedAddP";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class VehicleHeader : Life_RscText {
	idc = IDC_WANTED_RECORD_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Vehicle Lookup";
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.022 * safezoneH;
};

class RegInput : Life_RscEdit {
	idc = IDC_WANTED_REG;
	text = "";
	colorBackground[] = {0,0,0,1};
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0825 * safezoneW;
	h = 0.022 * safezoneH;
};

class RegButton: Life_RscButtonMenuIcon
{
	idc = IDC_WANTED_REGBUT;
	text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
	x = 0.701094 * safezoneW + safezoneX;
	y = 0.302 * safezoneH + safezoneY;
	w = 0.0154688 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {0, 0, 0, 1};
	tooltip = "Search Registration";
	OnButtonClick = "call PHX_fnc_vehLookup";
};

class VehInfo : Life_RscStructuredText{
	idc = IDC_WANTED_VEH_INFO;
	x = 0.618594 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.0979687 * safezoneW;
	h = 0.382 * safezoneH;
	style = 0;
	text = "";
	colorBackground[] = {0, 0, 0, 1};
};

class ANPRButton : Life_RscButtonMenu {
	idc = IDC_WANTED_ANPR;
	x = safeZoneX + safeZoneW * 0.618594;
	y = safeZoneY + safeZoneH * 0.709;
	w = safeZoneW * 0.0979687;
	h = safeZoneH * 0.022;
	text = "Last ANPR";
	onButtonClick = "ctrlSetText [24410, PHX_Last_ANPR]";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};