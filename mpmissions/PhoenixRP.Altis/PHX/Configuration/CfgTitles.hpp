class CfgTitles {
	class Rookie {
        displayName = "Rookie";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>5</t>.";
        condition = "PHX_Level >= 5";
    };

	class Novice {
        displayName = "Novice";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>10</t>.";
        condition = "PHX_Level >= 10";
    };

	class Intermediate {
        displayName = "Intermediate";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>20</t>.";
        condition = "PHX_Level >= 20";
    };

	class Expert {
        displayName = "Expert";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>30</t>.";
        condition = "PHX_Level >= 30";
    };

	class Master {
        displayName = "Master";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>40</t>.";
        condition = "PHX_Level >= 40";
    };

	class Bullseye {
        displayName = "Bullseye";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>50</t>.";
        condition = "PHX_Level >= 50";
    };

	class Millionaire {
        displayName = "Millionaire";
        description = "Unlocked by having <t color = '#8A2BE2'>£1,000,000</t> or more in the bank.";
        condition = "PHX_ATMCash >= 1000000";
    };

	class Millionaire2 {
        displayName = "Time is Money";
        description = "Unlocked by having <t color = '#8A2BE2'>£50,000,000</t> or more in the bank.";
        condition = "PHX_ATMCash >= 50000000";
    };

	class Millionaire3 {
        displayName = "Rainmaker";
        description = "Unlocked by having <t color = '#8A2BE2'>£100,000,000</t> or more in the bank.";
        condition = "PHX_ATMCash >= 100000000";
    };

	class Billionaire {
        displayName = "Billionaire";
        description = "Unlocked by having <t color = '#8A2BE2'>£1,000,000,000</t> or more in the bank.";
        condition = "PHX_ATMCash >= 1000000000";
    };

    class Loyalty1 {
        displayName = "Committed";
        description = "Unlocked by being on a loyalty streak of <t color = '#8A2BE2'>8</t> or more.";
        condition = "(PHX_loyalty select 0) >= 8";
    };

    class Loyalty2 {
        displayName = "Dedicated";
        description = "Unlocked by being on a loyalty streak of <t color = '#8A2BE2'>16</t> or more.";
        condition = "(PHX_loyalty select 0) >= 16";
    };

    class Loyalty3 {
        displayName = "Loyal";
        description = "Unlocked by being on a loyalty streak of <t color = '#8A2BE2'>24</t> or more.";
        condition = "(PHX_loyalty select 0) >= 24";
    };

    class Loyalty4 {
        displayName = "Follower";
        description = "Unlocked by being on a loyalty streak of <t color = '#8A2BE2'>32</t> or more.";
        condition = "(PHX_loyalty select 0) >= 32";
    };

		class Loyalty5 {
				displayName = "Devoted";
				description = "Unlocked by being on a loyalty streak of <t color = '#8A2BE2'>100</t> or more.";
				condition = "(PHX_loyalty select 0) >= 100";
		};

		class Loyalty6 {
				displayName = "No Life";
				description = "Unlocked by being on a loyalty streak of <t color = '#8A2BE2'>365</t> or more.";
				condition = "(PHX_loyalty select 0) >= 365";
		};

    class Fishing {
        displayName = "Finding Nemo";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Fishing' profession.";
        condition = "Prof_Fishing >= 500";
    };

    class Gathering {
        displayName = "Quick Hands";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Gathering' profession.";
        condition = "Prof_Gathering >= 500";
    };

    class Mining {
        displayName = "The Extractor";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Mining' profession.";
        condition = "Prof_Mining >= 500";
    };

    class Processing {
        displayName = "The Catalyst";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Processing' profession.";
        condition = "Prof_Processing >= 500";
    };

    class Cooking {
        displayName = "Head Chef";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Cooking' profession.";
        condition = "Prof_Cooking >= 500";
    };

    class Crafting {
        displayName = "Master Craftsman";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Crafting' profession.";
        condition = "Prof_Crafting >= 500";
    };

    class Smuggling {
        displayName = "The Pirate";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Smuggling' profession.";
        condition = "Prof_Smuggling >= 500";
    };

    class Capturing {
        displayName = "The Cartel King";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Capturing' profession.";
        condition = "Prof_Capturing >= 500";
    };

    class Patrolling {
        displayName = "Overseer";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Patrol' profession.";
        condition = "Prof_Patrol >= 500";
    };

    class Impouding {
        displayName = "Street Cleaner";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Impounding' profession.";
        condition = "Prof_Impounding >= 500";
    };

    class Crushing {
        displayName = "The Destroyer";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Crushing' profession.";
        condition = "Prof_Crushing >= 500";
    };

    class Reviving {
        displayName = "Life Saver";
        description = "Unlocked by being at or above level <t color = '#8A2BE2'>500</t> in the 'Reviving' profession.";
        condition = "Prof_Reviving >= 500";
    };

	class Contributor {
        displayName = "Contributor";
        description = "Unlocked by being an <t color = '#8A2BE2'>Active Donator</t>.";
        condition = "PHX_DonatorLevel > 0";
    };

    class OldGuard {
        displayName = "Old Guard";
        description = "Unlocked by members that played before 01/01/2018.";
        condition = "(PHX_Join_Date select 0) < 2018";
    };

	class Prestige1 {
        displayName = "The Prestige";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>1</t>.";
        condition = "PHX_PrestigeLevel >= 1";
    };

	class Prestige2 {
        displayName = "Round 2";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>2</t>.";
        condition = "PHX_PrestigeLevel >= 2";
    };

	class Prestige3 {
        displayName = "3rd Time Charm";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>3</t>.";
        condition = "PHX_PrestigeLevel >= 3";
    };

	class Prestige4 {
        displayName = "4 The Record";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>4</t>.";
        condition = "PHX_PrestigeLevel >= 4";
    };

	class Prestige5 {
        displayName = "5 Stars";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>5</t>.";
        condition = "PHX_PrestigeLevel >= 5";
    };

	class Prestige6 {
        displayName = "Super 6";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>6</t>.";
        condition = "PHX_PrestigeLevel >= 6";
    };

	class Prestige7 {
        displayName = "Lucky 7";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>7</t>.";
        condition = "PHX_PrestigeLevel >= 7";
    };

	class Prestige8 {
        displayName = "8 Ball";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>8</t>.";
        condition = "PHX_PrestigeLevel >= 8";
    };

	class Prestige9 {
        displayName = "9 Lives";
        description = "Unlocked by being at or above prestige <t color = '#8A2BE2'>9</t>.";
        condition = "PHX_PrestigeLevel >= 9";
    };

	class Prestige10 {
        displayName = "God Tier";
        description = "Unlocked by achieving prestige <t color = '#8A2BE2'>10</t>.";
        condition = "PHX_PrestigeLevel >= 10";
    };

	class Accomplished {
				displayName = "Accomplished";
				description = "Unlocked by getting all civilian professions to level <t color = '#8A2BE2'>500</t>.";
				condition = "Prof_Fishing >= 500 && { Prof_Gathering >= 500 } && { Prof_Mining >= 500 } && { Prof_Processing >= 500 } && { Prof_Cooking >= 500 } && { Prof_Crafting >= 500 } && { Prof_Smuggling >= 500 } && { Prof_Capturing >= 500 }";
			};

		class CompletedItMate {
				displayName = "Completed It Mate";
				description = "Unlocked by being at prestige <t color = '#8A2BE2' >10</t> and have all civilian professions at level <t color = '#8A2BE2' >500</t>";
				condition = "PHX_PrestigeLevel >= 10 && { Prof_Fishing >= 500 } && { Prof_Gathering >= 500 } && { Prof_Mining >= 500 } && { Prof_Processing >= 500 } && { Prof_Cooking >= 500 } && { Prof_Crafting >= 500 } && { Prof_Smuggling >= 500 } && { Prof_Capturing >= 500 }";
			};
};
