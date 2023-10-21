/*
	@File: CfgPerks.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the settings behind the professions system.
*/

class CfgProfessions {
    class Prof_Fishing {
        displayName = "Fishing";
        variable = "Prof_Fishing";
        icon = "data\ui\Fishing.paa";
        description = "Fishing is a profession that is defined around the catching and trade of various types of fish from the different fishing grounds marked on the map.";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Gathering {
        displayName = "Gathering";
        variable = "Prof_Gathering";
        icon = "data\ui\Gathering.paa";
        description = "Gathering is a profession that is defined around the recovery of resources from various fields / plantations that are marked on the map.";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Mining {
        displayName = "Mining";
        variable = "Prof_Mining";
        icon = "data\ui\Mining.paa";
        description = "Mining is a profession that is defined around the excavation of resources from various mines that are marked on the map.";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Processing {
        displayName = "Processing";
        variable = "Prof_Processing";
        icon = "data\ui\Processing.paa";
        description = "Processing is a profession that is defined around the processing of various raw materials into useable materials at various processing sites around the map..";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Repairing {
        displayName = "Repairing";
        variable = "Prof_Repairing";
        icon = "data\ui\Repairing.paa";
        description = "Repairing is a profession that is defined around the repairing of different types of vehicles and structures.";
        side[] = {"Civilian","Police","HAVOC","Medic"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Cooking {
        displayName = "Cooking";
        variable = "Prof_Cooking";
        icon = "data\ui\Cooking.paa";
        description = "Cooking is a profession that is defined around the cooking of different types of food gathered from around the map in various different ways.";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Crafting {
        displayName = "Crafting";
        variable = "Prof_Crafting";
        icon = "data\ui\Crafting.paa";
        description = "Crafting is a profession that is defined around the crafting of various items using materials gathered and collected from around the map.";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Smuggling {
        displayName = "Smuggling";
        variable = "Prof_Smuggling";
        icon = "data\ui\Smuggling.paa";
        description = "Smuggling is a profession that is defined around the smuggling of contraband across borders through Altis' waters.";
        side[] = {"Civilian"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Capturing {
        displayName = "Capturing";
        variable = "Prof_Capturing";
        icon = "data\ui\Capturing.paa";
        description = "Capturing is a profession that is defined around the capturing of various cartels around the map using combat and tactics.";
        side[] = {"Civilian","Police","HAVOC"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = false;
    };

    class Prof_Patrol {
        displayName = "Patrol Missions";
        variable = "Prof_Patrol";
        icon = "data\ui\Patrol.paa";
        description = "";
        side[] = {"Police","HAVOC"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Impounding {
        displayName = "Impounding";
        variable = "Prof_Impounding";
        icon = "data\ui\Impounding.paa";
        description = "";
        side[] = {"Police","Medic"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };

    class Prof_Crushing {
        displayName = "Crushing";
        variable = "Prof_Crushing";
        icon = "data\ui\Crushing.paa";
        description = "";
        side[] = {"Police"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = false;
    };

    class Prof_Reviving {
        displayName = "Reviving";
        variable = "Prof_Reviving";
        icon = "data\medical\Revive.paa";
        description = "";
        side[] = {"Medic"};
        maxLevel = 500;
        levels[] = {
            {50, "Novice"}, {100, "Intermediate"}, {250, "Advanced"}, {500, "Expert"}
        };
        allowPrestigeBonus = true;
    };
};