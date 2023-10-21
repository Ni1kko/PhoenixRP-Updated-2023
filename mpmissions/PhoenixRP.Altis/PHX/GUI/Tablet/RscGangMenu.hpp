class PageGangTitle : Life_RscText {
    idc = IDC_GANG_TITLE;
    text = "Gang Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseGangButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_GANG_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class LeaveButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[] spawn PHX_fnc_gangLeave";
    idc = IDC_GANG_LEAVE;
    x = 0.690781 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Leave Group"; 
    text = "a3\ui_f\data\igui\Cfg\simpleTasks\types\exit_ca.paa";
};

class UpgradeButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[] spawn PHX_fnc_gangUpgrade";
    idc = IDC_GANG_UPGRADE;
    x = 0.675312 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Upgrade Slots"; 
    text = "\a3\3den\Data\CfgWaypoints\transportUnload_ca.paa";
};

class DisbandButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[] spawn PHX_fnc_gangDisband";
    idc = IDC_GANG_DISBAND;
    x = 0.659844 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Disband Group"; 
    text = "\a3\3den\Data\CfgWaypoints\dismiss_ca.paa";
};

class MembersHeader : Life_RscText {
	idc = IDC_GANG_MEMBERS_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Members";
	x = 0.278281 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.165 * safezoneW;
	h = 0.022 * safezoneH;
};

