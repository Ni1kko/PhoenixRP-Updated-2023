#define true 1
#define false 0

class CfgMap {
	class Jobs {
		class HM {
			title = "H.M Treasury";
			object = "fed_bank";
			side = "west";
			online = 10;
			notification = true;
			major = true;
		};

		class Prison {
			title = "H.M.P Altis";
			object = "";
			side = "west";
			online = 5;
			notification = true;
			major = true;
		};

		class Evidence {
			title = "APC Evidence Locker";
			object = "evidence_locker";
			side = "west";
			online = 10;
			notification = true;
			major = true;
		};
		
		class PoliceGates {
			title = "Police Gate";
			object = "";
			side = "west";
			online = 3;
			notification = false;
			major = false;
		};
	};

	class JobBuildings {
		class HM_Treasury_Power {
			classname[] = {"Land_Dome_Small_F", "Land_Research_house_V1_F"};
			position[] = {{16014.2,16857,0}, {16020.6,16859,0}};
			doorsToLock[] = {{1,2}, {1}};
			moveObjects[] = {};
			job = "HM";
			breakTime = 300;
		};

		class HM_Treasury_Offices {
			class Options {
				class One {
					classname[] = {"Land_MilOffices_V1_F"};
					position[] = {{16009.7,16900.3,0.372055}};
					doorsToLock[] = {{1,2,3,4,5,6,7,8}};
					moveObjects[] = {{"hm_hack", {16009.5,16882.3,1.22979}}};
				};
				class Two {
					classname[] = {"Land_MilOffices_V1_F"};
					position[] = {{16216.4,17071.3,0.0516109}};
					doorsToLock[] = {{1,2,3,4,5,6,7,8}};
					moveObjects[] = {{"hm_hack", {16202.5,17082.6,1.43792}}};
				};
			};
			job = "HM";
			breakTime = 300;
		};

		class HM_Treasury_Vaults {
			class Options {
				class One {
					classname[] = {"Land_Dome_Big_F", "Land_Research_house_V1_F"};
					position[] = {{16019,16953.4,0}, {16015.1,16958.1,0}};
					doorsToLock[] = {{1,2,3}, {1}};
					moveObjects[] = {{"fed_bank", {16012.8,16958.7,0.728953}}};
				};
				class Two {
					classname[] = {"Land_Dome_Big_F", "Land_Research_HQ_F"};
					position[] = {{16015.1,17043.1,0}, {16023.7,17031.4,0}};
					doorsToLock[] = {{1,2,3}, {1,2}};
					moveObjects[] = {{"fed_bank", {16022.6,17028,0.606426}}};
				};
				class Three {
					classname[] = {"Land_Dome_Big_F", "Land_Research_house_V1_F"};
					position[] = {{16084,17082.7,0}, {16092.7,17092.8,0}};
					doorsToLock[] = {{1,2,3}, {1,2,3}};
					moveObjects[] = {{"fed_bank", {16093.7,17095.2,0.771864}}};
				};
				class Four {
					classname[] = {"Land_Dome_Big_F", "Land_Research_HQ_F"};
					position[] = {{16152.7,17044.1,0}, {16151.5,17043.6,0}};
					doorsToLock[] = {{1,2,3}, {1,2}};
					moveObjects[] = {{"fed_bank", {16148.7,17042.7,0.530085}}};
				};
				class Five {
					classname[] = {"Land_Dome_Big_F", "Land_Research_house_V1_F"};
					position[] = {{16152.6,16961.7,0}, {16146.8,16951.2,0}};
					doorsToLock[] = {{1,2,3}, {1,2,3}};
					moveObjects[] = {{"fed_bank", {16147.3,16947.5,0.71666}}};
				};
				class Six {
					classname[] = {"Land_Dome_Big_F", "Land_Research_HQ_F"};
					position[] = {{16084.9,16915.2,0}, {16076.4,16917.9,0}};
					doorsToLock[] = {{1,2,3}, {1,2}};
					moveObjects[] = {{"fed_bank", {16068.2,16916.5,0.559546}}};
				};
			};
			job = "HM";
			breakTime = 300;
		};

		class HM_Prison {
			classname[] = {"Land_MilOffices_V1_F"};
			position[] = {{12150.122,14067.313,0.624}};
			doorsToLock[] = {{1,2,3}};
			moveObjects[] = {};
			job = "Prison";
			breakTime = 300;
		};

