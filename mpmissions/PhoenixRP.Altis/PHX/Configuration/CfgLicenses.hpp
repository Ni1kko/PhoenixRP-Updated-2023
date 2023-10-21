/*
	@File: CfgLicenses.hpp
	@Author: Lewis Mackinnon
	@Description: Configures the settings behind the licenses.
*/

class CfgLicenses {
    // Driver and Vehicle Licencing
    class driver {
        variable = "driver";
        displayName = "Driving License";
        price = 10000;
        illegal = false;
        side = "civ";
    };
    class trucking {
        variable = "trucking";
        displayName = "Trucking License";
        price = 50000;
        illegal = false;
        side = "civ";
    };
    class boat {
        variable = "boat";
        displayName = "Boating License";
        price = 20000;
        illegal = false;
        side = "civ";
    };
    class pilot {
        variable = "pilot";
        displayName = "Piloting License";
        price = 50000;
        illegal = false;
        side = "civ";
    };
    class dive {
        variable = "dive";
        displayName = "Scuba License";
        price = 10000;
        illegal = false;
        side = "civ";
    };
    class home {
        variable = "home";
        displayName = "Homeowners License";
        price = 500000;
        illegal = false;
        side = "civ";
    };
    // Go-Karting Store
    class karting {
        variable = "karting";
        displayName = "Karting License";
        price = 5000;
        illegal = false;
        side = "civ";
    };
    // Firearm Stores
    class gun {
        variable = "gun";
        displayName = "Handgun Certificate";
        price = 75000;
        illegal = false;
        side = "civ";
    };
    class SMG {
        variable = "SMG";
        displayName = "SMG Certificate";
        price = 100000;
        illegal = false;
        side = "civ";
    };
    // Civian Jobs
    class taximan {
        variable = "taximan";
        displayName = "Taximan License";
        price = 250000;
        illegal = false;
        side = "civ";
    };
    class repair {
        variable = "repair";
        displayName = "Altis Services License";
        price = 250000;
        illegal = false;
        side = "civ";
    };
    class lawyer {
        variable = "lawyer";
        displayName = "Lawyer License";
        price = 250000;
        illegal = false;
        side = "civ";
    };
    class news {
        variable = "news";
        displayName = "Altis News License";
        price = 250000;
        illegal = false;
        side = "civ";
    };  
    class SO1 {
        variable = "SO1";
        displayName = "SO1 Protection Officer";
        price = -1;
        illegal = false;
        side = "civ";
    };   
    // Processing Licenses 
    class cider {
        variable = "cider";
        displayName = "Cider Processing";
        price = 10000;
        illegal = false;
        side = "civ";
    };
    class tobacco {
        variable = "tobacco";
        displayName = "Tobacco Processing";
        name = "Tobacco Processing";
        price = 45000;
        illegal = false;
        side = "civ";
    };
    class copper {
        variable = "copper";
        displayName = "Copper Processing";
        price = 10000;
        illegal = false;
        side = "civ";
    };
    class iron {
        variable = "iron";
        displayName = "Iron Processing";
        price = 35000;
        illegal = false;
        side = "civ";
    };
    class silver {
        variable = "silver";
        displayName = "Silver Processing";
        price = 45000;
        illegal = false;
        side = "civ";
    };
    class silicon {
        variable = "silicon";
        displayName = "Silicon Processing";
        price = 15000;
        illegal = false;
        side = "civ";
    };
    class aluminium {
        variable = "aluminium";
        displayName = "Aluminium Processing";
        price = 45000;
        illegal = false;
        side = "civ";
    };
    class sand {
        variable = "sand";
        displayName = "Sand Processing";
        price = 15000;
        illegal = false;
        side = "civ";
    };
    class salt {
        variable = "salt";
        displayName = "Salt Processing";
        price = 15000;
        illegal = false;
        side = "civ";
    };
    class oil {
        variable = "oil";
        displayName = "Oil Processing";
        price = 35000;
        illegal = false;
        side = "civ";
    };
    class gem {
        variable = "gem";
        displayName = "Gem Processing";
        price = 500000;
        illegal = false;
        side = "civ";
    };
    class diamond {
        variable = "diamond";
        displayName = "Diamond Processing";
        price = 50000;
        illegal = false;
        side = "civ";
    };
    class uranium {
        variable = "uranium";
        displayName = "Uranium Processing";
        price = 150000;
        illegal = true;
        side = "civ";
    };
    class marijuana {
        variable = "marijuana";
        displayName = "Weed Processing";
        price = 135000;
        illegal = true;
        side = "civ";
    };
    class heroin {
        variable = "heroin";
        displayName = "Heroin Processing";
        price = 120000;
        illegal = true;
        side = "civ";
    };
    class cocaine {
        variable = "cocaine";
        displayName = "Cocaine Processing";
        price = 150000;
        illegal = true;
        side = "civ";
    };
    class meth {
        variable = "meth";
        displayName = "Meth Processing";
        price = 150000;
        illegal = true;
        side = "civ";
    };
    class ecstasy {
        variable = "ecstasy";
        displayName = "Ecstasy Processing";
        price = 150000;
        illegal = true;
        side = "civ";
    };
    class moonshine {
        variable = "moonshine";
        displayName = "Moonshine Processing";
        price = 150000;
        illegal = true;
        side = "civ";
    };
    class multiDrug {
        variable = "multiDrug";
        displayName = "Multi-Drug Processing";
        price = 250000;
        illegal = true;
        side = "civ";
    };
    class weapon {
        variable = "weapon";
        displayName = "Weapon Trader";
        price = 150000;
        illegal = true;
        side = "civ";
    };
    // Rebel Outposts
    class rebel {
        variable = "rebel";
        displayName = "Basic Rebel";
        price = 1000000;
        illegal = true;
        side = "civ";
    };
    class PMC {
        variable = "PMC";
        displayName = "Advanced Rebel";
        price = 10000000;
        illegal = true;
        side = "civ";
    };
    // Donator License
    class donator {
        variable = "donator";
        displayName = "Donator";
        price = -1;
        illegal = false;
        side = "civ";
    };
    // APC Authorisations
    class marksman {
        variable = "marksman";
        displayName = "Marksman Authorisation";
        price = -1;
        illegal = false;
        side = "cop";
    };
    class advancedDriving {
        variable = "marksman";
        displayName = "Advanced Driving Authorisation";
        price = -1;
        illegal = false;
        side = "cop";
    };
    class marineAsset  {
        variable = "marineAsset";
        displayName = "Marine Asset Authorisation";
        price = -1;
        illegal = false;
        side = "cop";
    };
    class ar2Darter  {
        variable = "ar2Darter";
        displayName = "AR-2 Darter Authorisation";
        price = -1;
        illegal = false;
        side = "cop";
    };
};
