class PHX_Core {
    tag = "PHX";

    class Master_Directory {
        file = "PHX";
        class welcomeNotification {};
    };

    class Query {
        file = "PHX\Session\Query";
        class handlePlayerInfo {};
        class queryPlayerInfo {};
    };

    class Actions {
        file = "PHX\Actions";
        class unflipVehicle {};
        class dragAction {};
        class stopDragging {};
        class gatherItem {};
        class prestige {};
        class createFakeID {};
        class enlist {};
        class vote {};
        class elevator {};
        class setDonatorSettings {};
        class firstAid {};
        class robStore {};
        class craft {};
        class getPatrol {};
        class openCCTV {};
        class panic {};
        class repack {};
        class repackAction {};
        class sitDown {};
        class transferVehicle {};
        class overDose {};
        class siphon {};
        class skyDive {};
        class tracker {};
        class trackerAction {};
        class blindfold {};
        class blindfoldAction {};
        class seizeCommunications {};
        class breakIntoVehicle {};
        class captureObject {};
        class crushVehicle {};
        class seizeObjects {};
        class setTitle {};
    };

    class Achievements {
        file = "PHX\Achievements";
        class unlockAchievement {};
    };

    class Admin {
        file = "PHX\Admin";
        class doPower {};
        class logUsage {};
    };

    class Admin_Functions {
        file = "PHX\Admin\Functions";
        class dutyToggle {};
        class handleESP {};
        class handleMarkers {};
        class queryPlayer {};
        class recieveQuery {};
        class invisibility {};
        class healPlayer {};
        class revivePlayer {};
        class reviveAll {};
        class healAll {};
        class teleport {};
        class openCompensate {};
        class compensate {};
        class teleportToTarget {};
        class teleportTargetHere {};
        class teleportToVehicle {};
        class vehicleFuel {};
        class vehicleEject {};
        class vehicleRepair {};
        class freeze {};
        class openCamera {};
        class spawnItem {};
        class spectate {};
    };

    class Initialization {
        file = "PHX\Initialization";
        class Initialization {};
        class chooseSide {};
    };

    class Initialization_Sides {
        file = "PHX\Initialization\Sides";
        class initCivilian {};
        class initPolice {};
        class initMedic {};
        class initHAVOC {};
    };

    class Initialization_Setup {
        file = "PHX\Initialization\Setup";
        class setupActions {};
        class setupEVH {};
    };

    class Functions {
        file = "PHX\Functions";
        class playerSkins {};
        class reskin {};
        class notify {};
        class getGarage {};
        class hasItem {};
        class hint {};
        class handleMoney {};
        class canUse {};
        class checkLoadout {};
        class getDefaultLoadout {};
        class unitByUID {};
        class colorConfigToRGBA {};
        class changeVisibility {};
        class healTarget {};
        class setFuel {};
        class setAmmo {};
        class iconDir {};
        class getPrefix {};
        class groupByID {};
        class pushBackAt {};
        class getNearestLocation {};
        class trackPatrol {};
        class isRedZone {};
        class remoteLicense {};
        class isIllegal {};
        class ownsBase {};
        class getItems {};
        class canFire {};
        class isSafeZone {};
        class callBackup {};
        class isKindOf {};
        class unitsInZone {};
        class sideLockDoor {};
        class numbersInRange {};
        class getPaycheck {};
        class clearItems {};
        class ownsObject {};
        class maxByIndex {};
        class minByIndex {};
        class getAllDoors {};
        class hasGPS {};
        class drawGroupIcon {};
        class setupGroupIcons {postInit = 1;};
        class hasGroup {};
        class progressBar {};
        class forceOpenInv {};
        class moveIn {};
        class handleItem {};
        class bool {};
        class logIt {};
        class setTag {};
        class snow {};
        class calSellPrice {};
        class nearBase {};
        class setEdit {};
        class getVehicleAmmo {};
        class logOff {};
        class spreadKeys {};
    };

