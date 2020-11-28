class CfgShipwrecks {

    shipwreckInterval = 1800;

	positions[] = {
        {14879.063,12381.378,0},
        {4979.211,6962.989,0},
        {1050.126,18566.883,0},
        {12161.371,24521.22,0},
        {18949.246,23202.434,0},
        {26861.971,28593.947,0},
        {27637.73,18586.672,0},
        {23914.098,11410.917,0},
        {23487.428,3769.707,0}
	};

    //Define the radius, in which the wreck randomly spawns around the given center position
    Radius = 26;

    //Define the possible sets of virtual items the user can loot from the wreck.
	shipLoot[] = {
        {"hackingdevice","fuelFull","chest","tbacon","lockpick","apple"},
        {"chest","chest","chest"},
        {"tbacon","lockpick","antique","tbacon","apple","apple"},
        {"tbacon","lockpick","antique","tbacon","apple","apple"},
        {"tbacon","lockpick","antique","tbacon","apple","apple"},
        {"tbacon","lockpick","antique","tbacon","apple","apple"},
        {"tbacon","lockpick","antique","tbacon","apple","apple"},
        {"chest","tbacon","antique","hackingdevice","apple","lockpick"},
        {"tbacon","fuelFull","antique","tbacon","apple","apple"},
        {"tbacon","antique","tbacon","antique","zipties","antique","fuelFull","lockpick","chest","hackingdevice","tbacon"},
        {"chest","antique","antique","antique","chest","antique","antique","antique","antique","chest"}
	};
};