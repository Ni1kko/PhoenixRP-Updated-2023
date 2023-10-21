class CfgSmuggle {
    class Altis {
        class Collect {
            class smugglerCollect1 {
                variable = "smugglerCollect1";
                name = "The Sunken Grove";
                locations[] = {"smugglerSell1","smugglerSell2"};
            };
            class smugglerCollect2 {
                variable = "smugglerCollect2";
                name = "Discovery Ridge";
                locations[] = {"smugglerSell3","smugglerSell4"};
            };
        };

        class Deliver {
            class smugglerSell1 {
                variable = "smugglerSell1";
                name = "Scorched Pass";
                side = "east";
            };
            class smugglerSell2 {
                variable = "smugglerSell2";
                name = "Sandy Shallows";
                side = "east";
            };
            class smugglerSell3 {
                variable = "smugglerSell3";
                name = "Twin Groves";
                side = "west";
            };
            class smugglerSell4 {
                variable = "smugglerSell4";
                name = "Shipwreck Bay";
                side = "west";
            };
        };
    };

    class pja305 {};
};