    class Items {
        file = "PHX\Items";
        class coke {};
        class heroin {};
        class weed {};
        class drugs {};
        class drink {};
        class cigarette {};
        class redgull {};
        class breathalyse {};
    };

    class Factions {
        file = "PHX\Factions";
        class getRank {};
    };

    class Professions {
        file = "PHX\Professions";
        class increaseProfession {};
    };

    class Levels {
        file = "PHX\Levels";
        class handleXP {};
        class calculateLevel {};
        class changePerks {};
        class getPerkLimit {};
    }; 

    class GUI_FUNCTIONS {
        file = "PHX\GUI\Functions";
        class setupFilter {};
        class searchList {};
        class confirmBox {};
        class editBox {};
        class initBacking {};
        class wipeElements {};
        class changePage {};
        class guiHandler {};
    };

    class GUI_LIC_FUNCTIONS {
        file = "PHX\GUI\Licenses\Functions";
        class openLicenses {};
        class LicenseLBChanged {};
    };

    class GUI_PRO_FUNCTIONS {
        file = "PHX\GUI\Processing\Functions";
        class openProcessing {};
        class ProcessingLBChanged {};
    };

    class GUI_HUD_Functions {
        file = "PHX\GUI\HUD\Functions";
        class hudUpdate {};
        class hudSetup {};
        class nameTags { postInit = 1; };
        class D3DTextCal {}; // Thanks Sig...
        class enteranceText {};
        class combatZone {};
    };

    class GUI_Tablet_Functions {
        file = "PHX\GUI\Tablet\Functions";
        class openMenu {};
        class switchApp {};
        class escapeHandle {};
        class onLoad {};
        class updatePerks {};
        class switchProgression {};
        class setBackground {};
        class changeBackground {};
    };

    class GUI_Interaction_Functions {
        file = "PHX\GUI\Interactions\Functions";
        class createMenu {};
        class getButtons {};
        class getBuildingInteractions {};
    };

    class GUI_Interaction_Menus {
        file = "PHX\GUI\Interactions\Functions\Buttons";
        class Vehicle {};
        class House {};
        class General {};
        class Placeables {};
        class Repair {};
    };

    class GUI_MAIN_MENU_Functions {
        file = "PHX\GUI\MainMenu\Functions";
        class mainMenu {};
        class viewCharacter {};
    };

    class GUI_LOADING_Functions {
        file = "PHX\GUI\Loading\Functions";
        class setLoadingStage {};
    };
    
    class GUI_PROGRESS_Functions {
        file = "PHX\GUI\Progress\Functions";
        class handleProgress {};
    };

    class GUI_DISPUTING_Functions  {
        file = "PHX\GUI\Disputing\Functions";
        class openDisputing {};
        class switchDisputes {};
        class disputePlayer {};
        class recieveDispute {};
    };

    class GUI_ID_Functions  {
        file = "PHX\GUI\IDCard\Functions";
        class RscIDLookup {};
        class RscIDCard {};
    };

    class GUI_GOVERNMENT_Functions  {
        file = "PHX\GUI\Government\Functions";
        class openEnlistment {};
        class openVoting {};
        class switchVote {};
        class openLegality {};
        class AANBroadcast {};
    };

    class GUI_CRAFTING_Functions {
        file = "PHX\GUI\Crafting\Functions";
        class openCrafting {};
        class switchBlueprint {};
        class updateList {};
    };

    class GUI_BIDDING_Functions {
        file = "PHX\GUI\BaseBidding\Functions";
        class openBase {};
        class baseBid {};
        class flag {};
    };

    class GUI_HOUSING_Functions {
        file = "PHX\GUI\Housing\Functions";
        class openStorage {};
        class updateCategories {};
        class switchCategory {};
        class updateInventory {};
        class purchaseHouseUpgrade {};
        class openUpgrades {};
        class houseUpgrade {};
    };

