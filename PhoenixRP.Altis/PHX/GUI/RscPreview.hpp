class RscPreview {
	idd = 3700;
	name = "RscPreview";
  	onLoad = "";

    class ControlsBackground {};
    class Controls{
		class ExitButton: Life_RscButtonMenu {
            idc = 1506;
            text = "Close";
            colorBackground[] = {0, 0, 0, 0.6};
            onButtonClick = "[] call life_fnc_3dPreviewExit;";
            x = 0.005 * safezoneW + safezoneX;
            y = 0.97 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};