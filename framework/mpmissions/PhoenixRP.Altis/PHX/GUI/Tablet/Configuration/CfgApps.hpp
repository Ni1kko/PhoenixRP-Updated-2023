class CfgApps {

    class Inventroy {
        title = "Inventory";
        icon = "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa";
        onButtonClick = "[23200, ""Inventory""] call PHX_fnc_switchApp";
        conditions = "";
        disableIF = "";
        tooltip = "Inventory";
    };
    
    class KeyChain {
        title = "Key Chain";
        icon = "data\ui\keys.paa";
        onButtonClick = "[23400, ""KeyChain""] call PHX_fnc_switchApp";
        conditions = "";
        disableIF = "";
        tooltip = "View all vehicle and house keys...";
    };

    class Group {
        title = "Group";
        icon = "\a3\3den\data\Cfg3DEN\Group\iconCustomComposition_ca.paa";
        onButtonClick = "[24000, ""Group""] call PHX_fnc_switchApp";
        conditions = "playerSide isEqualTo civilian && { !PHX_isPM } && { !(player getVariable [""isCID"", false]) } && { !(player getVariable [""isHSS"", false]) } && { !(player getVariable [""isSO1"", false]) }";
        disableIF = "";
        tooltip = "Group Management";
    };

    class WantedList {
        title = "Wanted List";
        icon = "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa";
        onButtonClick = "[24400, ""PNC""] call PHX_fnc_switchApp";
        conditions = "playerSide isEqualTo west || { (player getVariable ['isCID', false]) }";
        disableIF = "";
        tooltip = "Police National Computer";
    };

    class Mobile {
        title = "Mobile";
        icon = "\a3\3den\data\Cfg3DEN\Comment\texture_ca.paa";
        onButtonClick = "[23800, ""Mobile""] call PHX_fnc_switchApp";
        conditions = "";
        disableIF = "";
        tooltip = "Mobile";
    };

    class Market {
        title = "Market";
        icon = "\a3\3den\data\Displays\Display3DEN\ToolBar\vert_ATL_ca.paa";
        onButtonClick = "[23500, ""Market""] call PHX_fnc_switchApp";
        conditions = "";
        disableIF = "";
        tooltip = "View Buy/Sell Prices on the Island";
    };

    class Perks {
        title = "Perks";
        icon = "data\ui\perk.paa";
        onButtonClick = "[23600, ""Perks""] call PHX_fnc_switchApp";
        conditions = "";
        disableIF = "";
        tooltip = "Perk Management";
    };

    class Progression {
        title = "Profile";
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayMain\profile_player_ca.paa";
        onButtonClick = "[23700, ""Progression""] call PHX_fnc_switchApp; [""Professions""] call PHX_fnc_onLoad";
        conditions = "";
        disableIF = "";
        tooltip = "View Profile...";
    };

    class Settings {
        title = "Settings";
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayMain\menu_options_ca.paa";
        onButtonClick = "[] call life_fnc_settingsMenu;";
        conditions = "";
        disableIF = "";
        tooltip = "Configure your experience!";
    };
    
    class Dispute {
        title = "Dispute";
        icon = "data\ui\dispute.paa";
        onButtonClick = "closeDialog 0; [] call PHX_fnc_openDisputing;";
        conditions = "";
        disableIF = "";
        tooltip = "Open the dispute menu";
    };

    class Reskin {
        title = "Reskin";
        icon = "\a3\3den\data\Cfg3DEN\History\rotateItems_ca.paa";
        onButtonClick = "[] call PHX_fnc_reskin;";
        conditions = "";
        disableIF = "";
        tooltip = "Reloads the players uniform...";
    };

    class SyncData {
        title = "Save Data";
        icon = "\a3\ui_f\data\GUI\Rsc\RscDisplayArcadeMap\icon_saveas_ca.paa";
        onButtonClick = "[] call SOCK_fnc_syncData;";
        conditions = "";
        disableIF = "";
        tooltip = "Save your data to the server...";
    };

    class Placeables {
        title = "Placeables";
        icon = "data\ui\placeable.paa";
        onButtonClick = "[] spawn PHX_fnc_placeablesMenu;";
        conditions = "playerSide in [west, east, independent]";
        disableIF = "";
        tooltip = "Open the placeables menu";
    };

    class Admin {
        title = "Admin Menu";
        icon = "\a3\ui_f_curator\Data\Logos\arma3_zeus_icon_hover_ca.paa";
        onButtonClick = "[23900, ""Admin""] call PHX_fnc_switchApp";
        conditions = "call life_adminlevel >= 1";
        disableIF = "";
        tooltip = "";
    };
};