    class GUI_MEDICAL_Functions {
        file = "PHX\GUI\Medical\Functions";
        class openMedical {};
        class medicalPerform {};
        class medicalPerformClient {};
    };

    class GUI_MOVES_Functions {
        file = "PHX\GUI\MovesMenu\Functions";
        class movesMenu {};
    };

    class GUI_PLACEABLES_Functions {
        file = "PHX\GUI\Placeables\Functions";
        class placeablesMenu {};
        class placeablesRemoveAll {};
        class placeablePlace {};
        class placeableCancel {};
        class placeablesPlaceComplete {};
        class deletePlaceables {};
        class placeableDelete {};
    };

    class GUI_BLACKJACK_Functions {
        file = "PHX\GUI\Gamble\Blackjack";
        class blackjack {};
        class blackjackDealerHit {};
        class blackjackHit {};
        class blackjackStay {};
        class blackjackTotal {};
    };

    class GUI_HIGHERORLOWER_Functions {
        file = "PHX\GUI\Gamble\HigherOrLower";
        class higherLower {};
        class higherBet {};
        class higherLowerCashout {};
        class lowerBet {};
    };

    class GUI_ROULETTE_Functions {
        file = "PHX\GUI\Gamble\Roulette";
        class rouletteBet {};
        class rouletteSpin {};
    };

    class GUI_SLOTS_Functions {
        file = "PHX\GUI\Gamble\Slots";
        class slotSpin {};
    };

    class GUI_SCRATCHCARD_Functions {
        file = "PHX\GUI\Gamble\ScratchCard";
        class scratchCard {};
        class scratchCardBonus {};
    };

    class GUI_ATM_Functions {
        file = "PHX\GUI\ATM\Functions";
        class atmMenu {};
        class bankDeposit {};
        class bankWithdraw {};
        class gangDeposit {};
        class gangWithDraw {};
        class wireTransfer {};
        class wireTransferClient {};
    };

    class GUI_ForceFeed_Functions {
        file = "PHX\GUI\ForceFeed\Functions";
        class forceFeed {};
    };

    class GUI_RobInventory_Functions {
        file = "PHX\GUI\RobInventory\Functions";
        class robInventory {};
    };

    class GUI_Tuning_Functions {
        file = "PHX\GUI\Tuning\Functions";
        class openTuning {};
        class repaint {};
        class nitrous {};
        class openVehicleUpgrades {};
        class openVehicleUpgradesList {};
        class purchaseVehicleUpgrade {};
        class handleVehicleUpgrade {};
    };

    class GUI_Weapon_Functions {
        file = "PHX\GUI\WeaponShop\Functions";
        class openWeaponStore {};
        class changeWeaponSelection {};
        class addToCart {};
        class checkOut {};
    };

    class GUI_Transactions_Functions {
        file = "PHX\GUI\Transactions\Functions";
        class openTransactions {};
        class handleTransaction {};
    };

    class GUI_MAIL_Functions {
        file = "PHX\GUI\Mail\Functions";
        class openMail {};
        class claimMail {};
    };

    class GUI_Watchlist_Functions {
        file = "PHX\GUI\Watchlist\Functions";
        class removeWatchlist {};
        class addWatchlist {};
        class openWatchlist {};
    };

    class Map {
        file = "PHX\Map";
        class setupMarket {};
        class setupShop {};
        class setupVehicle {};
        class setupClothing {};
        class setupGarage {};
        class addActions {};
        class addPolls {};
        class addCameras {};
        class atmMarkers {};
    };

    class Events {
        file = "PHX\OnEvents";
        class onDamaged {};
        class onIncapacitated {};
        class onKilled {};
        class onRespawn {};
        class onRevived {};
        class onFire {};
        class onGetOut {};
    };

    class Medical {
        file = "PHX\Medical";
        class respawned {};
        class revive {};
        class administerBlood {};
        class bloodAdministered {};
        class newLifeRule {};
    };

