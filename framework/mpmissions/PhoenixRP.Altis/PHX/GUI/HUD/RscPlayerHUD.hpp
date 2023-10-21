#include "macros.hpp"

class RscPlayerHUD {
	idd = -1;
	duration = 10e10;
	movingEnable = 0;
	fadein = 0;
	fadeout = 0;
	name = "RscPlayerHUD";
	onLoad = "uiNamespace setVariable ['RscPlayerHUD',_this select 0]";
	objects[] = {};
	controls[] = {
		LIFE_BAR_FOOD_BACK,
		LIFE_BAR_WATER_BACK,
		LIFE_BAR_HEALTH_BACK,
		LIFE_BAR_XP_BACK,
		LIFE_BAR_FOOD,
		LIFE_BAR_WATER,
		LIFE_BAR_HEALTH,
		LIFE_BAR_XP,
		LIFE_FOOD_TEXT,
		LIFE_WATER_TEXT,
		LIFE_HEALTH_TEXT,
		LIFE_CASH_TEXT,
		LIFE_XP_TEXT
	};

	/* Background */
	
	class LIFE_BAR_FOOD_BACK: Life_RscBackground
	{
		idc = IDC_LIFE_BAR_FOOD_BACK;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.944 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.1,0.1,0.1,0.4};
	};
	
	class LIFE_BAR_WATER_BACK: Life_RscBackground
	{
		idc = IDC_LIFE_BAR_WATER_BACK;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.97 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.1,0.1,0.1,0.4};
	};
	
	class LIFE_BAR_HEALTH_BACK: Life_RscBackground
	{
		idc = IDC_LIFE_BAR_HEALTH_BACK;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.918 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.1,0.1,0.1,0.4};
	};

	class LIFE_BAR_XP_BACK: Life_RscBackground
	{
		idc = IDC_LIFE_BAR_XP_BACK;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.892 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorBackground[] = {0.1,0.1,0.1,0.4};
	};

	/* Progress Bars */
	
	class LIFE_BAR_FOOD: PHX_RscProgress
	{
		idc = IDC_LIFE_BAR_FOOD;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.944 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0, 0, 0, 0};
		colorBar[] = {0,0,0,0.2};
	};
	
	class LIFE_BAR_WATER: PHX_RscProgress
	{
		idc = IDC_LIFE_BAR_WATER;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.97 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0, 0, 0, 0};
		colorBar[] = {0,0,0,0.2};
	};
	
	class LIFE_BAR_HEALTH: PHX_RscProgress
	{
		idc = IDC_LIFE_BAR_HEALTH;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.918 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0, 0, 0, 0};
		colorBar[] = {0,0,0,0.2};
	};

	class LIFE_BAR_XP: PHX_RscProgress
	{
		idc = IDC_LIFE_BAR_XP;
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.892 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
		colorText[] = {1, 1, 1, 1};
		colorBackground[] = {0, 0, 0, 0};
		colorBar[] = {0,0,0,0.2};
	};

	/* Text */
	
	class LIFE_FOOD_TEXT: Life_RscStructuredText
	{
		idc = IDC_LIFE_FOOD_TEXT;
		text = "";
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.944 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
	};
	
	class LIFE_WATER_TEXT: Life_RscStructuredText
	{
		idc = IDC_LIFE_WATER_TEXT;
		text = "";
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.97 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
	};
	
	class LIFE_HEALTH_TEXT: Life_RscStructuredText
	{
		idc = IDC_LIFE_HEALTH_TEXT;
		text = "";
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.918 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
	};
	
	/* Other */

	class LIFE_CASH_TEXT: Life_RscStructuredText
	{
		idc = IDC_LIFE_CASH_TEXT;
		text = "";
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.866 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
	};

	class LIFE_XP_TEXT: Life_RscStructuredText
	{
		idc = IDC_LIFE_XP_TEXT;
		text = "0 / 0";
		x = 0.845469 * safezoneW + safezoneX;
		y = 0.892 * safezoneH + safezoneY;
		w = 0.149531 * safezoneW;
		h = 0.022 * safezoneH;
	};
};