class RscMedical {
	idd = 7000;
	name = "RscMedical";

	class ControlsBackground {
		class TabletImage : life_RscPicture {
			idc = -1;
			text = "data\ui\tablet.paa";
			x = 0.2525 * safezoneW + safezoneX;
			y = 0.06 * safezoneH + safezoneY;
			w = 0.495 * safezoneW;
			h = 0.858 * safezoneH;
		};
	};

	class Controls {
		class BackgroundBody: Life_RscPicture {
			idc = 7001;
			text = "data\medical\background.paa";
			x = safeZoneX + safeZoneW * 0.45625;
			y = safeZoneY + safeZoneH * 0.28;
			w = safeZoneW * 0.106875;
			h = safeZoneH * 0.35666667;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
		};

		class Head: Life_RscActiveText {
			idc = 7002;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			x = safeZoneX + safeZoneW * 0.49375;
			y = safeZoneY + safeZoneH * 0.29777778;
			w = safeZoneW * 0.033125;
			h = safeZoneH * 0.05666667;
			onButtonClick = "PHX_MedicalPoint = 'Head'";
			text = "data\medical\head.paa";
		};

		class RArm: Life_RscActiveText {
			idc = 7003;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			x = safeZoneX + safeZoneW * 0.468125;
			y = safeZoneY + safeZoneH * 0.32111112;
			w = safeZoneW * 0.0375;
			h = safeZoneH * 0.19;
			onButtonClick = "PHX_MedicalPoint = 'Arms'";
			text = "data\medical\arm_right.paa";
		};

		class LArm: Life_RscActiveText {
			idc = 7004;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			x = safeZoneX + safeZoneW * 0.514375;
			y = safeZoneY + safeZoneH * 0.32111112;
			w = safeZoneW * 0.0375;
			h = safeZoneH * 0.19;
			onButtonClick = "PHX_MedicalPoint = 'Arms'";
			text = "data\medical\arm_left.paa";
		};

		class Body: Life_RscActiveText {
			idc = 7005;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			x = safeZoneX + safeZoneW * 0.486875;
			y = safeZoneY + safeZoneH * 0.34888889;
			w = safeZoneW * 0.045625;
			h = safeZoneH * 0.11888889;
			onButtonClick = "PHX_MedicalPoint = 'Body'";
			text = "data\medical\torso.paa";
		};

		class RLegs: Life_RscActiveText {
			idc = 7006;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			x = safeZoneX + safeZoneW * 0.48;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.03625;
			h = safeZoneH * 0.17666667;
			onButtonClick = "PHX_MedicalPoint = 'Legs'";
			text = "data\medical\leg_right.paa";
		};
		
		class LLegs: Life_RscActiveText {
			idc = 7007;
			style = ST_PICTURE + ST_KEEP_ASPECT_RATIO + ST_CENTER;
			x = safeZoneX + safeZoneW * 0.501875;
			y = safeZoneY + safeZoneH * 0.44111112;
			w = safeZoneW * 0.03875;
			h = safeZoneH * 0.17666667;
			onButtonClick = "PHX_MedicalPoint = 'Legs'";
			text = "data\medical\leg_left.paa";
		};

		class BloodBag: Life_RscActiveText {
			idc = -1;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "data\perks\medicalStudent.paa";
			x = 0.67875 * safezoneW + safezoneX;
			y = 0.26888889 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04111112 * safezoneH;
			toolTip = "Administer a blood bag";
			onButtonClick = "closeDialog 0; [cursorTarget] spawn PHX_fnc_administerBlood;";
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Morphine: Life_RscActiveText {
			idc = -1;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "data\medical\morphine.paa";
			x = 0.67875 * safezoneW + safezoneX;
			y = 0.31777778 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04111112 * safezoneH;
			toolTip = "Administer a morphine syringe";
			onButtonClick = "closeDialog 0; ['Morphine'] spawn PHX_fnc_medicalPerform;";
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Saline: Life_RscActiveText {
			idc = -1;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "data\medical\Atropine.paa";
			x = 0.67875 * safezoneW + safezoneX;
			y = 0.36666667 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04111112 * safezoneH;
			toolTip = "Administer saline";
			onButtonClick = "closeDialog 0; ['Saline'] spawn PHX_fnc_medicalPerform;";
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Bandage: Life_RscActiveText {
			idc = -1;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "data\medical\Bandage.paa";
			x = 0.67875 * safezoneW + safezoneX;
			y = 0.41555556 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04111112 * safezoneH;
			toolTip = "Applys a bandage";
			onButtonClick = "closeDialog 0; ['Bandage'] spawn PHX_fnc_medicalPerform;";
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Gauze: Life_RscActiveText {
			idc = -1;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "data\medical\Gauze.paa";
			x = 0.67875 * safezoneW + safezoneX;
			y = 0.46444445 * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04111112 * safezoneH;
			toolTip = "Applys a gauze";
			onButtonClick = "closeDialog 0; ['Gauze'] spawn PHX_fnc_medicalPerform;";
			colorBackground[] = {0.2,0.2,0.2,1};
		};

		class Revive: Life_RscActiveText {
			idc = 7008;
			style = ST_KEEP_ASPECT_RATIO + ST_CENTER + ST_PICTURE;
			text = "data\medical\Revive.paa";
			x = 0.67875 * safezoneW + safezoneX;
			y = 0.52333334‬ * safezoneH + safezoneY;
			w = 0.025 * safezoneW;
			h = 0.04111112 * safezoneH;
			toolTip = "Revives the person";
			onButtonClick = "closeDialog 0; [cursorTarget] spawn PHX_fnc_revive;";
			colorBackground[] = {0.2,0.2,0.2,1};
		};
	};
};