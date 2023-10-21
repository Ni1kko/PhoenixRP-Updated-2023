/*
	@File: CfgItems.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@description: Configures the settings behind the virtual items.
*/

// Got ya'

class CfgItems {
    // Drink Items
    class waterBottle {
        variable = "waterBottle";
        displayName = "Water Bottle";
        weight = 1;
        buyPrice = 30;
        sellPrice = 15;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 70;
        };
        icon = "ico_waterBottle.paa";
        description = "Enjoy a nice still drink to quench your thirst.";
        conditions = "";
    };
    class waterCup {
        variable = "waterCup";
        displayName = "Water Cup";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 30;
        };
        icon = "ico_waterBottle.paa";
        description = "Enjoy a nice still drink to quench your thirst that comes from a simple machine.";
        conditions = "";
    };
    class coffee {
        variable = "coffee";
        displayName = "Coffee";
        weight = 1;
        buyPrice = 70;
        sellPrice = 35;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 50;
        };
        icon = "ico_coffee.paa";
        description = "A black drink packed with energy and bitterness.";
        conditions = "";
    };
    class weedCoffee {
        variable = "weedCoffee";
        displayName = "Cannabis Coffee";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 100;
        };
        icon = "ico_coffee.paa";
        description = "Google says it's a thing.";
        conditions = "";
    };
    class tea {
        variable = "tea";
        displayName = "Tea";
        weight = 1;
        buyPrice = 50;
        sellPrice = 25;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 60;
        };
        icon = "ico_coffee.paa";
        description = "A gorgeous English drink that is simply the best.";
        conditions = "";
    };
    class redgull {
        variable = "redgull";
        displayName = "Redgull";
        weight = 1;
        buyPrice = 2500;
        sellPrice = 1250;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 40;
        };
        icon = "ico_redgull.paa";
        description = "Enery drink that certainly doesn't give you wings. Very high in sugar.";
        conditions = "";
    };
    class beer {
        variable = "beer";
        displayName = "Beer";
        weight = 2;
        buyPrice = 244;
        sellPrice = 124;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 20;
        };
        icon = "ico_beer.paa";
        description = "A pint of beer, ready to be drunk.";
        conditions = "";
    };
    class cider {
        variable = "cider";
        displayName = "Cider";
        weight = 1;
        buyPrice = 1133;
        sellPrice = 575;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 30;
        };
        icon = "ico_cider.paa";
        description = "Cider is an alcoholic beverage made from the fermented juice of apples.";
        conditions = "";
    };
    class gin {
        variable = "gin";
        displayName = "Gin";
        weight = 2;
        buyPrice = 731;
        sellPrice = 371;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 30;
        };
        icon = "ico_gin.paa";
        description = "Gin is liquor which derives its predominant flavour from juniper berries.";
        conditions = "";
    };
    class vodka {
        variable = "vodka";
        displayName = "Vodka";
        weight = 2;
        buyPrice = 975;
        sellPrice = 495;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 30;
        };
        icon = "ico_vodka.paa";
        description = "Vodka is a distilled beverage composed primarily of water and ethanol.";
        conditions = "";
    };
    class whiskey {
        variable = "whiskey";
        displayName = "Whiskey";
        weight = 2;
        buyPrice = 489;
        sellPrice = 248;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 30;
        };
        icon = "ico_whiskey.paa";
        description = "Whisky or whiskey is a type of distilled alcoholic beverage made from fermented grain mash.";
        conditions = "";
    };

    // Food Items
    class apple {
        variable = "apple";
        displayName = "Apple";
        weight = 1;
        buyPrice = 89;
        sellPrice = 45;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Both"};
            value = 20;
        };
        icon = "ico_apple.paa";
        description = "Farmed and sold! Simple as that. Or processed into cider...";
        conditions = "";
    };
    class peach {
        variable = "peach";
        displayName = "Peach";
        weight = 1;
        buyPrice = 106;
        sellPrice = 54;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Both"};
            value = 30;
        };
        icon = "ico_peach.paa";
        description = "Farmed and sold! Simple as that. But not processed into cider...";
        conditions = "";
    };
    class lollipop {
        variable = "lollipop";
        displayName = "Lollipop";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 10;
        };
        icon = "ico_lollipop.paa";
        description = "A little ""get-well"" gift from the NHS after treatment.";
        conditions = "";
    };
    class doughnut {
        variable = "doughnut";
        displayName = "Doughnut";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 30;
        };
        icon = "ico_donuts.paa";
        description = "Don't expect the market to have any left in stock, the police buy them all!";
        conditions = "";
    };
    class mre {
        variable = "mre";
        displayName = "MRE";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 500;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 80;
        };
        icon = "ico_mre.paa";
        description = "Food packs issued to all HAVOC members.";
        conditions = "";
    };
    class tbacon {
        variable = "tbacon";
        displayName = "Tactical Bacon";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 60;
        };
        icon = "ico_tbacon.paa";
        description = "Canned bacon, nobody thought it would taste so good. It's also tactical!";
        conditions = "";
    };
    class chips {
        variable = "chips";
        displayName = "Chips";
        weight = 1;
        buyPrice = 100;
        sellPrice = 50;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 30;
        };
        icon = "ico_chips.paa";
        description = "Purchased from any ""Red Buger"" stand and made from Irish potatos!";
        conditions = "";
    };
    class burger {
        variable = "burger";
        displayName = "Burger";
        weight = 1;
        buyPrice = 180;
        sellPrice = 90;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 90;
        };
        icon = "ico_burger.paa";
        description = "Purchased from any ""Red Buger"" stand and made from 100% real h-beef.";
        conditions = "";
    };

    // Hunting Items
    class rabbit_raw {
        variable = "rabbit_raw";
        displayName = "Raw Rabbit";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_rabbitRaw.paa";
        description = "Collected from killing those poor rabbits.";
        conditions = "";
    };
    class rabbit_cooked {
        variable = "rabbit_cooked";
        displayName = "Cooked Rabbit";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 20;
        };
        icon = "ico_rabbit.paa";
        description = "Just cooked from raw rabbits at the public cookhouse.";
        conditions = "";
    };
    class hen_raw {
        variable = "hen_raw";
        displayName = "Raw Hen";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_wholeChickenRaw.paa";
        description = "Collected from killing those poor hens.";
        conditions = "";
    };
    class hen_cooked {
        variable = "hen_cooked";
        displayName = "Cooked Hen";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 20;
        };
        icon = "ico_wholeChicken.paa";
        description = "Just cooked from raw hens at the public cookhouse.";
        conditions = "";
    };
    class rooster_raw {
        variable = "rooster_raw";
        displayName = "Raw Rooster";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_chickenDrumstickRaw.paa";
        description = "Collected from killing those poor roosters.";
        conditions = "";
    };
    class rooster_cooked {
        variable = "rooster_cooked";
        displayName = "Cooked Rooster";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 20;
        };
        icon = "ico_chickenDrumstick.paa";
        description = "Just cooked from raw roosters at the public cookhouse.";
        conditions = "";
    };
    class sheep_raw {
        variable = "sheep_raw";
        displayName = "Raw Sheep";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_lambChopRaw.paa";
        description = "Collected from killing those poor sheep.";
        conditions = "";
    };
    class sheep_cooked {
        variable = "sheep_cooked";
        displayName = "Cooked Sheep";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 20;
        };
        icon = "ico_lambChop.paa";
        description = "Just cooked from raw sheep at the public cookhouse.";
        conditions = "";
    };
    class goat_raw {
        variable = "goat_raw";
        displayName = "Raw Goat";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_muttonLegRaw.paa";
        description = "Collected from killing those poor goats.";
        conditions = "";
    };
    class goat_cooked {
        variable = "goat_cooked";
        displayName = "Cooked Goat";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 20;
        };
        icon = "ico_muttonLeg.paa";
        description = "Just cooked from raw goat at the public cookhouse.";
        conditions = "";
    };

    // Fished Items
    class salema_raw {
        variable = "salema_raw";
        displayName = "Raw Salema";
        weight = 2;
        buyPrice = -1;
        sellPrice = 500;
        illegal = "fish";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_salemaRaw.paa";
        description = "A small fish that can be found close to shore anywhere around the island.";
        conditions = "";
    };
    class salema_cooked {
        variable = "salema_cooked";
        displayName = "Cooked Salema";
        weight = 1;
        buyPrice = 2995;
        sellPrice = 1300;
        illegal = true;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 30;
        };
        icon = "ico_cookedFish.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };
    class ornate_raw {
        variable = "ornate_raw";
        displayName = "Raw Ornate";
        weight = 2;
        buyPrice = -1;
        sellPrice = 433;
        illegal = "fish";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_ornateRaw.paa";
        description = "A small-medium fish that can be found in the likes of bays and gulfs.";
        conditions = "";
    };
    class ornate_cooked {
        variable = "ornate_cooked";
        displayName = "Cooked Ornate";
        weight = 1;
        buyPrice = 5516;
        sellPrice = 2800;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 40;
        };
        icon = "ico_cookedFish.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };
    class mackerel_raw {
        variable = "mackerel_raw";
        displayName = "Raw Mackerel";
        weight = 2;
        buyPrice = -1;
        sellPrice = 660;
        illegal = "fish";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_mackerelRaw.paa";
        description = "A small-medium fish that can be found in the likes of bays and gulfs.";
        conditions = "";
    };
    class mackerel_cooked {
        variable = "mackerel_cooked";
        displayName = "Cooked Mackerel";
        weight = 1;
        buyPrice = 3901;
        sellPrice = 1980;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 50;
        };
        icon = "ico_cookedFish.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };
    class tuna_raw {
        variable = "tuna_raw";
        displayName = "Raw Tuna";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1650;
        illegal = "fish";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_tunaRaw.paa";
        description = "A large fish that can be found in the a long-way out from shore.";
        conditions = "";
    };
    class tuna_cooked {
        variable = "tuna_cooked";
        displayName = "Cooked Tuna";
        weight = 1;
        buyPrice = 9752;
        sellPrice = 4950;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 60;
        };
        icon = "ico_cookedFish.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };
    class mullet_raw {
        variable = "mullet_raw";
        displayName = "Raw Mullet";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2310;
        illegal = "fish";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_tunaRaw.paa";
        description = "A large fish that can be found in the a long-way out from shore.";
        conditions = "";
    };
    class mullet_cooked {
        variable = "mullet_cooked";
        displayName = "Cooked Mullet";
        weight = 1;
        buyPrice = 13652;
        sellPrice = 6930;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 70;
        };
        icon = "ico_cookedFish.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };
    class catshark_raw {
        variable = "catshark_raw";
        displayName = "Raw Catshark";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3433;
        illegal = "fish";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_catsharkRaw.paa";
        description = "A large shark-like that can be found in the a long-way out from shore.";
        conditions = "";
    };
    class catshark_cooked {
        variable = "catshark_cooked";
        displayName = "Cooked Catshark";
        weight = 1;
        buyPrice = 20291;
        sellPrice = 10300;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 100;
        };
        icon = "ico_cookedFish.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };
    class turtle_raw {
        variable = "turtle_raw";
        displayName = "Raw Turtle";
        weight = 6;
        buyPrice = -1;
        sellPrice = 11667;
        illegal = "turtle";
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_turtleRaw.paa";
        description = "An extremely rare animal that can be found in specifc areas of the water.";
        conditions = "";
    };
    class turtle_cooked {
        variable = "turtle_cooked";
        displayName = "Cooked Turtle";
        weight = 3;
        buyPrice = -1;
        sellPrice = 35000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Hunger"};
            value = 60;
        };
        icon = "ico_turtleRaw.paa";
        description = "Simply cook the raw one to get this one!";
        conditions = "";
    };

    // HAVOC Visas
    class havoc_entry {
        variable = "havocentry";
        displayName = "HAVOC Entry Visa";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_entryvisa.paa";
        description = "Use this item to gain access to the HAVOC territory east of the island. A entry Visa allows you to visit the HAVOC Land without persecution, however, if you get caught with a Entry Visa and your processing or gathering items you will be persecuted by HAVOC.";
        conditions = "";
    };
    class havoc_work {
        variable = "havocwork";
        displayName = "HAVOC Work Visa";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_workvisa.paa";
        description = "Use this item to gain access to the HAVOC territory east of the island. A work Visa allows you to gather and process different drugs and legal items without persecution from HAVOC.";
        conditions = "";
    };

    // Medical Items
    class morphine {
        variable = "morphine";
        displayName = "Morphine";
        weight = 1;
        buyPrice = 30000;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_morphine.paa";
        description = "A pain killer that gets the adrenaline pumping. Has a similar effect to redgull. Slightly less effective compared to other painkillers.";
        conditions = "";
    };
    class fentanyl {
        variable = "fentanyl";
        displayName = "Fentanyl";
        weight = 1;
        buyPrice = 30000;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_fentanyl.paa";
        description = "A pain killer that should only be used in life or death situations.";
        conditions = "";
    };
    class Saline {
        variable = "Saline";
        displayName = "Saline";
        weight = 1;
        buyPrice = 1000;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_saline.paa";
        description = "A mixture of salt and water used for treating wounds.";
        conditions = "";
    };
    class Bandage {
        variable = "Bandage";
        displayName = "Bandage";
        weight = 1;
        buyPrice = 1000;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_bandage.paa";
        description = "A strip of fabric used especially to cover, dress, and bind up wounds.";
        conditions = "";
    };
    class Gauze {
        variable = "Gauze";
        displayName = "Gauze";
        weight = 1;
        buyPrice = 1000;
        sellPrice = -1;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_gauze.paa";
        description = "A very thin, light cloth, used to make clothing, to cover cuts.";
        conditions = "";
    };
    class firstaidkit_virtual {
        variable = "firstaidkit_virtual";
        displayName = "First Aid Kit";
        weight = 2;
        buyPrice = 250;
        sellPrice = 125;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_firstaidkit.paa";
        description = "Allows you to patch up basic wounds and make yourself feel better.";
        conditions = "";
    };
    class medikit_virtual {
        variable = "medikit_virtual";
        displayName = "Medikit";
        weight = 5;
        buyPrice = 1000;
        sellPrice = 500;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_medikit.paa";
        description = "Allows you to patch up serious wounds and help save lives.";
        conditions = "";
    };
    class blood_bag {
        variable = "blood_bag";
        displayName = "Blood Bag";
        weight = 4;
        buyPrice = 300;
        sellPrice = 175;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_bloodbag.paa";
        description = "Allows you to extend the time it'll take someone to bleedout...";
        conditions = "";
    };

    // Harvesting Items
    class pickaxe {
        variable = "pickaxe";
        displayName = "Pickaxe";
        weight = 2;
        buyPrice = 750;
        sellPrice = 375;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_pickaxe.paa";
        description = "A sturdy tool that allows you to harvest almost any mineral.";
        conditions = "";
    };
    class shovel {
        variable = "shovel";
        displayName = "Shovel";
        weight = 2;
        buyPrice = 700;
        sellPrice = 350;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_shovel.paa";
        description = "A sturdy tool that allows you to collect large amounts of sand.";
        conditions = "";
    };
    class stick {
        variable = "stick";
        displayName = "Stick";
        weight = 1;
        buyPrice = 30;
        sellPrice = 15;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_shovel.paa"; // NEEDS CHANGED
        description = "A straight wooden stick that can be used to craft harvesting tools such as a pickaxe or a shovel.";
        conditions = "";
    };

    // Fuel Storage
    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "Empty Fuel Can";
        weight = 2;
        buyPrice = 20;
        sellPrice = 10;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_fuelEmpty.paa";
        description = "A empty can that was once filled with fuel.";
        conditions = "";
    };
    class fuelFull {
        variable = "fuelFull";
        displayName = "Full Fuel Can";
        weight = 5;
        buyPrice = 2800;
        sellPrice = 1400;
        illegal = false;
        save = true;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_fuel.paa";
        description = "A can filled with fuel.";
        conditions = "";
    };
    class siphonpump {
        variable = "siphonpump";
        displayName = "Fuel Siphon Pump";
        weight = 4;
        buyPrice = 20000;
        sellPrice = 10000;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_siphon.paa";
        description = "A tool used to siphon the fuel from tanks. (Rembmer an empty can to fill up!)";
        conditions = "";
    };

    // Misc. Items
    class fishingNet {
        variable = "fishingNet";
        displayName = "Fishing Net";
        weight = 4;
        buyPrice = 3000;
        sellPrice = 1500;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_fishingnet.paa";
        description = "Gives you the ability to catch fish while in a boat.";
        conditions = "";
    };
    class zipties {
        variable = "zipties";
        displayName = "Zipties";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 0;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ziptie.paa";
        description = "These can be used to restrain people.";
        conditions = "";
    };
    class blindfold {
        variable = "blindfold";
        displayName = "Blindfold";
        weight = 2;
        buyPrice = 15000;
        sellPrice = 0;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_blindfold.paa";
        description = "These can be used to block a restrained person's vision.";
        conditions = "";
    };
    class breathalyser {
        variable = "breathalyser";
        displayName = "Breathalyser";
        weight = 2;
        buyPrice = 0;
        sellPrice = 0;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_breathalyser.paa";
        description = "A piece of equipment used to check people's blood-alcohol level.";
        conditions = "";
    };
    class spikeStrip {
        variable = "spikeStrip";
        displayName = "Police Stinger";
        weight = 7;
        buyPrice = 0;
        sellPrice = 0;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_spikeStrip.paa";
        description = "Police can get these and place them on the road to bring vehicles to a stop, avoid them!";
        conditions = "";
    };
    class gpstracker {
        variable = "gpstracker";
        displayName = "GPS Tracker";
        weight = 3;
        buyPrice = 10000;
        sellPrice = 5000;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_gpstracker.paa";
        description = "This can be attached to your vehicle to track it.";
        conditions = "";
    };
    class lockpick {
        variable = "lockpick";
        displayName = "Lockpick";
        weight = 1;
        buyPrice = 1500;
        sellPrice = 750;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_lockpick.paa";
        description = "These can be used to break into a car, they can be very brittle at times so good luck!";
        conditions = "";
    };
    class boltcutter {
        variable = "boltcutter";
        displayName = "Boltcutter";
        weight = 5;
        buyPrice = 7500;
        sellPrice = 3750;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_boltCutter.paa";
        description = "Used to break into more secure areas such as government facilties and the HAVOC border.";
        conditions = "";
    };
    class hackingdevice {
        variable = "hackingdevice";
        displayName = "Hacking Device";
        weight = 15;
        buyPrice = 350000;
        sellPrice = 175000;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_hackingdevice.paa";
        description = "Used to break into more secure areas such as government facilties and the HAVOC border.";
        conditions = "";
    };
    class drill {
        variable = "drill";
        displayName = "Industrial Drill";
        weight = 15;
        buyPrice = 300000;
        sellPrice = 150000;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_blastingcharge.paa";
        description = "This drill is used to open the vault within HAVOC Armoury.";
        conditions = "";
    };
    class lock {
        variable = "lock";
        displayName = "Lock";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_lock.paa";
        description = "A secure lock that can be used to secure the likes of the police armoury doors.";
        conditions = "";
    };
    class scratchcard {
        variable = "scratchcard";
        displayName = "Scratchcard";
        weight = 1;
        buyPrice = 10000;
        sellPrice = 5000;
        illegal = false;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_scratchcard.paa";
        description = "Buy these and have a chance of making a massive amount of profit.";
        conditions = "";
    };

    // Run Items
    class corn {
        variable = "corn";
        displayName = "Corn";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3666;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_corn.paa";
        description = "Can be found on the corn fields of Altis. Popped into pop corn.";
        conditions = "";
    };
    class tobacco {
        variable = "tobacco";
        displayName = "Tobacco";
        weight = 4;
        buyPrice = -1;
        sellPrice = 5000;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_tobacco.paa";
        description = "Leaves of the tobacco plant use to make a cigars and cigarettes.";
        conditions = "";
    };
    class cigarette {
        variable = "cigarette";
        displayName = "Cigarette";
        weight = 2;
        buyPrice = 13790;
        sellPrice = 7000;
        illegal = "cigarette";
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_cigarette.paa";
        description = "A hand rolled cigarette made with the finest tobacco on Altis.";
        conditions = "";
    };
    class cigar {
        variable = "cigar";
        displayName = "Cigar";
        weight = 2;
        buyPrice = 35066;
        sellPrice = 17800;
        illegal = "cigar";
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_cigar.paa";
        description = "The finest of hand made cigars, the HAVOC General would approve.";
        conditions = "";
    };
    class coral {
        variable = "coral";
        displayName = "Coral";
        weight = 5;
        buyPrice = 18225;
        sellPrice = 9250;
        illegal = "coral";
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_coral.paa";
        description = "Coral can be found along the shoreline of Altis.";
        conditions = "";
    };
    class copper_ore {
        variable = "copper_ore";
        displayName = "Copper Ore";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_copperOre.paa";
        description = "Ore mined from the copper mine and can be processed at a processing site.";
        conditions = "";
    };
    class copper_bar {
        variable = "copper_bar";
        displayName = "Copper Bar";
        weight = 3;
        buyPrice = 5910;
        sellPrice = 3000;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_copper.paa";
        description = "A bar processed from a processing site using raw ore.";
        conditions = "";
    };
    class silver_ore {
        variable = "silver_ore";
        displayName = "Silver Ore";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2517;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_silverore.paa";
        description = "Ore mined from the silver mine and can be processed at a processing site.";
        conditions = "";
    };
    class silver_bar {
        variable = "silver_bar";
        displayName = "Silver Bar";
        weight = 3;
        buyPrice = 14874;
        sellPrice = 7550;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_silver.paa";
        description = "A bar processed from a processing site using raw ore.";
        conditions = "";
    };
    class iron_ore {
        variable = "iron_ore";
        displayName = "Iron Ore";
        weight = 5;
        buyPrice = -1;
        sellPrice = 1444;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_ironOre.paa";
        description = "Ore mined from the iron mine and can be processed at a processing site.";
        conditions = "";
    };
    class iron_bar {
        variable = "iron_bar";
        displayName = "Iron Bar";
        weight = 3;
        buyPrice = 8536;
        sellPrice = 4333;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_iron.paa";
        description = "A bar processed from a processing site using raw ore.";
        conditions = "";
    };
    class sand {
        variable = "sand";
        displayName = "Sand";
        weight = 1;
        buyPrice = -1;
        sellPrice = 555;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_sand.paa";
        description = "Material excavated from the sand mine which can be processed into glass at a processing site.";
        conditions = "";
    };
    class glass {
        variable = "glass";
        displayName = "Glass";
        weight = 1;
        buyPrice = 6566;
        sellPrice = 3333;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_glass.paa";
        description = "A pane processed from a processing site using sand.";
        conditions = "";
    };
    class unrefined_salt {
        variable = "unrefined_salt";
        displayName = "Unrefined Salt";
        weight = 3;
        buyPrice = -1;
        sellPrice = 1333;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_saltUnprocessed.paa";
        description = "Salt mined from the salt mine and can be processed at a processing site.";
        conditions = "";
    };
    class refined_salt {
        variable = "refined_salt";
        displayName = "Refined Salt";
        weight = 2;
        buyPrice = 7880;
        sellPrice = 4000;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_saltProcessed.paa";
        description = "A block processed from a processing site using salt.";
        conditions = "";
    };
    class bauxite {
        variable = "bauxite";
        displayName = "Bauxite";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1250;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_bauxite.paa";
        description = "Mined from the aluminium mine and can be processed at a processing site.";
        conditions = "";
    };
    class aluminium {
        variable = "aluminium";
        displayName = "Aluminium Bar";
        weight = 2;
        buyPrice = 7388;
        sellPrice = 3750;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_aluminium.paa";
        description = "A bar processed from a processing site using bauxite.";
        conditions = "";
    };
    class quartz {
        variable = "quartz";
        displayName = "Quartz";
        weight = 6;
        buyPrice = -1;
        sellPrice = 1416;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_quartz.paa";
        description = "The pure form of silicon. Can be processed into silicon at the silicon processor.";
        conditions = "";
    };
    class silicon {
        variable = "silicon";
        displayName = "Silicon";
        weight = 5;
        buyPrice = 8373;
        sellPrice = 4250;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_silicon.paa";
        description = "A refined form of quartz that can be sold for a great deal.";
        conditions = "";
    };
    class unrefined_oil {
        variable = "unrefined_oil";
        displayName = "Unrefined Oil";
        weight = 6;
        buyPrice = -1;
        sellPrice = 2111;
        illegal = "oil";
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_oilUnprocessed.paa";
        description = "Unprocessed oil. Can be processed to processed oil at the Oil Processor and then sold at the Oil Trader.";
        conditions = "";
    };
    class refined_oil {
        variable = "refined_oil";
        displayName = "Refined Oil";
        weight = 4;
        buyPrice = -1;
        sellPrice = 6333;
        illegal = "oil";
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_oilProcessed.paa";
        description = "Can be created from unprocessed oil at the oil processor. Sold at the oil trader.";
        conditions = "";
    };
    class petroleum {
        variable = "petroleum";
        displayName = "Petroleum";
        weight = 10;
        buyPrice = -1;
        sellPrice = 900;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = false;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_oilProcessed.paa";
        description = "Can be collected from an oil reserved and delivered to petrol stations.";
        conditions = "";
    };
    class uranium_ore {
        variable = "uranium_ore";
        displayName = "Uranium Ore";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_uraniumore.paa";
        description = "The pure form of silicon. Can be processed into silicon at the silicon processor.";
        conditions = "";
    };
    class uranium_barrel {
        variable = "uranium_barrel";
        displayName = "Uranium Barrel";
        weight = 2;
        buyPrice = 23640;
        sellPrice = 12000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_uraniumbarrel.paa";
        description = "Uranium Barrel up ready to be shipped to the highest bidder!";
        conditions = "";
    };
    class uncut_opal {
        variable = "uncut_opal";
        displayName = "Uncut Opal";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1980;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_opalUncut.paa";
        description = "A rare gem that can be found throughout various mines on Altis.";
        conditions = "";
    };
    class cut_opal {
        variable = "cut_opal";
        displayName = "Cut Opal";
        weight = 1;
        buyPrice = -1;
        sellPrice = 5940;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_opal.paa";
        description = "A finely cut gem that has been processed perfectly.";
        conditions = "";
    };
    class uncut_sapphire {
        variable = "uncut_sapphire";
        displayName = "Uncut Sapphire";
        weight = 1;
        buyPrice = -1;
        sellPrice = 3483;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_sapphireUncut.paa";
        description = "A rare gem that can be found throughout various mines on Altis.";
        conditions = "";
    };
    class cut_sapphire {
        variable = "cut_sapphire";
        displayName = "Cut Sapphire";
        weight = 1;
        buyPrice = -1;
        sellPrice = 10450;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_sapphire.paa";
        description = "A finely cut gem that has been processed perfectly.";
        conditions = "";
    };
    class uncut_ruby {
        variable = "uncut_ruby";
        displayName = "Uncut Ruby";
        weight = 1;
        buyPrice = -1;
        sellPrice = 9900;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_rubyUncut.paa";
        description = "A rare gem that can be found throughout various mines on Altis.";
        conditions = "";
    };
    class cut_ruby {
        variable = "cut_ruby";
        displayName = "Cut Ruby";
        weight = 1;
        buyPrice = -1;
        sellPrice = 29700;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_ruby.paa";
        description = "A finely cut gem that has been processed perfectly.";
        conditions = "";
    };
    class uncut_emerald {
        variable = "uncut_emerald";
        displayName = "Uncut Emerald";
        weight = 1;
        buyPrice = -1;
        sellPrice = 11900;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_emeraldUncut.paa";
        description = "A rare gem that can be found throughout various mines on Altis.";
        conditions = "";
    };
    class cut_emerald {
        variable = "cut_emerald";
        displayName = "Cut Emerald";
        weight = 1;
        buyPrice = -1;
        sellPrice = 35700;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_emerald.paa";
        description = "A finely cut gem that has been processed perfectly.";
        conditions = "";
    };
    class uncut_diamond {
        variable = "uncut_diamond";
        displayName = "Uncut Diamond";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1500;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_diamondUncut.paa";
        description = "A rare gem that can be found throughout various mines on Altis.";
        conditions = "";
    };
    class cut_diamond {
        variable = "cut_diamond";
        displayName = "Cut Diamond";
        weight = 1;
        buyPrice = -1;
        sellPrice = 4500;
        illegal = false;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_diamondCut.paa";
        description = "A finely cut gem that has been processed perfectly.";
        conditions = "";
    };
    class goldbar {
        variable = "goldbar";
        displayName = "Marked Goldbar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 200000;
        illegal = true;
        save = false;
        taxed = true;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_goldBar.paa";
        description = "Can be found in the HM. Treasury. Marked gold can be unmarked at the goldsmiths.";
        conditions = "";
    };
    class goldbarunmarked {
        variable = "goldbarunmarked";
        displayName = "Unmarked Goldbar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 250000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_goldBar.paa";
        description = "Can be made by taking a gold bar to the goldsmith.";
        conditions = "";
    };
    class plutonium {
        variable = "plutonium";
        displayName = "Plutonium";
        weight = 10;
        buyPrice = -1;
        sellPrice = 225000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_plutonium.paa";
        description = "A radioactive material found inside the HAVOC destroyer.";
        conditions = "";
    };
    class plutonium239 {
        variable = "plutonium239";
        displayName = "Plutonium-239";
        weight = 10;
        buyPrice = -1;
        sellPrice = 275000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_plutonium.paa";
        description = "A radioactive material that has been processed from plutonium found inside the HAVOC destroyer and enriched within a nuclear reactor.";
        conditions = "";
    };
    class chest {
        variable = "chest";
        displayName = "Treasure Chest";
        weight = 10;
        buyPrice = -1;
        sellPrice = 150000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_chest.paa";
        description = "You find these at shipwrecks located round Altis.";
        conditions = "";
    };
    class antique {
        variable = "antique";
        displayName = "Antique";
        weight = 5;
        buyPrice = -1;
        sellPrice = 300000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_chest.paa";
        description = "You find these at shipwrecks located round Altis.";
        conditions = "";
    };
    class stolen_cargo {
        variable = "stolen_cargo";
        displayName = "Stolen Cargo";
        weight = 10;
        buyPrice = -1;
        sellPrice = 35000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_stolenCargo.paa";
        description = "These can be collected from smuggler hideouts and transported across bordered for a large reward.";
        conditions = "";
    };
    class weaponspart1 {
        variable = "weaponspart1";
        displayName = "Weapon Parts";
        weight = 2;
        buyPrice = 1500;
        sellPrice = 750;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_weaponpart1.paa";
        description = "Weapon parts to create a gun!";
        conditions = "";
    };
    class weaponspart2 {
        variable = "weaponspart2";
        displayName = "Weapon Parts";
        weight = 2;
        buyPrice = 1500;
        sellPrice = 750;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_weaponpart2.paa";
        description = "Weapon parts to create a gun!";
        conditions = "";
    };
    class weapon {
        variable = "weapon";
        displayName = "Weapon Crate";
        weight = 4;
        buyPrice = -1;
        sellPrice = 12666;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_weaponsell.paa";
        description = "A crate with weapons you can sell at the weapon dealer.";
        conditions = "";
    };
    class cannabis {
        variable = "cannabis";
        displayName = "Cannabis";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3500;
        illegal = "weed";
        save = false;
        taxed = false;
        marketDisplay = true;
        processedItem = "marijuana";
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_cannabis.paa";
        description = "Collected from the weed field, processed into marijuana and sold at any drug dealer.";
        conditions = "";
    };
    class marijuana {
        variable = "marijuana";
        displayName = "Marijuana";
        weight = 4;
        buyPrice = 41370;
        sellPrice = 21000;
        illegal = "weed";
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_marijuana.paa";
        description = "Classic OG kush. Snoop would be proud. Sold at any drug dealer. Processed from cannabis collected at the weed field. Also has some medicinal effects.";
        conditions = "";
    };
    class heroin_unprocessed {
        variable = "heroin_unprocessed";
        displayName = "Opium Poppy";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3389;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        processedItem = "heroin_processed";
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_heroinUnprocessed.paa";
        description = "This is the nasty shit. Can be processed into pure herion and sold at any drug dealer.";
        conditions = "";
    };
    class heroin_processed {
        variable = "heroin_processed";
        displayName = "Heroin";
        weight = 4;
        buyPrice = 40050;
        sellPrice = 20333;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_heroinProcessed.paa";
        description = "Can be created from opium poppy and sold at any drug dealer. Also makes you lighter on your feet when consumed.";
        conditions = "";
    };
    class cocaine_unprocessed {
        variable = "cocaine_unprocessed";
        displayName = "Coca Leaf";
        weight = 5;
        buyPrice = -1;
        sellPrice = 4667;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        processedItem = "cocaine_processed";
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_cocaineUnprocessed.paa";
        description = "Can be collected at the cocaine field and processed into processed cocaine and sold at any drug dealer.";
        conditions = "";
    };
    class cocaine_processed {
        variable = "cocaine_processed";
        displayName = "Cocaine";
        weight = 4;
        buyPrice = 55160;
        sellPrice = 28000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_cocaineProcessed.paa";
        description = "The finest cocaine. Sold at any drug dealer (or to Charlie Sheen). Also makes you lighter on your feet when consumed.";
        conditions = "";
    };
    class ephedrine_barrels {
        variable = "ephedrine_barrels";
        displayName = "Ephedrine Barrels";
        weight = 10;
        buyPrice = 3000;
        sellPrice = 3000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_ephedrine.paa";
        description = "Ephedrine Barrels that are used to cook meth.";
        conditions = "";
    };
    class meth_processed {
        variable = "meth_processed";
        displayName = "Meth";
        weight = 4;
        buyPrice = 111305;
        sellPrice = 56500;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_meth.paa";
        description = "Meth. Can be sold at the Meth Hookup. Created by processing Ephedrine barrels. Also makes you lighter on your feet when consumed.";
        conditions = "";
    };
    class sassafras {
        variable = "sassafras";
        displayName = "Sassafras";
        weight = 8;
        buyPrice = -1;
        sellPrice = 7833;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        processedItem = "ecstasy";
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_sassafras.paa";
        description = "Sassafras leaves can be processed into ecstasy.";
        conditions = "";
    };
    class ecstasy {
        variable = "ecstasy";
        displayName = "Ecstasy";
        weight = 4;
        buyPrice = 92590;
        sellPrice = 47000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_ecstasy.paa";
        description = "This profound love, this sudden mind rush that has you absolutely floored. Can be sold at all dealers. Also makes you lighter on your feet when consumed.";
        conditions = "";
    };
    class moonshine {
        variable = "moonshine";
        displayName = "Moonshine";
        weight = 3;
        buyPrice = 43340;
        sellPrice = 22000;
        illegal = true;
        save = false;
        taxed = false;
        marketDisplay = true;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_moonshine.paa";
        description = "A toxic drink only the bravest dare to brew. Careful of HAVOC, word on the streets is they dont like this...";
        conditions = "";
    };

    // Misc. Items
    class bath_water {
        variable = "bath_water";
        displayName = "Belle Delphine's Bath Water";
        weight = 1;
        buyPrice = 69000;
        sellPrice = 34500;
        illegal = true;
        save = true;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = false;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {true, "Thirst"};
            value = 100;
        };
        icon = "ico_bathWater.paa";
        description = "A toxic drink only the bravest dare to brew. Careful of SKY, word on the streets is that he'd kill for this...";
        conditions = "";
    };

    class rock {
        variable = "rock";
        displayName = "Rock";
        weight = 10;
        buyPrice = -1;
        sellPrice = 1;
        illegal = false;
        save = false;
        taxed = false;
        marketDisplay = false;
        class dynmarket {
            dynmaic = true;
            driftPerc = 0.1;
        };
        class edibility {
            edible[] = {false, ""};
            value = -1;
        };
        icon = "ico_rock.paa";
        description = "Can be used to reduce jail time";
        conditions = "";
    };
};
