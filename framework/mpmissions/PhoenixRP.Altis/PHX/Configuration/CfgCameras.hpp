class CfgCameras {
	class Altis {
		class APC {
			condition = "playerSide isEqualTo west";
			cameras[] = {
				{"HM | Vault Camera", {16035.4,16967.1,16.9537}, {16019.1,16953.3,0}, "isNil ""cctv_camera"""},
				{"HM | Front Camera", {16084.5,16997.4,39.1777}, {16027.4,16960,0}, "isNil ""cctv_camera"""},
				{"HM | Rear Camera", {16007.8,16919.3,4.40747}, {15951.6,16960.2,0}, "isNil ""cctv_camera"""},
				{"HMP | Car Park Camera", {12155.5,14099.5,13.6207}, {12148.6,14082.2,0}, "isNil ""cctv_camera"""},
				{"HMP | Courtyard Camera", {12183.8,14031.3,12.1883}, {12159.4,14042.4,0}, "isNil ""cctv_camera"""},
				{"EL | Vault Camera", {12650.4,16412.5,3.58477}, {12653,16406.8,0}, "isNil ""cctv_camera"""},
				{"EL | Front Camera", {12607.8,12356,8.24595}, {12638.2,16409.5,0}, "isNil ""cctv_camera"""},
				{"EL | Rear Camera", {12664.3,16431.8,7.85026}, {12631.1,16425.8,0}, "isNil ""cctv_camera"""}
			};
		};
		class HAVOC {
			condition = "playerSide isEqualTo east";
			cameras[] = {
				{"Checkpoint Camera", {21371.986,17248.666,12.788}, {21314.12,17221.83,0}, "isNil ""cctv_camera"""}
			};
		};
	};
};