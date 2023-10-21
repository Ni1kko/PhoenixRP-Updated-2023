#define true 1
#define false 0

class CfgHousing {
	class Altis {
		blacklistedHousing[] = {
            //TI Town (Second Bank)
            {"Land_i_Garage_V2_F",{11491.4,14167.2,0.148968}},
            {"Land_i_Garage_V2_F",{11362.6,14175.8,0.00161552}},
            {"Land_i_House_Small_01_V1_F",{11405.8,14149.8,-0.0209675}},
            {"Land_i_House_Small_03_V1_F",{11334.1,14264.7,0.377386}},
            {"Land_i_House_Big_01_V1_F",{11467.5,14117.4,0.00180054}},
            {"Land_i_House_Small_03_V1_F",{11291.3,14232.9,0.37361}},
            {"Land_i_House_Small_03_V1_F",{11330.5,14208.8,0.378168}},
            {"Land_i_House_Small_03_V1_F",{11347.8,14188.5,0.379871}},
            {"Land_i_House_Small_03_V1_F",{11369.2,14241.2,0.379509}},
            {"Land_i_House_Small_03_V1_F",{11351,14253.7,0.377993}},
            {"Land_i_House_Small_03_V1_F",{11369.5,14170.2,0.377798}},
            {"Land_i_House_Small_03_V1_F",{11385.7,14156.4,0.378416}},
            {"Land_i_House_Big_02_V2_F",{11366.5,14211.3,-0.00911903}},
            {"Land_i_House_Big_02_V2_F",{11312.2,14217.9,-0.0182762}},
            //Zaros Bay Cartel
            {"Land_i_Stone_HouseSmall_V3_F",{10047.783,10198.62,0}},
            {"Land_i_Stone_Shed_V3_F",{10066.09,10183.294,0}},
            {"Land_i_Shed_Ind_F",{9988.022,10205.89,0.304}},
            //
            {"Land_i_Stone_Shed_V1_F",{10843.4,13465.9,-0.0603218}},
            {"Land_i_Stone_HouseSmall_V2_F",{10834.4,13475.3,0}},
            {"Land_i_Shed_Ind_F",{25284.3,22646.6,0}},
            {"Land_i_Shed_Ind_F",{6821.25,15855.1,0}},
            {"Land_i_Shed_Ind_F",{7859.35,16140.8,0}},
            {"Land_i_Shed_Ind_F",{13326.9,16900.8,0}},
            {"Land_i_Shed_Ind_F",{12596.1,15377.4,0}},
            {"Land_i_Shed_Ind_F",{5101.95,16798.3,0}},
            {"Land_i_Shed_Ind_F",{14245.4,18613.1,0}},
            {"Land_i_Shed_Ind_F",{3165.71,12905.2,0}},
            {"Land_i_House_Small_03_V1_F",{19377.8,9647.35,0.378647}},
            {"Land_i_Stone_Shed_V1_F",{19721.7,13028.6,0.283997}},
            {"Land_i_House_Big_01_V1_F",{23775.9,20155.3,0}},
            {"Land_i_Shed_Ind_F",{9988.02,10205.9,0}},
            {"Land_i_Stone_HouseSmall_V3_F",{10047.8,10198.6,0}},
			{"Land_i_Shed_Ind_F",{16624,12809.2,0.148793}},
			{"Land_i_Shed_Ind_F",{16642,12798.8,0.164828}},
            {"Land_i_Stone_Shed_V3_F",{10066.09,10183.294,0}}
        }; // POS of "Blacklisted" Housing

        class Land_i_Garage_V1_F {
            price = 500000;
            rent = 6000; // Up keep... (£252,000 Weekly)
            storage = 0;
            isGarage = true;
			garageSettings[] = {{-11.5,0,0}, -90}; // POS, DIR
            lightPos[] = {2,0,3.5};
			restrictedPos[] = {0,1,2,3,4}; // All positions we won't spawn at...
        };

        class Land_i_Garage_V2_F : Land_i_Garage_V1_F {};

