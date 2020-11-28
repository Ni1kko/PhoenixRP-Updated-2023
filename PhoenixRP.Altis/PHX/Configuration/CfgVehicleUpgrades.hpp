class CfgVehicleUpgrades {
	class Tracker {
        title = "Tracker";
        condition = "!('Tracker' in ((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 4))";
        action = "[PHX_Upgrade, 'upgrade', 'Tracker'] call PHX_fnc_handleVehicleUpgrade; [PHX_Upgrade] call PHX_fnc_tracker";
        description = "Automatically adds a tracker to your vehicle.";
        price = 70;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\compass_ca.paa";
    };

	class Trunk_1 {
        title = "Trunk Upgrade Level 1";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 0) isEqualTo 0";
        action = "[PHX_Upgrade, 'trunk', 5] call PHX_fnc_handleVehicleUpgrade";
        description = "Increases trunk capacity by 5%.";
        price = 20;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };

	class Trunk_2 {
        title = "Trunk Upgrade Level 2";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 0) isEqualTo 6";
        action = "[PHX_Upgrade, 'trunk', 10] call PHX_fnc_handleVehicleUpgrade";
        description = "Increases trunk capacity by an additional 5%.";
        price = 40;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };

	class Trunk_3 {
        title = "Trunk Upgrade Level 3";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 0) isEqualTo 10";
        action = "[PHX_Upgrade, 'trunk', 15] call PHX_fnc_handleVehicleUpgrade";
        description = "Increases trunk capacity by an additional 5%.";
        price = 60;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArsenal\backpack_ca.paa";
    };

	class Titanium_Locks_1 {
        title = "Titanium Locks Level 1";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 1) isEqualTo 0";
        action = "[PHX_Upgrade, 'locks', 10] call PHX_fnc_handleVehicleUpgrade";
        description = "Decreases lockpicking chance by 10%.";
        price = 10;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayDynamicGroups\Lock.paa";
    };

	class Titanium_Locks_2 {
        title = "Titanium Locks Level 2";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 1) isEqualTo 10";
        action = "[PHX_Upgrade, 'locks', 20] call PHX_fnc_handleVehicleUpgrade";
        description = "Decreases lockpicking chance by an additional 10%.";
        price = 15;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayDynamicGroups\Lock.paa";
    };

	class Titanium_Locks_3 {
        title = "Titanium Locks Level 3";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 1) isEqualTo 20";
        action = "[PHX_Upgrade, 'locks', 30] call PHX_fnc_handleVehicleUpgrade";
        description = "Decreases lockpicking chance by an additional 10%.";
        price = 20;
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayDynamicGroups\Lock.paa";
    };

	class Chop_Shop_1 {
        title = "Chop Shop Level 1";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 2) isEqualTo 0";
        action = "[PHX_Upgrade, 'chop', 10] call PHX_fnc_handleVehicleUpgrade";
        description = "Increases chopshop time by 10%.";
        price = 10;
        icon = "\a3\3den\Data\CfgWaypoints\scripted_ca.paa";
    };

	class Chop_Shop_2 {
        title = "Chop Shop Level 2";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 2) isEqualTo 10";
        action = "[PHX_Upgrade, 'chop', 20] call PHX_fnc_handleVehicleUpgrade";
        description = "Increases chopshop time by an additional 10%.";
        price = 15;
        icon = "\a3\3den\Data\CfgWaypoints\scripted_ca.paa";
    };

	class Chop_Shop_3 {
        title = "Chop Shop Level 3";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 2) isEqualTo 20";
        action = "[PHX_Upgrade, 'chop', 30] call PHX_fnc_handleVehicleUpgrade";
        description = "Increases chopshop time by an additional 10%.";
        price = 20;
        icon = "\a3\3den\Data\CfgWaypoints\scripted_ca.paa";
    };

	class Nitrous_1 {
        title = "Nitrous Upgrade Level 1";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 3) isEqualTo 0";
        action = "[PHX_Upgrade, 'nitrous', 1] call PHX_fnc_handleVehicleUpgrade";
        description = "Adds 1 nitrous canister to the vehicle. Faster acceleration for 10 seconds and higher top speed. ";
        price = 25;
        icon = "\a3\3den\Data\Displays\Display3DENMsgBox\picture_ca.paa";
    };

	class Nitrous_2 {
        title = "Nitrous Upgrade Level 2";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 3) isEqualTo 1";
        action = "[PHX_Upgrade, 'nitrous', 2] call PHX_fnc_handleVehicleUpgrade";
        description = "Adds 1 additional nitrous canister to the vehicle. Faster acceleration for 10 seconds and higher top speed.";
        price = 25;
        icon = "\a3\3den\Data\Displays\Display3DENMsgBox\picture_ca.paa";
    };

	class Nitrous_3 {
        title = "Nitrous Upgrade Level 3";
        condition = "((PHX_Upgrade getVariable ['vehicle_upgrades',[]]) select 3) isEqualTo 2";
        action = "[PHX_Upgrade, 'nitrous', 3] call PHX_fnc_handleVehicleUpgrade";
        description = "Adds 1 additional nitrous canister to the vehicle. Faster acceleration for 10 seconds and higher top speed.";
        price = 25;
        icon = "\a3\3den\Data\Displays\Display3DENMsgBox\picture_ca.paa";
    };
};