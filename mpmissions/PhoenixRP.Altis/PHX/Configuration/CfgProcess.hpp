/*
	@File: CfgProcess.hpp
	@Author: Lewis Mackinnon
	@Description: Configures the processing settings.
*/
class CfgProcess {
    class rabbit {
        MaterialsReq[] = {{"rabbit_raw",1}};
        MaterialsGive[] = {{"rabbit_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class hen {
        MaterialsReq[] = {{"hen_raw",1}};
        MaterialsGive[] = {{"hen_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class rooster {
        MaterialsReq[] = {{"rooster_raw",1}};
        MaterialsGive[] = {{"rooster_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class sheep {
        MaterialsReq[] = {{"sheep_raw",1}};
        MaterialsGive[] = {{"sheep_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class goat {
        MaterialsReq[] = {{"goat_raw",1}};
        MaterialsGive[] = {{"goat_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class salema {
        MaterialsReq[] = {{"salema_raw",1}};
        MaterialsGive[] = {{"salema_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class ornate {
        MaterialsReq[] = {{"ornate_raw",1}};
        MaterialsGive[] = {{"ornate_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class mackerel {
        MaterialsReq[] = {{"mackerel_raw",1}};
        MaterialsGive[] = {{"mackerel_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class tuna {
        MaterialsReq[] = {{"tuna_raw",1}};
        MaterialsGive[] = {{"tuna_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class mullet {
        MaterialsReq[] = {{"mullet_raw",1}};
        MaterialsGive[] = {{"mullet_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class catshark {
        MaterialsReq[] = {{"catshark_raw",1}};
        MaterialsGive[] = {{"catshark_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class turtle {
        MaterialsReq[] = {{"turtle_raw",1}};
        MaterialsGive[] = {{"turtle_cooked",1}};
        profession[] = { "Prof_Cooking", 0, 1, 50 };
        Text = "Cooking food...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class apple {
        MaterialsReq[] = {{"apple",1}};
        MaterialsGive[] = {{"cider",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing apples...";
        giveXP = false; 
        RequiredLicense = "cider";
        NoLicenseCost = 250;
    };
    class tobaccoCigarette {
        MaterialsReq[] = {{"tobacco",1}};
        MaterialsGive[] = {{"cigarette",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing tobacco...";
        giveXP = true;
        RequiredLicense = "tobacco";
        NoLicenseCost = 250;
    };
    class tobaccoCigar {
        MaterialsReq[] = {{"tobacco",2}};
        MaterialsGive[] = {{"cigar",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing tobacco...";
        giveXP = true;
        RequiredLicense = "tobacco";
        NoLicenseCost = 250;
    };
    class copper {
        MaterialsReq[] = {{"copper_ore",1}};
        MaterialsGive[] = {{"copper_bar",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing copper...";
        giveXP = true;
        RequiredLicense = "copper";
        NoLicenseCost = 250;
    };
    class iron {
        MaterialsReq[] = {{"iron_ore",1}};
        MaterialsGive[] = {{"iron_bar",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing iron...";
        giveXP = true;
        RequiredLicense = "iron";
        NoLicenseCost = 250;
    };
    class silver {
        MaterialsReq[] = {{"silver_ore",1}};
        MaterialsGive[] = {{"silver_bar",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing silver...";
        giveXP = true;
        RequiredLicense = "silver";
        NoLicenseCost = 250;
    };
    class silicon {
        MaterialsReq[] = {{"quartz",1}};
        MaterialsGive[] = {{"silicon",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing silicon...";
        giveXP = true;
        RequiredLicense = "silicon";
        NoLicenseCost = 250;
    };
    class aluminium {
        MaterialsReq[] = {{"bauxite",1}};
        MaterialsGive[] = {{"aluminium",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing aluminium...";
        giveXP = true;
        RequiredLicense = "aluminium";
        NoLicenseCost = 250;
    };
    class sand {
        MaterialsReq[] = {{"sand",2}};
        MaterialsGive[] = {{"glass",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing sand...";
        giveXP = true;
        RequiredLicense = "sand";
        NoLicenseCost = 250;
    };
    class salt {
        MaterialsReq[] = {{"unrefined_salt",1}};
        MaterialsGive[] = {{"refined_salt",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing salt...";
        giveXP = true;
        RequiredLicense = "salt";
        NoLicenseCost = 250;
    };
    class oil {
        MaterialsReq[] = {{"unrefined_oil",1}};
        MaterialsGive[] = {{"refined_oil",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing oil...";
        giveXP = true;
        RequiredLicense = "oil";
        NoLicenseCost = 250;
    };
    class opal {
        MaterialsReq[] = {{"uncut_opal",1}};
        MaterialsGive[] = {{"cut_opal",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing opal...";
        giveXP = true;
        RequiredLicense = "gem";
        NoLicenseCost = 250;
    };
    class sapphire {
        MaterialsReq[] = {{"uncut_sapphire",1}};
        MaterialsGive[] = {{"cut_sapphire",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing sapphire...";
        giveXP = true;
        RequiredLicense = "gem";
        NoLicenseCost = 250;
    };
    class ruby {
        MaterialsReq[] = {{"uncut_ruby",1}};
        MaterialsGive[] = {{"cut_ruby",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing ruby...";
        giveXP = true;
        RequiredLicense = "gem";
        NoLicenseCost = 250;
    };
    class emerald {
        MaterialsReq[] = {{"uncut_emerald",1}};
        MaterialsGive[] = {{"cut_emerald",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing emerald...";
        giveXP = true;
        RequiredLicense = "gem";
        NoLicenseCost = 250;
    };
    class diamond {
        MaterialsReq[] = {{"uncut_diamond",1}};
        MaterialsGive[] = {{"cut_diamond",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing diamond...";
        giveXP = true;
        RequiredLicense = "diamond";
        NoLicenseCost = 250;
    };
    class uranium {
        MaterialsReq[] = {{"uranium_ore",2}};
        MaterialsGive[] = {{"uranium_barrel",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing uranium...";
        giveXP = true;
        RequiredLicense = "uranium";
        NoLicenseCost = 250;
    };
    class weed {
        MaterialsReq[] = {{"cannabis",2}};
        MaterialsGive[] = {{"marijuana",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing weed...";
        giveXP = true;
        RequiredLicense = "marijuana";
        NoLicenseCost = 250;
    };
    class heroin {
        MaterialsReq[] = {{"heroin_unprocessed",2}};
        MaterialsGive[] = {{"heroin_processed",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing opium...";
        giveXP = true;
        RequiredLicense = "heroin";
        NoLicenseCost = 250;
    };
    class cocaine {
        MaterialsReq[] = {{"cocaine_unprocessed",2}};
        MaterialsGive[] = {{"cocaine_processed",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing coca...";
        giveXP = true;
        RequiredLicense = "cocaine";
        NoLicenseCost = 250;
    };
    class meth {
        MaterialsReq[] = {{"ephedrine_barrels",2}};
        MaterialsGive[] = {{"meth_processed",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing meth...";
        giveXP = true;
        RequiredLicense = "meth";
        NoLicenseCost = 250;
    };
    class ecstasy {
        MaterialsReq[] = {{"sassafras",2}};
        MaterialsGive[] = {{"ecstasy",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing ecstasy...";
        giveXP = true;
        RequiredLicense = "ecstasy";
        NoLicenseCost = 250;
    };
    class moonshine {
        MaterialsReq[] = {{"corn",2}};
        MaterialsGive[] = {{"moonshine",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing moonshine...";
        giveXP = true;
        RequiredLicense = "moonshine";
        NoLicenseCost = 250;
    };
    class weapon {
        MaterialsReq[] = {{"weaponspart1",1},{"weaponspart2",1}};
        MaterialsGive[] = {{"weapon",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Processing weapon...";
        giveXP = true;
        RequiredLicense = "weapon";
        NoLicenseCost = 250;
    };
    class gold {
        MaterialsReq[] = {{"goldbar",1}};
        MaterialsGive[] = {{"goldbarunmarked",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Unmarking gold...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
    class plutonium {
        MaterialsReq[] = {{"plutonium",1}};
        MaterialsGive[] = {{"plutonium239",1}};
        profession[] = { "Prof_Processing", 0, 1, 50 };
        Text = "Enriching plutonium...";
        giveXP = true;
        RequiredLicense = "";
        NoLicenseCost = 0;
    };
};