    class HAVOC {
        file = "PHX\HAVOC";
        class havLoadout {};  
    };

    class Jobs {
        file = "PHX\Jobs";
        class jobGroup {};
        class getGear {};
        class jobLoadout {};
        class jobHandling {};
        class repairObject {};
    };

    class Messaging {
        file = "PHX\Messaging";
        class sendMessage {};
        class recieveMessage {};
        class toggleInbox {};
        class handleMessage {};
    };

    class Government {
        file = "PHX\Government";
        class notifyPollStatus {};
        class govActions {};
        class openLegislation {};
        class notifyLegislation {};
        class changeLegality {};
        class setIllegalItems {};
        class makeBroadcast {};
    };

    class Loyalty {
        file = "PHX\Loyalty";
        class claimReward {};
        class getRewardInfo {};
    };

    class Housing {
        file = "PHX\Housing";
        class buyHouse {};
        class sellHouse {};
        class houseMarker {};
        class gangHousing {};
        class initHouses {};
        class lockHouse {};
        class canRaid {};
        class nameHouse {};
        class robberyMarker {};
    };

    class Housing_Storage {
        file = "PHX\Housing\Storage";
        class createCategory {};
        class saveCategory {};
        class takeStorage {};
        class storeStorage {};
        class getStorageWeight {};
    };

    class Police {
        file = "PHX\Police";
        class forceEntry {};
        class seizevItems {};
        class seizevItemsClient {};
        class seizeMoney {};
        class seizeMoneyClient {};
        class requestLicense {};
        class vehLookup {};
    };

    class Gang {
        file = "PHX\Gang";
        class gangMenu {};
        class gangList {};
        class gangLeave {};
        class gangDisband {};
        class gangUpgrade {};
        class gangNewLeader {};
        class gangKick {};
        class gangInvite {};
        class initGang {};
        class createGang {};
        class gangCreated {};
        class renameGang {};
        class setPrefix {};
        class setMessage {};
        class endAlliance {};
        class startAlliance {};
        class gangRank {};
        class canDo {};
        class rankUpdate {};
        class orderRanks {};
        class alliedUnits {};
        class inWhitelistGang {};
        class setGangTax {};
        class changeGangPerks {};
        class isNearGang {};
        class handleGangXP {};
    };

    class Shops_Functions {
        file = "PHX\Shops\Functions";
        class getCompatibleItems {};
        class handleGear {};
        class hasSpace {};
        class addGear {};
        class containerAdd {};
        class gearWeight {};
    };
    
    class Cartel {
        file = "PHX\Cartel";
        class inZone {};
        class zoneHandle { postInit = 1; };
        class enterZone {};
        class isZoneOwner {};
    };

    class Airdrop {
        file = "PHX\Airdrop";
        class spawnAirdrop {};
        class airdrop { preInit = 1; };
    };
    
    class Crimes {
        file = "PHX\Crimes";
        class hackObject {};
        class drillObject {};
        class revertHack {};
        class fixVault {};
        class radiation {};
    };

    class Markers {
        file = "PHX\Markers";
        class mapMarkers {};
    };

    class Smuggle {
        file = "PHX\Smuggle";
        class collectSmuggle {};
        class deliverSmuggle {};
    };

    class Petrol {
        file = "PHX\Petrol";
        class collectPetrol {};
        class deliverPetrol {};
        class petrolMenu {};
    };

    class Shipwrecks {
        file = "PHX\Shipwreck";
        class initShipwreck {};
        class loadShipwreck {postInit = 1;};
    };

    class PopupCartels {
        file = "PHX\Cartel\Popup";
        class RCZ_captureLoop {};
        class RCZ_client {};
        class RCZ_create {};
        class RCZ_init { preInit = 1; };
        class RCZ_ui {};
        class RCZ_delete {};
        class RCZ_capturedClient {};
    };

    class Stats {
        file = "PHX\Stats";
        class getStat {};
        class setStat {};
    };
};