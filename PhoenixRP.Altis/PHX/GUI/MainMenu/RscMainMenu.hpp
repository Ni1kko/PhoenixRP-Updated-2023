class RscMainMenu {
	idd = 1500;
	name = "RscMainMenu";
  	onLoad = "";

    class ControlsBackground {
        class PHXLogo : Life_RscPictureKeepAspect {
            idc = 1501;
            text = "data\ui\PHXLogo.paa";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.74 * safezoneH + safezoneY;
            w = 0.149531 * safezoneW;
            h = 0.077 * safezoneH;
            fade = 1;
        };
    };

    class Controls {
		class MenuHeader : Life_RscText {
            colorBackground[] = {0, 0, 0, 1};
            idc = 1502;
			text = "PhoenixRP";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.825 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.022 * safezoneH;
            fade = 1;
        };

		class PlayButton: Life_RscButtonMenu {
            idc = 1503;
            text = "Play";
            colorBackground[] = {0, 0, 0, 0.6};
            onButtonClick = "if !(PHX_Main_Objects isEqualTo []) then { { deleteVehicle _x } forEach PHX_Main_Objects }; deleteVehicle PHX_Mannequin; PHX_Camera cameraEffect [""TERMINATE"",""BACK""]; camDestroy PHX_Camera; closeDialog 0; call life_fnc_spawnMenu";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.85 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.022 * safezoneH;
            fade = 1;
        };

		class CharacterButton: Life_RscButtonMenu {
            idc = 1504;
            text = "View Character";
            colorBackground[] = {0, 0, 0, 0.6};
            onButtonClick = "call PHX_fnc_viewCharacter";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.875 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.022 * safezoneH;
            fade = 1;
        };

		class SettingsButton: Life_RscButtonMenu {
            idc = 1505;
            text = "Settings";
            colorBackground[] = {0, 0, 0, 0.6};
            onButtonClick = "private _display = [true] call PHX_fnc_openMenu; if (isNull _display) exitWith {}; _display displaySetEventHandler [""keyDown"",""closeDialog 0; true""]; [] call life_fnc_settingsMenu; ctrlShow[24301, false];";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.9 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.022 * safezoneH;
            fade = 1;
        };

		class ExitButton: Life_RscButtonMenu {
            idc = 1506;
            text = "Exit";
            colorBackground[] = {0, 0, 0, 0.6};
            onButtonClick = "['Aborted',true,false] spawn BIS_fnc_endMission;";
            x = 0.0153125 * safezoneW + safezoneX;
            y = 0.925 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.022 * safezoneH;
            fade = 1;
        };
    };
};