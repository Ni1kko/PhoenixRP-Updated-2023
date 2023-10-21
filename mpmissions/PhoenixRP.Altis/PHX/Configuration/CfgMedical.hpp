class CfgMedical {
    class Morphine {
        name = "a Morphine Syringe";
        damageThreshold = -1;
        notification = "You have greatly reduced the patients pain!";
    };

    class Saline {
        name = "Saline Solution";
        damageThreshold = 0.3;
        notification = "You have slowed the patients bleeding by decreasing the patients heart rate!";
    };

    class Bandage {
        name = "a Bandage";
        damageThreshold = 0.6;
        notification = "You have slowed the patients bleeding and healed the wound!";
    };

    class Gauze {
        name = "a Gauze";
        damageThreshold = 0.9;
        notification = "You have slowed the patients bleeding and greatly reduced the pain!";
    };
};