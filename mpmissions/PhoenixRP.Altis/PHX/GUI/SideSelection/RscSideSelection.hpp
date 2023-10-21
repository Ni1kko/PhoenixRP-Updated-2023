class RscSideSelection {
    idd = 54000;
    movingEnable = false;
    enableSimulation = true;
    onload = "";

    class ControlsBackground {};

	class Controls {
		class ButtonCivilian : Life_RscButtonMenu {
			idc = -1;
			onButtonClick = "PHX_MySide = ""Civilian"";";
			style = 2;
			text = "<br/><br/><br/><img image='\a3\ui_f\data\GUI\Rsc\RscDisplayMain\profile_player_ca.paa' align='center' size='5' /> <br/><br/> <t align = 'center'>Civilian</t>";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.3625 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.275 * safezoneH;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.15, 0.15, 0.15, 0.7};
			tooltip = "Choose the civilian life.";
		};

		class ButtonHSS : Life_RscButtonMenu {
			idc = 54100;
			onButtonClick = "PHX_MySide = ""HSS"";";
			style = 2;
			text = "<br/><br/><br/><img image='data\ui\HSS.paa' align='center' size='5' /> <br/><br/> <t align = 'center'>HAVOC Secret Service</t>";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.3625 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.275 * safezoneH;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.15, 0.15, 0.15, 0.7};
			tooltip = "Choose the undercover life.";
		};

		class ButtonCID : Life_RscButtonMenu {
			idc = 54200;
			onButtonClick = "PHX_MySide = ""CID"";";
			style = 2;
			text = "<br/><br/><br/><img image='data\ui\MI5.paa' align='center' size='5' /> <br/><br/> <t align = 'center'>CID</t>";
			x = 0.510312 * safezoneW + safezoneX;
			y = 0.3625 * safezoneH + safezoneY;
			w = 0.144375 * safezoneW;
			h = 0.275 * safezoneH;
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0.15, 0.15, 0.15, 0.7};
			tooltip = "Choose the undercover life.";
		};
    };
};