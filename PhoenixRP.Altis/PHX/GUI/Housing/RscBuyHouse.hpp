class RscBuyHouse {
    idd = 6900;
    name = "RscBuyHouse";
    movingEnable = 0;
    enableSimulation = 1;
	onLoad = "if (isNil {(group player) getVariable ""gang_owner""}) then {[cursorObject, false] call PHX_fnc_buyHouse;} else {if (typeOf (cursorObject) isEqualTo ""Land_i_Shed_Ind_F"") then {[cursorObject, true] call PHX_fnc_buyHouse;};};";
	
	class ControlsBackground {
		class Title: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.40333334;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.02222223;
			text = "Purchase House";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			moving = true;
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.42555556;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.08555556;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.428125;
			y = safeZoneY + safeZoneH * 0.51111112;
			w = safeZoneW * 0.1625;
			h = safeZoneH * 0.02777778;
			colorBackground[] = {0.102,0.102,0.102,1};
		};
	};

	class Controls {

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.575;
			y = safeZoneY + safeZoneH * 0.40333334;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
            style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
            text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
            onButtonClick = "closeDialog 0;";
            colorBackground[] = {0,0,0,1};
            colorFocused[] = {0.09,0.09,0.09,1};
            colorBackgroundActive[] = {0.03,0.03,0.03,1};
            sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};

		class Text: Life_RscStructuredText {
			idc = 6901;
			x = safeZoneX + safeZoneW * 0.43125;
			y = safeZoneY + safeZoneH * 0.43222223;
			w = safeZoneW * 0.156875;
			h = safeZoneH * 0.07;
			text = "<t font='RobotoCondensedLight'>Who would you like to purchase this house for?</t>";
		};

		class Gang: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.43;
			y = safeZoneY + safeZoneH * 0.51433334;
			w = safeZoneW * 0.078125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "GANG";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			onButtonClick = "[cursorObject, true] call PHX_fnc_buyHouse;";
			font = "PuristaLight";
		};

		class Myself: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.510625;
			y = safeZoneY + safeZoneH * 0.51433334;
			w = safeZoneW * 0.078125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "MYSELF";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			onButtonClick = "[cursorObject, false] call PHX_fnc_buyHouse;";
			font = "PuristaLight";
		};
	};
};