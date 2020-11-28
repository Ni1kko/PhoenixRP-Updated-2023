//  toString((toArray(_zone)) deleteRange [0,6])

class CfgCartel {
	class Altis {
		class Cartels {
			class south {
				displayName = "Southern Drug Cartel";
				position[] = {11178.361, 8712.338, 0};
				kosRadius = 1000;
				capRadius = 100;
				captime = 400;
				active = 1;
				type = "drug";
				showKosMarker = 0;
			};

			class church {
				displayName = "Church Arms Cartel";
				position[] = {8916.57,7482.06,0.00151062};
				kosRadius = 1000;
				capRadius = 100;
				captime = 400;
				active = 1;
				type = "arms";
				showKosMarker = 0;
			};

			class northern {
				displayName = "Northern Drug Cartel";
				position[] = {14289,13030.1,0.00143337};
				kosRadius = 290;
				capRadius = 50;
				captime = 400;
				active = 1;
				type = "drug";
				showKosMarker = 1;
			};

			class eastern {
				displayName = "Zaros Bay Arms Cartel";
				position[] = {10027.1,10125.1,0};
				kosRadius = 100;
				capRadius = 80;
				captime = 400;
				active = 1;
				type = "arms";
				showKosMarker = 0;
			};
		};

		class Popup {
			positions[] = {
				{8314.29,10061.7,0},
				{7884.02,14628.6,0},
				{8410.53,18243.9,0},
				{18084.9,19184,0},
				{20082.6,6727.44,0},
				{18364.4,15545.7,0},
				{16695.4,13594,0},
				{8916.35,7484.79,0},
				{21320.7,10437.5,0},
				{5395.57,17909.2,0},
				{21328.6,17220.2,0},
				{22428,20031.1,0}
			};
			payOutRange[] = {735000, 900000};
			below70MaxPay = 525000; //Below 60 civs max pay
			radius = 75;
			captureTimeInSeconds = 870;
			below70CapTime = 660; //Below 60 civs
			spawnInterval = 1500; //In seconds
			deleteTimer = 1500; //In seconds
		};
	};
};
