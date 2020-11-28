class RscDisputing {
    idd = 9000;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "";

    class ControlsBackground {
		class Title: Life_RscText{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39125;
			y = safeZoneY + safeZoneH * 0.34444445;
			w = safeZoneW * 0.2375;
			h = safeZoneH * 0.02222223;
			text = "Dispute";
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			moving = true;	
		};

		class Background: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39125;
			y = safeZoneY + safeZoneH * 0.36666667;
			w = safeZoneW * 0.2375;
			h = safeZoneH * 0.23444445;
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Footer: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.39125;
			y = safeZoneY + safeZoneH * 0.60111112;
			w = safeZoneW * 0.2375;
			h = safeZoneH * 0.02777778;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class MessageBackground: Life_RscText {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.518125;
			y = safeZoneY + safeZoneH * 0.37333334;
			w = safeZoneW * 0.106875;
			h = safeZoneH * 0.07555556;
			colorBackground[] = {0.102,0.102,0.102,1};
		};

		class Message: Life_RscStructuredText {
			type = 13;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.518125;
			y = safeZoneY + safeZoneH * 0.37444445;
			w = safeZoneW * 0.10625;
			h = safeZoneH * 0.07333334;
			text = "<t font='RobotoCondensedLight' size='1' align='center'>This system is logged and every admin is able to view every dispute. Abuse of this system will result in direct punishment.</t>";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
	};

    class Controls {
       class PlayerList: Life_RscListBox {
			idc = 9001;
			x = safeZoneX + safeZoneW * 0.395625;
			y = safeZoneY + safeZoneH * 0.39777778;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.19555556;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {1,1,1,1};
			colorSelect[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DisputeList: Life_RscListBox {
			idc = 9002;
			x = safeZoneX + safeZoneW * 0.518125;
			y = safeZoneY + safeZoneH * 0.47444445;
			w = safeZoneW * 0.106875;
			h = safeZoneH * 0.09444445;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorDisabled[] = {1,1,1,1};
			colorSelect[] = {1,1,1,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DisputeSent: Life_RscButton {
			idc = 9004;
			style = 2;
			text = "SENT";
			x = safeZoneX + safeZoneW * 0.518125;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.053125;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			onButtonClick = "true call PHX_fnc_switchDisputes; ctrlEnable [9004,false]; ctrlEnable [9005,true]";
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class EnterReason: Life_RscEdit {
			idc = 9003;
			x = safeZoneX + safeZoneW * 0.518125;
			y = safeZoneY + safeZoneH * 0.57111112;
			w = safeZoneW * 0.106875;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0.102,0.102,0.102,1};
			colorText[] = {1,1,1,1};
			tooltip = "Enter reason for dispute";
			text = "";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DisputeReceived: Life_RscButton {
			idc = 9005;
			style = 2;
			text = "RECEIVED";
			x = safeZoneX + safeZoneW * 0.571875;
			y = safeZoneY + safeZoneH * 0.45;
			w = safeZoneW * 0.053125;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			onButtonClick = "false call PHX_fnc_switchDisputes; ctrlEnable [9005,false]; ctrlEnable [9004,true];";
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DisputeButton: Life_RscButton {
			idc = -1;
			style = 2;
			onButtonClick = "[] call PHX_fnc_disputePlayer";
			text = "DISPUTE";
			x = safeZoneX + safeZoneW * 0.539375;
			y = safeZoneY + safeZoneH * 0.60333334;
			w = safeZoneW * 0.0875;
			h = safeZoneH * 0.02222223;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Close: Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.613125;
			y = safeZoneY + safeZoneH * 0.34444445;
			w = safeZoneW * 0.015625;
			h = safeZoneH * 0.02222223;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
			onButtonClick = "closeDialog 0;";
			colorBackground[] = {0,0,0,1};
			colorFocused[] = {0.09,0.09,0.09,1};
			colorBackgroundActive[] = {0.03,0.03,0.03,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			tooltip = "Close";
		};

		class SearchBox:Life_RscEdit{
			idc = 9006;
			x = safeZoneX + safeZoneW * 0.395625;
			y = safeZoneY + safeZoneH * 0.37333334;
			w = safeZoneW * 0.105;
			h = safeZoneH * 0.02222223;
			text = "";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class ClearButton:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.50125;
			y = safeZoneY + safeZoneH * 0.37333334;
			w = safeZoneW * 0.014375;
			h = safeZoneH * 0.02222223;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			colorBackground[] = {0,0,0,1};
			colorFocused[] = {0.09,0.09,0.09,1};
			colorBackgroundActive[] = {0.03,0.03,0.03,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onButtonClick = "[9000, 9001, 9006, 'search'] call PHX_fnc_searchList;";
			text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
			tooltip = "Search";
		};
    };
};