		class Evidence_Locker {
			classname[] = {"Land_i_Barracks_V2_F"};
			position[] = {{12648.9,16414.5,0}};
			doorsToLock[] = {{1,2,3,4,5,6,7,8,9}};
			moveObjects[] = {};
			job = "Evidence";
			breakTime = 300;
		};

		class PoliceGates {
			classname[] = {"Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F","Land_BackAlley_01_l_gate_F"};
			position[] = {{3271.33,12963.5,4.262},{3266.04,12975.9,0.37502},{3264.39,12975.4,0.375675},{3261.18,12975.4,0.384973},{3257.97,12975.3,0.398669},{9761.93,15869.1,0.296288},{9770.67,15855.6,0.328003},{9772.31,15856.1,0.329002},{9775.52,15856.1,0.330002},{9778.74,15856.1,0.331001},{13844.3,18566.1,0.231001},{13841.2,18566.8,0.23},{13838.1,18567.6,0.229},{13836.3,18567.5,0.229},{13834.4,18580.9,4.096}};
			doorsToLock[] = {{1},{1},{1},{1},{1},{1},{1},{1},{1},{1},{1},{1},{1},{1},{1}};
			moveObjects[] = {};
			job = "PoliceGates";
			breakTime = 300;
		};
	};

	class NHSLifts {
		class Kavala {
			Upposition[] = {3767.121,12976.815,15.498};
			Uprotation = 264.072;
			Downposition[] = {3769.902,12971.439,0.096};
			Downrotation = 291.576;
		};
		class Athira {
			Upposition[] = {14398.215,18978.932,16.219};
			Uprotation = 50.758;
			Downposition[] = {14392.317,18981.055,0.860};
			Downrotation = 81.275;
		};
		class Pyrgos {
			Upposition[] = {16640.8,12326.9,16.2};
			Uprotation = 91.613;
			Downposition[] = {16636.887,12332.162,0.744};
			Downrotation = 117.366;
		};
	};
};

class CfgATM {
  Altis[] = {
    {6800.42,15588.9,2.66545},
    {7406.35,15411,2.66528},
    {7081.58,16402.5,2.66444},
    {4920.61,16156.4,2.67682},
    {9297.11,15871,2.66547},
    {4533.39,14037.3,2.66576},
    {8626.68,18265.1,2.89558},
    //{3925.02,13854.2,2.85503},
    {3593.64,13994.7,2.67751},
    {3777.4,13517.8,2.66583},
    {3739.72,17656.5,2.6513},
    {3698.84,13199.2,2.81741},
    {3715.01,13030.8,2.87786},
    {3416.05,13279.2,2.66927},
    {9018.87,12029.3,2.85653},
    {3497.09,13000.5,2.86744},
    {3574.93,12800.7,2.84913},
    {3282,12963.6,2.93144},
    {3697.72,12254.6,2.87035},
    {5077.96,11264.2,2.71861},
    {11008.4,13474.7,2.66546},
    {3701.12,11801.5,2.8855},
    {10304.8,19075.9,2.79991},
    {10655.9,12201.3,2.88205},
    {11726.2,13756.5,2.85373},
    {9434.56,20286.3,2.87016},
    {3799.2,11093.6,2.69454},
    {12415.7,15561.3,2.90657},
    {12589.4,14374.4,2.86208},
    {12662.9,14265.5,2.80613},
    {13980.5,18634.7,2.82122},
    {14007,18780,2.8167},
    {14610.1,16819.7,2.81153},
    {14913.1,17619.6,2.8061},
    {15881.5,16294.8,2.30835},
    {14901.8,11061,2.67068},
    {14616.6,20810.3,2.66513},
    {16453.4,17221.1,2.87343},
    {16660,16099.6,2.90162},
    {16702.7,12511.1,2.90164},
    {16774.8,12594.6,2.65998},
    {16816.7,12579.4,2.85289},
    {16886.1,12808,2.89816},
    {16889.7,12670.5,2.83506},
    {17431.6,13948.1,2.87235},
    {18102.5,15263.6,2.79621},
    {18779.9,16633.7,2.81273},
    {19306.5,13232.1,2.64901},
    {20191.7,11732.4,2.91162},
    {20303.8,11698.2,2.98509},
    {20936.4,16846.1,2.78828},
    {20937.5,16964.4,2.79526},
    {21263.6,16314.5,2.76996},
    {20475.7,8886.04,2.82895},
    {20778.6,6802.16,2.86446},
    {25618.6,21353.5,2.9203}
  };
};