        class Land_i_Stone_Shed_V1_F {
            price = 500000;
            rent = 5000; // Up keep... (£210,000 Weekly)
            storage = 3;
            isGarage = false;
			garageSettings[] = {{0,0,0}, 0}; // POS, DIR
            lightPos[] = {2,0,3.5};
			restrictedPos[] = {0,1,2,3,4}; // All positions we won't spawn at...
        };
        class Land_i_Stone_Shed_V2_F : Land_i_Stone_Shed_V1_F {};
        class Land_i_Stone_Shed_V3_F : Land_i_Stone_Shed_V1_F {};

        class Land_i_Stone_HouseSmall_V1_F {
            price = 750000;
            rent = 5000; // Up keep... (£210,000 Weekly)
            storage = 2;
            isGarage = false;
			garageSettings[] = {{0,0,0}, 0}; // POS, DIR
            lightPos[] = {2,0,3.5};
			restrictedPos[] = {0,1,3,4}; // All positions we won't spawn at...
        };
        class Land_i_Stone_HouseSmall_V2_F : Land_i_Stone_HouseSmall_V1_F {};
        class Land_i_Stone_HouseSmall_V3_F : Land_i_Stone_HouseSmall_V1_F {};

        class Land_i_House_Small_02_V1_F {
            price = 1050000;
            rent = 5000; // Up keep... (£210,000 Weekly)
            storage = 3;
            isGarage = false;
			garageSettings[] = {{0,0,0}, 0}; // POS, DIR
            lightPos[] = {2,0,3.5};
			restrictedPos[] = {0,1,2,3,4}; // All positions we won't spawn at...
        };
        class Land_i_House_Small_02_V2_F : Land_i_House_Small_02_V1_F {};
        class Land_i_House_Small_02_V3_F : Land_i_House_Small_02_V1_F {};
        class Land_i_House_Small_01_V1_F : Land_i_House_Small_02_V1_F {};
        class Land_i_House_Small_01_V2_F : Land_i_House_Small_02_V1_F {};
        class Land_i_House_Small_01_V3_F : Land_i_House_Small_02_V1_F {};

        class Land_i_House_Small_03_V1_F {
            price = 1250000;
            rent = 10000; // Up keep... (£420,000 Weekly)
            storage = 4;
            isGarage = false;
			garageSettings[] = {{0,0,0}, 0}; // POS, DIR
            lightPos[] = {-3.3,1,2.5};
			restrictedPos[] = {0,1,2,3,4}; // All positions we won't spawn at...
        };

        class Land_i_House_Big_02_V1_F {
            price = 1550000;
            rent = 20000; // Up keep... (£840,000 Weekly)
            storage = 5;
            isGarage = false;
			garageSettings[] = {{0,0,0}, 0}; // POS, DIR
            lightPos[] = {2,0,3.5};
			restrictedPos[] = {0,1,2,3,4}; // All positions we won't spawn at...
        };
        class Land_i_House_Big_02_V2_F : Land_i_House_Big_02_V1_F {};
        class Land_i_House_Big_02_V3_F : Land_i_House_Big_02_V1_F {};

		class Land_i_House_Big_01_V1_F {
            price = 2200000;
            rent = 30000; // Up keep... (£1,260,000 Weekly)
            storage = 5;
            isGarage = false;
			garageSettings[] = {{0,0,0}, 0}; // POS, DIR
            lightPos[] = {0,-2,3.8};
			restrictedPos[] = {2,3}; // All positions we won't spawn at...
        };
        class Land_i_House_Big_01_V2_F : Land_i_House_Big_01_V1_F {};
        class Land_i_House_Big_01_V3_F : Land_i_House_Big_01_V1_F {};

        class Land_i_Shed_Ind_F {
            price = 5000000;
            rent = 50000; // Up keep... (£2,100,000 Weekly)
            storage = 10;
            isGarage = false;
			garageSettings[] = {{-18.5,0,0}, 0}; // POS, DIR
            lightPos[] = {-3.3,1,2.5};
			restrictedPos[] = {0,1,2,3,4}; // All positions we won't spawn at...
        };
	};
};
