/*
	@File: CfgChops.hpp
	@Author: Lewis Mackinnon
	@description: Configures the settings behind the virtual item stores.
*/

class CfgShops {
    // Civilian Shops
    class general_market {
        name = "General Market";
        conditions = "";
        gangXP = false;
        items[] = { "waterBottle", "apple", "peach", "tbacon", "firstaidkit_virtual", "pickaxe", "shovel", "stick", "fuelEmpty", "fuelFull", "fishingNet", "lockpick", "scratchcard" };
    };
    class fuel_station_market {
        name = "Fuel Station Market";
        conditions = "";
        gangXP = false;
        items[] = { "waterBottle", "tbacon", "firstaidkit_virtual", "fuelEmpty", "fuelFull", "lockpick", "scratchcard" };
    };
    class fish_market {
        name = "Fish Market";
        conditions = "";
        gangXP = false;
        items[] = { "salema_raw", "salema_cooked", "ornate_raw", "ornate_cooked", "mackerel_raw", "mackerel_cooked", "tuna_raw", "tuna_cooked", "mullet_raw", "mullet_cooked","catshark_raw", "catshark_cooked" };
    };
    class hunting_market {
        name = "Hunting Market";
        conditions = "";
        gangXP = false;
        items[] = { "rabbit_raw", "rabbit_cooked", "hen_raw", "hen_cooked", "rooster_raw", "rooster_cooked", "sheep_raw", "sheep_cooked", "goat_raw", "goat_cooked" };
    };
    class so1_market {
        name = "SO1 Market";
        conditions = "playerSide isEqualTo civilian && { (player getVariable [""isSO1"", false]) }";
        gangXP = false;
        items[] = { "waterBottle", "coffee", "tea", "redgull", "doughnut", "tbacon", "firstaidkit_virtual", "blood_bag", "fuelEmpty", "fuelFull", "zipties", "blindfold", "breathalyser", "gpstracker", "lockpick" };
    };
    class coffee_shop {
        name = "Coffee Shop";
        conditions = "";
        gangXP = false;
        items[] = { "waterBottle", "tea", "doughnut" };
    };
    class red_burger {
        name = "Red Burger";
        conditions = "";
        gangXP = false;
        items[] = { "burger", "chips" };
    };
    class cfk_chicken {
        name = "CFK Chicken";
        conditions = "";
        gangXP = false;
        items[] = { "hen_cooked", "rooster_cooked", "chips" };
    };
    class local_pub {
        name = "Local Pub";
        conditions = "";
        gangXP = false;
        items[] = { "beer", "cider", "gin", "vodka", "whiskey" };
    };
    class drug_dealer {
        name = "Drug Dealer";
        conditions = "";
        gangXP = true;
        items[] = { "marijuana", "heroin_processed", "cocaine_processed", "meth_processed", "ecstasy" };
    };
    class moonshine_dealer {
        name = "Moonshine Dealer";
        conditions = "";
        gangXP = false;
        items[] = { "moonshine" };
    };
    class gold_buyer {
        name = "Gold Buyer";
        conditions = "";
        gangXP = false;
        items[] = { "goldbar", "goldbarunmarked" };
    };
    class plutonium_trader {
        name = "Plutonium Trader";
        conditions = "";
        gangXP = false;
        items[] = { "plutonium", "plutonium239" };
    };
    class antique_trader {
        name = "Antique Trader";
        conditions = "";
        gangXP = false;
        items[] = { "chest", "antique" };
    };
    class diamond_trader {
        name = "Diamond Trader";
        conditions = "";
        gangXP = false;
        items[] = { "uncut_diamond", "cut_diamond" };
    };
    class gem_trader {
        name = "Gem Trader";
        conditions = "";
        gangXP = true;
        items[] = { "uncut_opal", "cut_opal", "uncut_sapphire", "cut_sapphire", "uncut_ruby", "cut_ruby", "uncut_emerald", "cut_emerald", "uncut_diamond", "cut_diamond" };
    };
    class uranium_trader {
        name = "Uranium Trader";
        conditions = "";
        gangXP = false;
        items[] = { "uranium_barrel" };
    };
    class oil_trader {
        name = "Oil Trader";
        conditions = "";
        gangXP = false;
        items[] = { "refined_oil" };
    };
    class silicon_trader {
        name = "Oil Trader";
        conditions = "";
        gangXP = true;
        items[] = { "silicon" };
    };
    class metal_trader {
        name = "Metal Trader";
        conditions = "";
        gangXP = true;
        items[] = { "copper_bar", "silver_bar", "iron_bar", "aluminium" };
    };
    class glass_trader {
        name = "Glass Trader";
        conditions = "";
        gangXP = false;
        items[] = { "glass" };
    };
    class salt_trader {
        name = "Salt Trader";
        conditions = "";
        gangXP = false;
        items[] = { "refined_salt" };
    };
    class coral_exports {
        name = "Coral Exports";
        conditions = "";
        gangXP = false;
        items[] = { "coral" };
    };
    class turtle_dealer {
        name = "Turtle Dealer";
        conditions = "";
        gangXP = false;
        items[] = { "turtle_raw", "turtle_cooked" };
    };
    class cigarette_exports {
        name = "Cigarette Exports";
        conditions = "";
        gangXP = false;
        items[] = { "cigarette" };
    };
    class cigar_exports {
        name = "Cigar Exports";
        conditions = "";
        gangXP = false;
        items[] = { "cigar" };
    };
    class ephedrine_dealer {
        name = "Ephedrine Dealer";
        conditions = "playerSide isEqualTo civilian";
        gangXP = false;
        items[] = { "ephedrine_barrels" };
    };
    class weapon_parts_1 {
        name = "Weapon Parts Trader";
        conditions = "playerSide isEqualTo civilian";
        gangXP = false;
        items[] = { "weaponspart1" };
    };
    class weapon_parts_2 {
        name = "Weapon Parts Trader";
        conditions = "playerSide isEqualTo civilian";
        gangXP = false;
        items[] = { "weaponspart2" };
    };
    class weapon_trader {
        name = "Weapon Trader";
        conditions = "";
        gangXP = false;
        items[] = { "weapon" };
    };
    class medical_supplies {
        name = "Medical Supplies";
        conditions = "";
        gangXP = false;
        items[] = { "morphine", "fentanyl", "firstaidkit_virtual", "medikit_virtual", "blood_bag", "saline", "bandage", "gauze" };
    };
    class hmp_market {
        name = "HMP Market";
        conditions = "life_is_arrested";
        gangXP = false;
        items[] = { "waterBottle", "mre", "firstaidkit_virtual" };
    };
    class gulag_market {
        name = "Gulag Market";
        conditions = "life_is_arrested";
        gangXP = false;
        items[] = { "waterBottle", "mre", "firstaidkit_virtual" };
    };
    class hmp_rockmarket {
        name = "Rock Market";
        conditions = "life_is_arrested";
        gangXP = false;
        items[] = { "rock" };
    };
    class gulag_rockmarket {
        name = "Gulag Market";
        conditions = "life_is_arrested";
        gangXP = false;
        items[] = { "rock" };
    };
    class bar {
        name = "Kavala Bar";
        conditions = "";
        gangXP = false;
        items[] = { "beer", "whiskey", "vodka", "gin", "cider" };
    };
    class rebel_market {
        name = "Rebel Market";
        conditions = "playerSide isEqualTo civilian && (license_civ_rebel || license_civ_PMC) || { (player getVariable ['isCID', false]) || {player getVariable ['isHSS', false]}}";
        gangXP = false;
        items[] = { "waterBottle", "redgull", "tbacon", "firstaidkit_virtual", "fuelEmpty", "fuelFull", "siphonpump", "zipties", "blindfold", "lockpick", "boltcutter", "pickaxe", "shovel", "hackingdevice", "drill", "gpstracker" };
    };
    class apc_market {
        name = "APC Market";
        conditions = "playerSide isEqualTo west || { player getVariable ['isCID', false] }";
        items[] = { "waterBottle", "coffee", "tea", "redgull", "doughnut", "tbacon", "firstaidkit_virtual", "medikit_virtual", "blood_bag", "fuelFull", "breathalyser", "lock", "spikeStrip", "zipties" };
    };
    class apc_command_market {
        name = "APC Command Market";
        conditions = "playerSide isEqualTo west || { player getVariable ['isCID', false] }";
        gangXP = false;
        items[] = { "hackingdevice", "boltcutter", "drill", "goldbar" };
    };
    class havoc_command_market {
        name = "HAVOC Command Market";
        conditions = "playerSide isEqualTo east";
        gangXP = false;
        items[] = { "plutonium" };
    };
    class nhs_market {
        name = "NHS Market";
        conditions = "playerSide isEqualTo independent";
        gangXP = false;
        items[] = { "waterBottle", "coffee", "tea", "redgull", "doughnut", "tbacon", "morphine", "fentanyl", "firstaidkit_virtual", "medikit_virtual", "blood_bag", "fuelFull", "breathalyser", "saline", "bandage", "gauze" };
    };
    class hav_market {
        name = "HAVOC Market";
        conditions = "playerSide isEqualTo east";
        gangXP = false;
        items[] = { "waterBottle", "mre", "redgull", "tbacon", "firstaidkit_virtual", "blood_bag", "fuelFull", "siphonpump", "havoc_entry", "havoc_work", "zipties", "blindfold", "lockpick", "boltcutter", "hackingdevice" };
    };
    class hidden_market {
        name = "Belle Delphine's Gamer Store";
        conditions = """fangirl"" in PHX_Achievements";
        gangXP = false;
        items[] = { "bath_water" };
    };
};
