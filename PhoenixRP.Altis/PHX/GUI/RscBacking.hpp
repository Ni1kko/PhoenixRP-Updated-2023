class RscBacking {
	idd = 100;
	name = "RscBacking";
  	onLoad = "uiNamespace setVariable ['RscBacking', _this select 0]";
	duration = 10e10;
	fadeIn = 0;
	fadeOut = 0;

    class ControlsBackground {
		class Background : Life_RscBackground {
            idc = 101;
            colorBackground[] = {0,0,0,1};
			x = -4;
			y = -2;
			w = 8;
			h = 4;
        };
    };

    class Controls {
		class TileBackground : CtrlStaticBackgroundDisableTiles {colorBackground[] = { 0, 0, 0, 1 };};
	};
};