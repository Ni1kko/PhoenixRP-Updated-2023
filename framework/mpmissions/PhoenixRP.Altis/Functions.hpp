class GUI {
    tag = "PHXUI";

    class Layers {
        file = "GUI\Scripts\Layers";
        class createLayer {};
        class getLayer {};
        class destroyLayer {};
    };

    class Loading {
        file = "GUI\Scripts\Loading";
        class loadingFailed {};
    };
};

class Socket_Reciever {
    tag = "SOCK";
    class SQL_Socket {
        file = "PHX\Session";
        class syncData {};
        class updatePartial {};
        class updateRequest {};
        class getRemoteDestination {};
    };
};

class SpyGlass {
    tag = "SPY";
    class Functions {
        file = "SpyGlass";
        class cookieJar{};
        class notifyAdmins{};
        class observe{};
    };
};

class Life_Client_Core {
    tag = "life";

    class Master_Directory {
        file = "core";
        class survival {};
    };

    class Actions {
        file = "core\actions";
        class arrestAction {};
        class buyLicense {};
        class dpFinish {};
        class catchFish {};
        class dropFishingNet {};
        class escortAction {};
        class getDPMission {};
        class gutAnimal {};
        class healHospital {};
        class impoundAction {};
        class packupSpikes {};
        class pickupMoney {};
        class postBail {};
        class processAction {};
        class pulloutAction {};
        class putInCar {};
        class repairTruck {};
        class restrainAction {};
        class robAction {};
        class searchAction {};
        class searchVehAction {};
        class serviceVehicle {};
        class stopEscorting {};
        class storeVehicle {};
        class surrender {};
        class unrestrain {};
        class garageRefund {};
        class waterCooler {};
    };

    class Civilian {
        file = "core\civilian";
        class civLoadout {};
        class freezePlayer {};
        class jail {};
        class jailMe {};
        class knockedOut {};
        class knockoutAction {};
        class robPerson {};
        class robReceive {};
        class tazed {};
    };

    class Config {
        file = "core\config";
        class houseConfig {};
        class itemWeight {};
        class vehicleAnimate {};
        class vehicleWeightCfg {};
    };

    class Cop {
        file = "core\cop";
        class bountyReceive {};
        class copLights {};
        class copLoadout {};
        class copSearch {};
        class copSiren {};
        class doorAnimate {};
        class licenseCheck {};
        class licensesRead {};
        class questionDealer {};
        class radar {};
        class repairDoor {};
        class restrain {};
        class searchClient {};
        class sirenLights {};
        class spikeStripEffect {};
        class ticketGive {};
        class ticketPrompt {};
        class vehInvSearch {};
        class wantedGrab {};
    };

    class Dialog_Controls {
        file = "dialog\function";
        class displayHandler {};
        class garageLBChange {};
        class impoundMenu {};
        class sellGarage {};
        class setMapPosition {};
        class spawnConfirm {};
        class spawnMenu {};
        class spawnPointCfg {};
        class spawnPointSelected {};
        class unimpound {};
        class vehicleGarage {};
    };

    class Functions {
        file = "core\functions";
        class AAN {};
        class accType {};
        class actionKeyHandler {};
        class animSync {};
        class calWeightDiff {};
        class clearVehicleAmmo {};
        class dropItems {};
        class escInterupt {};
        class fetchCfgDetails {};
        class fetchVehInfo {};
        class giveDiff {};
        class handleInv {};
        class handleItem {};
        class hideObj {};
        class inventoryClosed {};
        class inventoryOpened {};
        class keyHandler {};
        class loadGear {};
        class nearATM {};
        class nearestDoor {};
        class nearUnits {};
        class numberText {};
        class onTakeItem {};
        class pullOutVeh {};
        class pushObject {};
        class receiveItem {};
        class receiveMoney {};
        class revealObjects {};
        class saveGear {};
        class simDisable {};
        class stripDownPlayer {};
        class getBuildingPositions {};
        class PlayerInBuilding {};
        class inString {};
        class index {};
        class isNumber {};
        class clientGetKey {};
        class playerQuery {};
    };

    class Housing {
        file = "core\housing";
        class copHouseOwner {};
        class lightHouse {};
        class lightHouseAction {};
    };

    class Items {
        file = "core\items";
        class boltcutter {};
        class flashbang {};
        class jerrycanRefuel {};
        class jerryRefuel {};
        class lockpick {};
        class spikeStrip {};
    };

    class Medical_System {
        file = "core\medical";
        class medicLights {};
        class medicLoadout {};
        class medicRequest {};
        class medicSiren {};
        class medicSirenLights {};
        class requestMedic {};
    };

    class Network {
        file = "core\functions\network";
        class broadcast {};
        class corpse {};
        class jumpFnc {};
        class say3D {};
        class setFuel {};
    };

    class Player_Menu {
        file = "core\pmenu";
        class giveItem {};
        class giveMoney {};
        class keyDrop {};
        class keyGive {};
        class pardon {};
        class removeItem {};
        class s_onChar {};
        class s_onCheckedChange {};
        class s_onSliderChange {};
        class settingsMenu {};
        class updateViewDistance {};
        class useItem {};
        class wantedAddP {};
        class wantedInfo {};
        class wantedList {};
        class wantedMenu {};
    };

    class Shops {
        file = "core\shops";
        class 3dPreviewDisplay {};
        class 3dPreviewExit {};
        class 3dPreviewInit {};
        class buyClothes {};
        class changeClothes {};
        class chopShopMenu {};
        class chopShopSelection {};
        class chopShopSell {};
        class clothingFilter {};
        class clothingMenu {};
        class fuelLBchange {};
        class fuelStatOpen {};
        class levelCheck {};
        class vehicleShopBuy {};
        class vehicleShopLBChange {};
        class vehicleShopMenu {};
        class virt_buy {};
        class virt_menu {};
        class virt_sell {};
        class virt_update {};
        class weaponShopMenu {};
    };

    class Vehicle {
        file = "core\vehicle";
        class addVehicle2Chain {};
        class colorVehicle {};
        class deviceMine {};
        class FuelRefuelcar {};
        class lockVehicle {};
        class openInventory {};
        class vehicleOwners {};
        class vehicleWeight {};
        class vehInventory {};
        class vehStoreItem {};
        class vehTakeItem {};
        class vehiclecolor3DRefresh {};
    };
};

#include "PHX\Functions.h"