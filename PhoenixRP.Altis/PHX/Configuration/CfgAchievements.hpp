#define ROOT(dir, root) #[dir, root] call PHX_fnc_iconDir
class CfgAchievements {
	class firstSpawn {
        displayName = "Welcome!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "firstSpawn";
        unlockMessage = "Welcome to PhoenixRP!";
        description = "Woke up for the first time.";
        rewards[] = {
            {"MONEY", {1, 10000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class firstSteps
    {
        displayName = "Now we're getting started!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "firstSteps";
        unlockMessage = "0ne small step for man, one giant leap for roleplayer kind!";
        description = "Traveled 100m from their starting location.";
        rewards[] = {
            {"XP", 100}
        };
        isMystery = false;
    };
    
    class joinedAPC 
    {
        displayName = "Joined The APC!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "joinedAPC";
        unlockMessage = "Peace and Stability. Can you maintain them?";
        description = "Woke up on the island as a member of the APC for the first time.";
        rewards[] = {
            {"MONEY", {1, 50000}},
            {"XP", 500}
        };
        isMystery = false;
    };

    class joinedNHS
    {
        displayName = "Joined The NHS!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "joinedNHS";
        unlockMessage = "Time to save some lives!";
        description = "Woke up on the island as a member of the NHS for the first time.";
        rewards[] = {
            {"MONEY", {1, 50000}},
            {"XP", 500}
        };
        isMystery = false;
    };
    
    class joinedHavoc
    {
        displayName = "Joined HAVOC!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "joinedHavoc";
        unlockMessage = "Rebellion is our first step to success...";
        description = "Woke up on the island as a member of Havoc for the first time.";
        rewards[] = {
            {"MONEY", {1, 50000}},
            {"XP", 500}
        };
        isMystery = false;
    };

    class patrolMission
    {
        displayName = "Completed a Patrol Mission";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "patrolMission";
        unlockMessage = "Keeping our land safe!";
        description = "Completed at least one patrol mission since this achievement was added.";
        rewards[] = {
            {"MONEY", {1, 5000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class responseMission
    {
        displayName = "Completed a Responce Mission";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "responseMission";
        unlockMessage = "Saving lives, one mile at a time!";
        description = "Completed at least one response mission as NHS.";
        rewards[] = {
            {"MONEY", {1, 5000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class PrimeMinister
    {
        displayName = "Governor!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "PrimeMinister";
        unlockMessage = "With great power comes great responsibility!";
        description = "Has been voted into office at least once.";
        rewards[] = {
            {"MONEY", {1, 300000}},
            {"XP", 1000}
        };
        isMystery = false;
    };

    class houseBought
    {
        displayName = "Bought a House";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "houseBought";
        unlockMessage = "On the property lander!";
        description = "Bought a house since this achievement was added.";
        rewards[] = {
            {"MONEY", {1, 25000}},
            {"XP", 100}
        };
        isMystery = false;
    };

    class firstCar
    {
        displayName = "Bought a Car";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "firstCar";
        unlockMessage = "My First Car!";
        description = "Bought a car since this achievement was added.";
        rewards[] = {
            {"MONEY", {1, 5000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class firstTicket
    {
        displayName = "Gave someone a ticket";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "firstTicket";
        unlockMessage = "Sign here please...";
        description = "Handed out a ticket since this achievement was added.";
        rewards[] = {
            {"MONEY", {1, 15000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class firstArrest
    {
        displayName = "Arrested Someone";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "firstArrest";
        unlockMessage = "Justice Served!";
        description = "Arrested Someone since this achievement was added.";
        rewards[] = {
            {"MONEY", {1, 15000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class firstRevival
    {
        displayName = "Revived Someone";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "firstRevival";
        unlockMessage = "Now I am a life saver!";
        description = "Revived Someone since this achievement was added.";
        rewards[] = {
            {"MONEY", {1, 25000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class joinedGang 
    {
        displayName = "Joined a Gang";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "joinedGang";
        unlockMessage = "Stronger Together!";
        description = "Created or joined a gang.";
        rewards[] = {
            {"MONEY", {1, 25000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class gotAJob 
    {
        displayName = "Got a Job";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "gotAJob";
        unlockMessage = "Money, Money, Money!";
        description = "Bought either the Lawyers, Taxi, News or Mechanics Licenses.";
        rewards[] = {
            {"MONEY", {1, 25000}},
            {"XP", 50}
        };
        isMystery = false;
    };

    class prison 
    {
        displayName = "Sent to Prison";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "prison";
        unlockMessage = "Don't drop the soap!";
        description = "Sent to jail since this achievement was added.";
        rewards[] = {
            {"XP", 25}
        };
        isMystery = false;
    };

    class first500k 
    {
        displayName = "£500,000!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "first500k";
        unlockMessage = "You have a total of 500k!";
        description = "Had a total of £500,000.";
        rewards[] = {
            {"XP", 50}
        };
        isMystery = false;
    };
    
    class first1mill 
    {
        displayName = "£1,000,000!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "first1mill";
        unlockMessage = "You have a total of 1M! You are a Millionaire!";
        description = "Had a total of £1,000,000.";
        rewards[] = {
            {"XP", 100}
        };
        isMystery = false;
    };
    
    class first2mill 
    {
        displayName = "£2,000,000!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "first2mill";
        unlockMessage = "You have a total of 2M! you are now a Multi-Millionaire!";
        description = "Had a total of £2,000,000.";
        rewards[] = {
            {"XP", 200}
        };
        isMystery = false;
    };
    
    class first5mill 
    {
        displayName = "£5,000,000!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "first5mill";
        unlockMessage = "You have a total of 5M!";
        description = "Had a total of £5,000,000.";
        rewards[] = {
            {"XP", 500}
        };
        isMystery = false;
    };

    class first10mill 
    {
        displayName = "£10,000,000!";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "first10mill";
        unlockMessage = "You have a total of 10M!";
        description = "Had a total of £10,000,000.";
        rewards[] = {
            {"XP", 1000}
        };
        isMystery = false;
    };

    class spymode {
        displayName = "Spy Mode Activated";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "spymode";
        unlockMessage = "Time to go undercover...";
        description = "Go undercover as either HSS or MI5...";
        rewards[] = {
            {"XP", 250}
        };
        isMystery = true;
    };

    class fangirl {
        displayName = "Belle Delphine's Fangirl";
        picture = ROOT("data\ui\logo.paa", false);
        achiVariable = "fangirl";
        unlockMessage = "Go find my stores hunny.";
        description = "You have successfully discovered the pleasure in Belle Delphine.";
        rewards[] = {
            {"MONEY", {1, 69}},
            {"XP", 69}
        };
        isMystery = true;
    }; 
};