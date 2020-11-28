/*
	@File: CfgPerks.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the settings behind the perks system.
*/
#define ROOT(dir, root) #[dir, root] call PHX_fnc_iconDir
class CfgPerks { 
    class fisherman { // CODED
        displayName = "Fisherman";
        picture = ROOT("data\perks\fisherman.paa", true);
        description = "When fishing, gain a <t color = '#8A2BE2'>50%</t> increase on your chances of catching anything.";
        sides[] = {"Civilian"};
        unlockLevel = 2;
        presitgeLevel = 0;
    };
    class muscleman { // CODED
        displayName = "Muscleman";
        picture = ROOT("data\perks\muscleman.paa", true);
        description = "Build your muscles and be able to carry <t color = '#8A2BE2'>25%</t> more vItems.";
        sides[] = {};
        unlockLevel = 3;
        presitgeLevel = 0;
    };
    class secondNature { // CODED
        displayName = "Second Nature";
        picture = ROOT("data\perks\secondNature.paa", true);
        description = "<t color = '#8A2BE2'>Automatically</t> put on your seatbelt when entering a vehicle.";
        sides[] = {};
        unlockLevel = 4;
        presitgeLevel = 0;
    };
    class governmentBonusNHS { // CODED
        displayName = "Government Bonus";
        picture = ROOT("data\perks\governmentBonusAPC.paa", true);
        description = "Receive <t color = '#8A2BE2'>30%</t> more XP from every revive.";
        sides[] = {"Medic"};
        unlockLevel = 5;
        presitgeLevel = 0;
    };
    class governmentBonusAPC { // CODED
        displayName = "Government Bonus";
        picture = ROOT("data\perks\governmentBonusAPC.paa", true);
        description = "Receive <t color = '#8A2BE2'>30%</t> more XP from every arrest.";
        sides[] = {"Police"};
        unlockLevel = 5;
        presitgeLevel = 0;
    };
    class improvedMetabolism { // CODED
        displayName = "Improved Metabolism";
        picture = ROOT("data\perks\improvedMetabolism.paa", true);
        description = "Food and Water levels goes down <t color = '#8A2BE2'>30%</t> slower.";
        sides[] = {};
        unlockLevel = 5;
        presitgeLevel = 0;
    };
    class expertTrader { // CODED
        displayName = "Expert Trader";
        picture = ROOT("data\perks\metalTrader.paa", true);
        description = "Increase the price you sell legal items for by <t color = '#8A2BE2'>10%</t>.";
        sides[] = {};
        unlockLevel = 6;
        presitgeLevel = 0;
    };
    class wideTraveller { // CODED
        displayName = "Wide Traveller";
        picture = ROOT("data\perks\wideTraveller.paa", true);
        description = "Gain the ability to spawn in <t color = '#8A2BE2'>Agios</t>, <t color = '#8A2BE2'>Neochori</t> and <t color = '#8A2BE2'>Sofia</t>.";
        sides[] = {"Civilian"};
        unlockLevel = 9;
        presitgeLevel = 0;
    };
    class paidCleaner { // CODED
        displayName = "Paid Cleaners";
        picture = ROOT("data\perks\paidCleaner.paa", true);
        description = "Receive <t color = '#8A2BE2'>20%</t> more cash from every vehicle that is impounded.";
        sides[] = {"Police"};
        unlockLevel = 10;
        presitgeLevel = 0;
    };
    class expertFinancer { // CODED
        displayName = "Expert Financier";
        picture = ROOT("data\perks\expertFinancer.paa", true);
        description = "Receive <t color = '#8A2BE2'>25%</t> extra from all paychecks.";
        sides[] = {};
        unlockLevel = 10;
        presitgeLevel = 0;
    };
    class ecoDriver { // CODED
        displayName = "Eco-Driver";
        picture = ROOT("data\perks\ecoDriver.paa", true);
        description = "Pay <t color = '#8A2BE2'>50%</t> less per litre of fuel from a fuel station.";
        sides[] = {};
        unlockLevel = 12;
        presitgeLevel = 0;
    };
    class partsCarrier { // CODED
        displayName = "Parts Carrier";
        picture = ROOT("data\perks\partsCarrier.paa", true);
        description = "Air service costs are reduced by <t color = '#8A2BE2'>75%</t>.";
        sides[] = {};
        unlockLevel = 13;
        presitgeLevel = 0;
    };
    class slightOfHand { // CODED
        displayName = "Sleight of Hand";
        picture = ROOT("data\perks\slightOfHand.paa", true);
        description = "Repack your magazines <t color = '#8A2BE2'>25%</t> faster.";
        sides[] = {"Civilian","Havoc"};
        unlockLevel = 15;
        presitgeLevel = 0;
    };
    class scrapDealer { // CODED
        displayName = "Scrap Dealer";
        picture = ROOT("data\perks\scrapDealer.paa", true);
        description = "Receive <t color = '#8A2BE2'>20%</t> more cash from every vehicle that is crushed.";
        sides[] = {"Police"};
        unlockLevel = 15;
        presitgeLevel = 0;
    };
    class matesRates { // CODED
        displayName = "Mates Rates";
        picture = ROOT("data\perks\matesRates.paa", true);
        description = "Storage fees from the garage are reduced by <t color = '#8A2BE2'>50%</t>.";
        sides[] = {"Civilian"};
        unlockLevel = 15;
        presitgeLevel = 0;
    };
    class medicalStudent { // CODED
        displayName = "Medical Student";
        picture = ROOT("data\perks\medicalStudent.paa", true);
        description = "Blood bags provide <t color = '#8A2BE2'>100%</t> more of an affect.";
        sides[] = {};
        unlockLevel = 16;
        presitgeLevel = 0;
    };
    class fuelStorer { // CODED
        displayName = "Fuel Storer";
        picture = ROOT("data\perks\fuelStorer.paa", true);
        description = "All vehicles taken from the garage will be refuelled <t color = '#8A2BE2'>automatically</t>.";
        sides[] = {"Civilian"};
        unlockLevel = 17;
        presitgeLevel = 0;
    };
    class firstAider { // CODED
        displayName = "First Aider";
        picture = ROOT("data\perks\firstAider.paa", true);
        description = "First Aid Kits will allow you to heal yourself or others to <t color = '#8A2BE2'>100%</t>.";
        sides[] = {};
        unlockLevel = 18;
        presitgeLevel = 0;
    };
    class medicalCover { // CODED (Heal [NOT Revive])
        displayName = "Medical Cover";
        picture = ROOT("data\perks\medicalCover.paa", true);
        description = "<t color = '#8A2BE2'>30%</t> of all NHS medical fees are covered by the government.";
        sides[] = {};
        unlockLevel = 20;
        presitgeLevel = 0;
    };
    class reliablyRepaired { // CODED
        displayName = "Reliably Repaired";
        picture = ROOT("data\perks\generalMechanic.paa", true);
        description = "All vehicles taken from the garage will be repaired <t color = '#8A2BE2'>automatically</t>.";
        sides[] = {"Civilian"};
        unlockLevel = 21;
        presitgeLevel = 0;
    };
    class shadyTrader { // CODED
        displayName = "Shady Trader";
        picture = ROOT("data\perks\narcoticTrader.paa", true);
        description = "Increase the price you sell illegal items for by <t color = '#8A2BE2'>5%</t>.";
        sides[] = {};
        unlockLevel = 22;
        presitgeLevel = 0;
    };
    class propertyBroker { // CODED
        displayName = "Property Broker";
        picture = ROOT("data\icons\ico_House.paa", true);
        description = "All property prices on the island are reduced by <t color = '#8A2BE2'>15%</t>.";
        sides[] = {"Civilian"};
        unlockLevel = 23;
        presitgeLevel = 0;
    };
    class cuffCourtier { // CODED
        displayName = "Cuff Courtier";
        picture = ROOT("data\perks\cuffCourtier.paa", true);
        description = "Hold an <t color = '#8A2BE2'>endless</t> supply of zipties.";
        sides[] = {"Civilian","HAVOC"};
        unlockLevel = 25;
        presitgeLevel = 0;
    };
    class haggler { // CODED
        displayName = "Haggler";
        picture = ROOT("data\perks\haggler.paa", true);
        description = "All vehicle prices are reduced by <t color = '#8A2BE2'>10%</t> when purchasing.";
        sides[] = {"Civilian"};
        unlockLevel = 25;
        presitgeLevel = 0;
    };
    class pettyThief { // CODED
        displayName = "Petty Thief";
        picture = ROOT("data\perks\pettyThief.paa", true);
        description = "Increase the chances of success when lockpicking by <t color = '#8A2BE2'>30%</t>.";
        sides[] = {};
        unlockLevel = 26;
        presitgeLevel = 0;
    };
    class generalMechanic { // CODED
        displayName = "General Mechanic";
        picture = ROOT("data\perks\generalMechanic.paa", true);
        description = "You can now repair vehicles without losing the <t color = '#8A2BE2'>toolkit</t>.";
        sides[] = {};
        unlockLevel = 28;
        presitgeLevel = 0;
    };
    class scrambler { // CODED
        displayName = "Scrambler";
        picture = ROOT("data\perks\scrambler.paa", true); 
        description = "Block police scanners from reading your vehicle's number plate.";
        sides[] = {"Civilian"};
        unlockLevel = 30;
        presitgeLevel = 0;
    };
    class crackHead { //CODED
        displayName = "Crack Head";
        picture = ROOT("data\perks\crackHead.paa", true);
        description = "All narcotic and alcohol effects last <t color = '#8A2BE2'>100% longer</t>.";
        sides[] = {};
        unlockLevel = 32;
        presitgeLevel = 0;
    };
    class professionalBanker { // CODED
        displayName = "Professional Banker";
        picture = ROOT("data\perks\professionalBanker.paa", true);
        description = "Wire transfer fees are reduced by <t color = '#8A2BE2'>50%</t>.";
        sides[] = {};
        unlockLevel = 33;
        presitgeLevel = 0;
    };
    class highRoller {
        displayName = "High Roller";
        picture = ROOT("data\perks\highRoller.paa", true);
        description = "Increase the payout from the casino by <t color = '#8A2BE2'>10%</t>.";
        sides[] = {};
        unlockLevel = 35;
        presitgeLevel = 0;
    };
    class mindfulPlanner { // CODED
        displayName = "Mindful Planner";
        picture = ROOT("data\perks\mindfulPlanner.paa", true);
        description = "Spawn with a <t color = '#8A2BE2'>GPS, Rangefinders</t> and <t color = '#8A2BE2'>Night Vision Glasses</t>.";
        sides[] = {};
        unlockLevel = 36;
        presitgeLevel = 0;
    };
    class quickLearner { // CODED
        displayName = "Quick Learner";
        picture = ROOT("data\perks\quickLearner.paa", true);
        description = "Increase the speed in which your profession level goes up by <t color = '#8A2BE2'>10%</t>.";
        sides[] = {};
        unlockLevel = 38;
        presitgeLevel = 0;
    };
    class wildWiing { // CODED
        displayName = "Wild Wiing";
        picture = ROOT("data\perks\wildWiing.paa", true);
        description = "Redgull effects last <t color = '#8A2BE2'>100%</t> longer.";
        sides[] = {};
        unlockLevel = 40;
        presitgeLevel = 0;
    };
    class uncertainPersonality { //CODED
        displayName = "Uncertain Personality";
        picture = ROOT("data\perks\uncertainPersonality.paa", true);
        description = "When chop shopping a vehicle, receive a <t color = '#8A2BE2'>15%</t> chance of keeping it.";
        sides[] = {"Civilian"};
        unlockLevel = 45;
        presitgeLevel = 0;
    };
    class helpfulBenefactor { // CODED
        displayName = "Helpful Benefactor";
        picture = ROOT("data\perks\helpfulBenefactor.paa", true);
        description = "All ticket prices are covered by <t color = '#8A2BE2'>30%</t> from a helpful benefactor.";
        sides[] = {};
        unlockLevel = 45;
        presitgeLevel = 0;
    };
    class legalCover { // CODED
        displayName = "Legal Cover";
        picture = ROOT("data\perks\legalCover.paa", true);
        description = "All bail prices are reduced by <t color = '#8A2BE2'>50%</t>.";
        sides[] = {};
        unlockLevel = 45;
        presitgeLevel = 0;
    };
    class sweetTalker { // CODED
        displayName = "Sweet Talker";
        picture = ROOT("data\perks\sweetTalker.paa", true);
        description = "Increase all vItem sell prices by <t color = '#8A2BE2'>10%</t>.";
        sides[] = {};
        unlockLevel = 50;
        presitgeLevel = 0;
    };
    class graveRobber { // CODED
        displayName = "Grave Robber";
        picture = ROOT("data\perks\graveRobber.paa", true);
        description = "Allows the <t color = '#8A2BE2'>looting</t> of incapacitated people.";
        sides[] = {"Civilian"};
        unlockLevel = 30;
        presitgeLevel = 5;
    };
};