#define true 1
#define false 0
#define ROOT(dir, root) #[dir, root] call PHX_fnc_iconDir

class CfgGangs {
	minRanks = 2;
	maxRanks = 10;
	maxPerks = 2;
	baseXP = 2500;
	xpMultiplier = 2.5;
	perkSwitchPrice = 250000;
	maxLevel = 5;

	// xp requirement = (baseXP * level) * xpMultiplier

	class Ranks {
		class Member {
			name = "Member";
			level = 0;
			isLeader = false;
			invite = false;
			kick = false;
			promote = true;
			upgrade = false;
			taxExempt = false;
		};

		class Recruiter {
			name = "Recruiter";
			level = 1;
			isLeader = false;
			invite = true;
			kick = false;
			promote = true;
			upgrade = false;
			taxExempt = false;
		};

		class Leader {
			name = "Leader";
			level = 2;
			isLeader = true;
			invite = true;
			kick = true;
			promote = true;
			upgrade = true;
			taxExempt = true;
		};
	};

	class Perks {
		class Political {
			name = "Political Experiance";
			picture = ROOT("data\perks\fisherman.paa", true);
			description = "Signing up to run as the Governor is <t color = '#8A2BE2'>free</t>.";
			unlockLevel = 2;
		};

		class Cartel {
			name = "Cartel Master";
			picture = ROOT("data\perks\fisherman.paa", true);
			description = "<t color = '#8A2BE2'>5%</t> increase in cartel revenue.";
			unlockLevel = 3;
		};

		class Gang {
			name = "Gang Culture";
			picture = ROOT("data\perks\fisherman.paa", true);
			description = "<t color = '#8A2BE2'>10%</t> off rebel weapon stores.";
			unlockLevel = 4;
		};

		class Mafia {
			name = "Mafia Culture";
			picture = ROOT("data\perks\fisherman.paa", true);
			description = "<t color = '#8A2BE2'>15%</t> increase in sale price of illegal items.";
			unlockLevel = 5;
		};

		class Company {
			name = "Business Influence";
			picture = ROOT("data\perks\fisherman.paa", true);
			description = "<t color = '#8A2BE2'>20%</t> increase in sale price of legal items.";
			unlockLevel = 5;
		};
	};
};