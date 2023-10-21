class RscClothingStore {
	idd = 3100;
	name = "RscClothingStore";
  onLoad = "";

  class ControlsBackground {
    class MainBackground: Life_RscText{
      idc = -1;
      x = safeZoneX + safeZoneW * 0.11;
      y = safeZoneY + safeZoneH * 0.3;
      w = safeZoneW * 0.17125;
      h = safeZoneH * 0.37111112;
      style = 0;
      colorBackground[] = {0.16,0.16,0.16,1};
      colorText[] = {1,1,1,1};
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    };

    class Title:Life_RscTitle{
      idc = 3103;
      x = safeZoneX + safeZoneW * 0.11;
      y = safeZoneY + safeZoneH * 0.3;
      w = safeZoneW * 0.17125;
      h = safeZoneH * 0.02222223;
      style = 0;
      text = "";
      colorBackground[] = {0.09,0.09,0.09,1};
      colorText[] = {1,1,1,1};
      font = "RobotoCondensedLight";
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
      moving = true;
    };

    class PriceBox: Life_RscText {
      idc = -1;
      x = safeZoneX + safeZoneW * 0.114375;
      y = safeZoneY + safeZoneH * 0.59;
      w = safeZoneW * 0.0525;
      h = safeZoneH * 0.02222223;
      text = "Price:";
      colorBackground[] = {0.102,0.102,0.102,1};
      colorText[] = {1,1,1,1};
      font = "RobotoCondensedLight";
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);	
    };

    class TotalBox: Life_RscText{
      idc = -1;
      x = safeZoneX + safeZoneW * 0.114375;
      y = safeZoneY + safeZoneH * 0.61666667;
      w = safeZoneW * 0.0525;
      h = safeZoneH * 0.02222223;
      text = "Total Cost:";
      colorBackground[] = {0.102,0.102,0.102,1};
      colorText[] = {1,1,1,1};
      font = "RobotoCondensedLight";
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
    };

    class PriceBox2: Life_RscText {
      idc = -1;
      x = safeZoneX + safeZoneW * 0.168125;
      y = safeZoneY + safeZoneH * 0.59;
      w = safeZoneW * 0.108125;
      h = safeZoneH * 0.02222223;
      colorBackground[] = {0.102,0.102,0.102,1};
    };

    class TotalBox2: Life_RscText {
      idc = -1;
      x = safeZoneX + safeZoneW * 0.168125;
      y = safeZoneY + safeZoneH * 0.61666667;
      w = safeZoneW * 0.108125;
      h = safeZoneH * 0.02222223;
      colorBackground[] = {0.102,0.102,0.102,1};
    };

    class Price:Life_RscStructuredText{
      idc = 3102;
      x = safeZoneX + safeZoneW * 0.168125;
      y = safeZoneY + safeZoneH * 0.59;
      w = safeZoneW * 0.1025;
      h = safeZoneH * 0.01888889;
      text = "";
      size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
      colorBackground[] = {1,1,1,0};
    };

    class Total:Life_RscStructuredText{
      idc = 3106;
      x = safeZoneX + safeZoneW * 0.168125;
      y = safeZoneY + safeZoneH * 0.61666667;
      w = safeZoneW * 0.1025;
      h = safeZoneH * 0.01888889;
      text = "";
      size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
      colorBackground[] = {1,1,1,0};
    };
  };
    
  class Controls{
    class DropDown:PHXCombos {
      idc = 3105;
      onLBSelChanged  = "_this call life_fnc_clothingFilter";
      x = safeZoneX + safeZoneW * 0.11;
      y = safeZoneY + safeZoneH * 0.67111112;
      w = safeZoneW * 0.17125;
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

    class List:Life_RscListBox{
      idc = 3101;
      onLBSelChanged = "[_this] call life_fnc_changeClothes;";
			x = safeZoneX + safeZoneW * 0.114375;
			y = safeZoneY + safeZoneH * 0.35111112;
			w = safeZoneW * 0.161875;
			h = safeZoneH * 0.23333334;
      colorBackground[] = {0.09,0.09,0.09,1};
      colorDisabled[] = {0.09,0.09,0.09,1};
      colorSelect[] = {0.702,0.702,0.702,1};
      colorText[] = {1,1,1,1};
      font = "RobotoCondensedLight";
      maxHistoryDelay = 0;
      rowHeight = 0;
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
    };

    class Buy:Life_RscButton{
      idc = -1;
      x = safeZoneX + safeZoneW * 0.114375;
      y = safeZoneY + safeZoneH * 0.64333334;
      w = safeZoneW * 0.161875;
      h = safeZoneH * 0.02222223;
      text = "PURCHASE";
      onButtonClick = "[] call life_fnc_buyClothes;";
      style = 2;
      borderSize = 0;
      colorBackground[] = {0,0,0,1};
      colorText[] = {1,1,1,1};
      font = "PuristaLight";
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
    };

    class CloseButtonKey:Life_RscButton{
      idc = -1;
      onButtonClick = "closeDialog 0;";
      x = safeZoneX + safeZoneW * 0.265625;
      y = safeZoneY + safeZoneH * 0.3;
      w = safeZoneW * 0.015625;
      h = safeZoneH * 0.02222223;
      style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
      text = "\a3\3DEN\Data\Displays\Display3DEN\search_end_ca.paa";
      tooltip = "Close";
      colorBackground[] = {0,0,0,1};
      colorFocused[] = {0.09,0.09,0.09,1};
      colorBackgroundActive[] = {0.03,0.03,0.03,1};
      sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
    };

    class viewAngle:life_RscXSliderH{
      color[] = {1, 1, 1, 0.45};
      colorActive[] = {1, 1, 1, 0.65};
      idc = 3107;
      text = "";
      onSliderPosChanged = "[4,_this select 1] call life_fnc_s_onSliderChange;";
      tooltip = "";
      x = 0.25 * safezoneW + safezoneX;
      y = 0.95 * safezoneH + safezoneY;
      w = 0.5 * safezoneW;
      h = 0.02 * safezoneH;
    };

		class SearchBox:Life_RscEdit{
			idc = 3108;
			x = safeZoneX + safeZoneW * 0.114375;
			y = safeZoneY + safeZoneH * 0.32777778;
			w = safeZoneW * 0.149375;
			h = safeZoneH * 0.01888889;
			text = "";
			colorBackground[] = {0.09,0.09,0.09,1};
			colorText[] = {1,1,1,1};
			font = "RobotoCondensedLight";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 30) * 1);
		};

		class ClearButton:Life_RscButton {
			idc = -1;
			x = safeZoneX + safeZoneW * 0.264375;
			y = safeZoneY + safeZoneH * 0.32777778;
			w = safeZoneW * 0.011875;
			h = safeZoneH * 0.01888889;
      style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			colorBackground[] = {0,0,0,1};
      colorFocused[] = {0.09,0.09,0.09,1};
      colorBackgroundActive[] = {0.03,0.03,0.03,1};
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			onButtonClick = "[3100, 3101, 3108, 'search'] call PHX_fnc_searchList;";
      text = "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
      tooltip = "Search";
		};
  };
};
