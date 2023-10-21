class RscATM {
    idd = 2700;
    name= "RscATM";
    movingEnable = 0;
    enableSimulation = 1;

	class ControlsBackground{
		class Background:Life_RscText{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.43625;
			y = safeZoneY + safeZoneH * 0.32888889;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.39833334;
			colorBackground[] = {0.16,0.16,0.16,1};
		};

		class Top:Life_RscTitle{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.43625;
			y = safeZoneY + safeZoneH * 0.30777778;
			w = safeZoneW * 0.1375;
			h = safeZoneH * 0.022;
			style = 0;
			text = "ATM";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			moving = true;
		};
	};

	class Controls {
		class Input_Cash:PHXEdit {
			idc = 2702;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.41222223;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			text = "1";
			autocomplete = "";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorDisabled[] = {0.16,0.16,0.16,1};
			colorSelection[] = {0.16,0.16,0.16,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};
        
		class Withdraw:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.43888889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "WITHDRAW";
			onButtonClick = "[] call PHX_fnc_bankWithdraw";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Deposit:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.49;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "DEPOSIT";
			onButtonClick = "[] call PHX_fnc_bankDeposit";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DepositOne:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.0275;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "50k";
			tooltip = "Withdraw 50k";
			onButtonClick = "[50000] call PHX_fnc_bankWithdraw;";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DepositTwo:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.478125;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.0275;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "100k";
			tooltip = "Withdraw 100k";
			onButtonClick = "[100000] call PHX_fnc_bankWithdraw;";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DepositThree:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.50625;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.0275;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "250k";
			tooltip = "Withdraw 250k";
			onButtonClick = "[250000] call PHX_fnc_bankWithdraw;";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DepositFour:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.534375;
			y = safeZoneY + safeZoneH * 0.46444445;
			w = safeZoneW * 0.028125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "500k";
			tooltip = "Withdraw 500k";
			onButtonClick = "[500000] call PHX_fnc_bankWithdraw;";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class DepositAll:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.51666667;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "DEPOSIT ALL";
			tooltip = "Deposits all of your cash!";
			onButtonClick = "[PHX_Cash] call PHX_fnc_bankDeposit";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Players:PHXCombos{
			idc = 2703;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.54333334;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02333334;
			colorBackgroundActive[] = {0.721, 0, 0, 1};
			colorFocused[] = {0.09, 0.09, 0.09, 1};
			colorText[] = {0.8,0.8,0.8,1};
			colorBackground[] = {0,0,0,1};
			colorBackgroundDisabled[] = {0,0,0,1};
			font = "RobotoCondensedLight";
			maxHistoryDelay = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
			wholeHeight = 0.3;
			class ComboScrollBar : Life_RscScrollBar{};
		};

		class Tranfer:Life_RscButton{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.449375;
			y = safeZoneY + safeZoneH * 0.57222223;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "TRANSFER";
			onButtonClick = "[] call PHX_fnc_wireTransfer";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Withdraw_Gang:Life_RscButton{
			idc = 2705;
			x = safeZoneX + safeZoneW * 0.450625;
			y = safeZoneY + safeZoneH * 0.64555556;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "WITHDRAW GROUP";
			tooltip = "Group Leader Only!";
			onButtonClick = "[] call PHX_fnc_gangWithdraw";
			borderSize = 0;
			colorBackground[] = {0,0,0,1};
			colorBackgroundDisabled[] = {0.0574,0.0574,0.0574,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Deposit_Gang:Life_RscButton{
			idc = 2706;
			x = safeZoneX + safeZoneW * 0.45125;
			y = safeZoneY + safeZoneH * 0.67222223;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "DEPOSIT GROUP";
			tooltip = "Group Leader Only!";
			onButtonClick = "[] call PHX_fnc_gangDeposit";
			colorBackground[] = {0,0,0,1};
			colorBackgroundDisabled[] = {0.0574,0.0574,0.0574,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Transaction:Life_RscButton{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.45125;
			y = safeZoneY + safeZoneH * 0.6988889;
			w = safeZoneW * 0.1125;
			h = safeZoneH * 0.02222223;
			style = 2;
			text = "TRANSACTIONS";
			tooltip = "Shows last 100 transactions";
			onButtonClick = "[] call PHX_fnc_openTransactions";
			colorBackground[] = {0,0,0,1};
			colorBackgroundDisabled[] = {0.0574,0.0574,0.0574,1};
			colorText[] = {1,1,1,1};
			font = "PuristaLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class Icons:Life_RscStructuredText{
			idc = 2701;
			x = safeZoneX + safeZoneW * 0.453125;
			y = safeZoneY + safeZoneH * 0.3353334;
			w = safeZoneW * 0.106875;
			h = safeZoneH * 0.06555556;
			style = 2;
			text = "";
			font = "RobotoCondensedLight";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
		};

		class IconsGang:Life_RscStructuredText{
			idc = 2707;
			x = safeZoneX + safeZoneW * 0.453125;
			y = safeZoneY + safeZoneH * 0.598889;
			w = safeZoneW * 0.106875;
			h = safeZoneH * 0.03;
			style = 2;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
		};

		class Close:Life_RscButton{
			idc = -1;
			x = safeZoneX + safeZoneW * 0.558125;
			y = safeZoneY + safeZoneH * 0.30777778;
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
	};
};