class MembersList: Life_RscListBox {
    idc = IDC_GANG_MEMBERS;
	sizeEx = 0.030;
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.302 * safezoneH + safezoneY;
    w = 0.165 * safezoneW;
    h = 0.346 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class RankSwap: PHXCombos {
    idc = IDC_GANG_RANK_DROPDOWN;
    text = "";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.647 * safezoneH + safezoneY;
    w = 0.165 * safezoneW;
    h = 0.022 * safezoneH;
};

class RankButton : Life_RscButtonMenu {
	idc = IDC_GANG_RANK;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.672;
	w = safeZoneW * 0.165;
	h = safeZoneH * 0.022;
	text = "SET NEW RANK";
	onButtonClick = "[] spawn PHX_fnc_gangRank";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class LeaderButton : Life_RscButtonMenu {
	idc = IDC_GANG_LEADER;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.696;
	w = safeZoneW * 0.165;
	h = safeZoneH * 0.022;
	text = "SET AS LEADER";
	onButtonClick = "[] spawn PHX_fnc_gangNewLeader";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class KickButton : Life_RscButtonMenu {
	idc = IDC_GANG_KICK;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.72;
	w = safeZoneW * 0.165;
	h = safeZoneH * 0.022;
	text = "KICK MEMBER";
	onButtonClick = "[] spawn PHX_fnc_gangKick";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class AlliesHeader : Life_RscText {
	idc = IDC_GANG_ALLIES_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Allied Groups";
	x = 0.448438 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.022 * safezoneH;
};

class AlliesList: Life_RscListBox {
    idc = IDC_GANG_ALLIES;
	sizeEx = 0.030;
    x = 0.448438 * safezoneW + safezoneX;
    y = 0.302 * safezoneH + safezoneY;
    w = 0.154687 * safezoneW;
    h = 0.416 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class RemoveAllyButton : Life_RscButtonMenu {
	idc = IDC_GANG_ALLY_REMOVE;
	x = safeZoneX + safeZoneW * 0.448438;
	y = safeZoneY + safeZoneH * 0.72;
	w = safeZoneW * 0.154687;
	h = safeZoneH * 0.022;
	text = "END ALLIANCE";
	onButtonClick = "[] spawn PHX_fnc_endAlliance";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class SelectionHeader : Life_RscText {
	idc = IDC_GANG_SELLIST_HEADER;
	colorBackground[] = {0,0,0,1};
	text = "Players";
	x = 0.608281 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.113437 * safezoneW;
	h = 0.022 * safezoneH;
};

class SelectionList: Life_RscListBox {
    idc = IDC_GANG_SELLIST;
	sizeEx = 0.030;
    x = 0.608281 * safezoneW + safezoneX;
    y = 0.302 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.209 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class SelectionSwap: PHXCombos {
    idc = IDC_GANG_SELLIST_SWAP;
    text = "";
    x = 0.608281 * safezoneW + safezoneX;
    y = 0.511 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.022 * safezoneH;
};

class InviteButton : Life_RscButtonMenu {
	idc = IDC_GANG_INVITE;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.535;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "INVITE PLAYER";
	onButtonClick = "";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class TagButton : Life_RscButtonMenu {
	idc = IDC_GANG_TAG;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.56;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "SET GROUP TAG";
	onButtonClick = "[] spawn PHX_fnc_setPrefix";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class MessageButton : Life_RscButtonMenu {
	idc = IDC_GANG_MESSAGE;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.585;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "SET GROUP MESSAGE";
	onButtonClick = "[] spawn PHX_fnc_setMessage";
	toolTip = "Sets the message received when group members spawn in";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class RenameButton : Life_RscButtonMenu {
	idc = IDC_GANG_RENAME;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.61;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "RENAME GROUP";
	onButtonClick = "[] spawn PHX_fnc_renameGang";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class PermissionsButton : Life_RscButtonMenu {
	idc = IDC_GANG_PERMS;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.635;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "EDIT PERMISSIONS";
	onButtonClick = "[24200, ""Group Permissions""] call PHX_fnc_switchApp";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class TaxButton : Life_RscButtonMenu {
	idc = IDC_GANG_TAX;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.66;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "SET GROUP TAX";
	onButtonClick = "[] spawn PHX_fnc_setGangTax";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class LevelsButton : Life_RscButtonMenu {
	idc = IDC_GANG_PERKS;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.685;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "GROUP PERKS";
	onButtonClick = "[24500, ""Group Perks""] call PHX_fnc_switchApp";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class GangBank : Life_RscStructuredText {
	idc = IDC_GANG_BANK;
	x = safeZoneX + safeZoneW * 0.608281;
	y = safeZoneY + safeZoneH * 0.712;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.03;
	style = 2;
	text = "";
	size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	colorBackground[] = {1,1,1,0};
};


class PageCreateGangTitle : Life_RscText {
    idc = IDC_CREATE_GANG_TITLE;
    text = "Gang Creation Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseCreateGangButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[23100, ""Home""] call PHX_fnc_switchApp;";
    idc = IDC_CREATE_GANG_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class CreateGangText: Life_RscEdit {
	idc = IDC_CREATE_GANG_NAME;
	text = "Your Group Name";
	x = 0.335 * safezoneW + safezoneX;
    y = 0.45 * safezoneH + safezoneY;
    w = 0.33 * safezoneW;
    h = 0.044 * safezoneH;
};

class CreateGangButton : Life_RscButtonMenu {
	idc = IDC_CREATE_GANG_BTN;
	x = safeZoneX + safeZoneW * 0.427813;
	y = safeZoneY + safeZoneH * 0.54;
	w = safeZoneW * 0.144375;
	h = safeZoneH * 0.022;
	text = "CREATE GROUP";
	onButtonClick = "[] call PHX_fnc_createGang";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class PageRankGangTitle : Life_RscText {
    idc = IDC_GANG_RANKS_TITLE;
    text = "Group Permissions Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class CloseRankGangButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[24000, ""Group""] call PHX_fnc_switchApp;";
    idc = IDC_GANG_RANKS_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class RanksList: Life_RscListBox {
    idc = IDC_GANG_RANKS_LIST;
	sizeEx = 0.030;
    x = 0.27828 * safezoneW + safezoneX;
    y = 0.28 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.315 * safezoneH;
    colorBackground[] = {0,0,0,0.6};
};

class levelEdit: Life_RscEdit {
    idc = IDC_GANG_RANKS_EDIT;
    text = "0";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.597 * safezoneH + safezoneY;
    w = 0.071 * safezoneW;
    h = 0.022 * safezoneH;
};

class levelButton : Life_RscButtonMenu {
	idc = IDC_GANG_RANKS_BTN;
	x = safeZoneX + safeZoneW * 0.350469;
	y = safeZoneY + safeZoneH * 0.597;
	w = safeZoneW * 0.04125;
	h = safeZoneH * 0.022;
	text = "INDEX";
	onButtonClick = "[""index""] call PHX_fnc_rankUpdate";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class nameEdit: Life_RscEdit {
    idc = IDC_GANG_RANKS_NAME_EDIT;
    text = "";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.623 * safezoneH + safezoneY;
    w = 0.113437 * safezoneW;
    h = 0.022 * safezoneH;
};

class nameButton : Life_RscButtonMenu {
	idc = IDC_GANG_RANKS_NAME_BTN;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.647;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "RENAME RANK";
	onButtonClick = "[""rename""] call PHX_fnc_rankUpdate";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class deleteRnkButton : Life_RscButtonMenu {
	idc = IDC_GANG_RANKS_DLT_BTN;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.672;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "DELETE RANK";
	onButtonClick = "[""delete""] call PHX_fnc_rankUpdate";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class saveButton : Life_RscButtonMenu {
	idc = IDC_GANG_RANKS_SVE_BTN;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.696;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "SAVE PERMISSIONS";
	onButtonClick = "[""savePerms""] call PHX_fnc_rankUpdate";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class createButton : Life_RscButtonMenu {
	idc = IDC_GANG_RANKS_CRT_BTN;
	x = safeZoneX + safeZoneW * 0.278281;
	y = safeZoneY + safeZoneH * 0.72;
	w = safeZoneW * 0.113437;
	h = safeZoneH * 0.022;
	text = "CREATE RANK";
	onButtonClick = "[""create""] call PHX_fnc_rankUpdate";
	borderSize = 0;
	colorBackground[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1};
	font = "PuristaLight";
	sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
};

class InviteBox : Life_Checkbox {
	idc = IDC_GANG_RANKS_INV_BOX;
	onCheckedChanged = "";
	x = safeZoneX + safeZoneW * 0.396875;
	y = safeZoneY + safeZoneH * 0.297;
	w = safeZoneW * 0.020625;
	h = safeZoneH * 0.033;
};

class InviteText : Life_RscText {
	idc = IDC_GANG_RANKS_INV_TXT;
	text = "Allow this rank to invite people";
	colorBackground[] = {0, 0, 0, 0.5};
	x = safeZoneX + safeZoneW * 0.422656;
	y = safeZoneY + safeZoneH * 0.302;
	w = safeZoneW * 0.141594;
	h = safeZoneH * 0.022;
};

class KickBox : Life_Checkbox {
	idc = IDC_GANG_RANKS_KIC_BOX;
	onCheckedChanged = "";
	x = safeZoneX + safeZoneW * 0.567031;
	y = safeZoneY + safeZoneH * 0.297;
	w = safeZoneW * 0.020625;
	h = safeZoneH * 0.033;
};

class KickText : Life_RscText {
	idc = IDC_GANG_RANKS_KIC_TXT;
	text = "Allow this rank to kick people";
	colorBackground[] = {0, 0, 0, 0.5};
	x = safeZoneX + safeZoneW * 0.592812;
	y = safeZoneY + safeZoneH * 0.302;
	w = safeZoneW * 0.141594;
	h = safeZoneH * 0.022;
};

class PromoteBox : Life_Checkbox {
	idc = IDC_GANG_RANKS_PRO_BOX;
	onCheckedChanged = "";
	x = safeZoneX + safeZoneW * 0.396875;
	y = safeZoneY + safeZoneH * 0.346;
	w = safeZoneW * 0.020625;
	h = safeZoneH * 0.033;
};

class PromoteText : Life_RscText {
	idc = IDC_GANG_RANKS_PRO_TXT;
	text = "Allow this rank to promote / demote";
	colorBackground[] = {0, 0, 0, 0.5};
	x = safeZoneX + safeZoneW * 0.422656;
	y = safeZoneY + safeZoneH * 0.352;
	w = safeZoneW * 0.141594;
	h = safeZoneH * 0.022;
};

class UpgradeBox : Life_Checkbox {
	idc = IDC_GANG_RANKS_UPG_BOX;
	onCheckedChanged = "";
	x = safeZoneX + safeZoneW * 0.567031;
	y = safeZoneY + safeZoneH * 0.346;
	w = safeZoneW * 0.020625;
	h = safeZoneH * 0.033;
};

class UpgradeText : Life_RscText {
	idc = IDC_GANG_RANKS_UPG_TXT;
	text = "Allow this rank to upgrade slots";
	colorBackground[] = {0, 0, 0, 0.5};
	x = safeZoneX + safeZoneW * 0.592812;
	y = safeZoneY + safeZoneH * 0.352;
	w = safeZoneW * 0.141594;
	h = safeZoneH * 0.022;
};

class TaxBox : Life_Checkbox {
	idc = IDC_GANG_RANKS_TAX_BOX;
	onCheckedChanged = "";
	x = safeZoneX + safeZoneW * 0.396875;
	y = safeZoneY + safeZoneH * 0.395;
	w = safeZoneW * 0.020625;
	h = safeZoneH * 0.033;
};

class TaxText : Life_RscText {
	idc = IDC_GANG_RANKS_TAX_TXT;
	text = "Allows this rank to not pay group tax";
	colorBackground[] = {0, 0, 0, 0.5};
	x = safeZoneX + safeZoneW * 0.422656;
	y = safeZoneY + safeZoneH * 0.402;
	w = safeZoneW * 0.141594;
	h = safeZoneH * 0.022;
};

class PagePerkGangTitle : Life_RscText {
    idc = IDC_GANG_PERKS_TITLE;
    text = "Group Perks Menu";
    x = 0.278281 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.201094 * safezoneW;
    h = 0.022 * safezoneH;
};

class ClosePerkGangButton: Life_RscButtonMenuIcon
{
    onButtonClick = "[24000, ""Group""] call PHX_fnc_switchApp;";
    idc = IDC_GANG_PERKS_CLOSE;
    x = 0.70625 * safezoneW + safezoneX;
    y = 0.247 * safezoneH + safezoneY;
    w = 0.0154688 * safezoneW;
    h = 0.022 * safezoneH;
    colorText[] = {1,1,1,1};
    colorBackground[] = {0,0,0,0};
    tooltip = "Return"; 
    text = "a3\ui_f\data\gui\Rsc\RscDisplayArcadeMap\icon_exit_cross_ca.paa";
};

class XP_BAR_Background: Life_RscBackground
{
	idc = IDC_GANG_PERKS_PROG_BACK;
	x = 0.283437 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.433125 * safezoneW;
	h = 0.055 * safezoneH;
	colorBackground[] = {0.1,0.1,0.1,0.8};
};

class XP_BAR: PHX_RscProgress
{
	idc = IDC_GANG_PERKS_PROG;
	x = 0.283437 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.433125 * safezoneW;
	h = 0.055 * safezoneH;
	colorText[] = {1, 1, 1, 1};
	colorBackground[] = {0, 0, 0, 0};
	colorBar[] = {0,0,0,0.5};
};

class XP_TEXT: Life_RscStructuredText
{
	idc = IDC_GANG_PERKS_PROG_TEXT;
	text = "";
	x = 0.283437 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.433125 * safezoneW;
	h = 0.055 * safezoneH;
};

class ActivePerksTitle : Life_RscStructuredText {
    idc = IDC_GANG_PERKS_ACTIVE_TITLE;
    text = "Active Perks <t align='right'>(0/0)</t>";
    x = 0.283437 * safezoneW + safezoneX;
    y = 0.346 * safezoneH + safezoneY;
    w = 0.433125 * safezoneW;
    h = 0.022 * safezoneH;
};

class GangPerksView : Life_RscControlsGroup {
    idc = IDC_GANG_PERKS_VIEW;
    x = 0.278281 * safezoneW + safezoneX;
	y = 0.376 * safezoneH + safezoneY;
	w = 0.443438 * safezoneW;
	h = 0.338 * safezoneH;
    colorBackground[] = {0, 0, 0, 0};
	colorFrame[] = {0,0,0,1};
    class Controls {};
};

class RemovalGangInfo : Life_RscStructuredText {
    idc = IDC_GANG_PERKS_REMOVE_INFO;
    text = "<t align='center'>Removal Cost: <t color = '#8A2BE2'>£10,000</t></t>";
    x = 0.283437 * safezoneW + safezoneX;
    y = 0.72 * safezoneH + safezoneY;
    w = 0.433125 * safezoneW;
    h = 0.022 * safezoneH;
};