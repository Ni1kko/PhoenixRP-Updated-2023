/*
	@File: CfgPowers.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Defines further settings for staff powers.
*/
class CfgPowers {
	class dutyMode {
		title = "Staff Gear";
		onDuty = false;
		notify = true;
		dialogs = true;
		isButton = false;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has gone <t color = '#8A2BE2'>%2-duty</t>.";
		function = "[_msg] call PHX_fnc_dutyToggle";
		conditions = "";
		disableIF = "";
		tooltip = "Go on/off duty as a staff member."; 
	};
	
	class invisibility {
		title = "Invisibility";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has turned invisibility <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_invisibility";
		conditions = "";
		disableIF = "";
		tooltip = "Hide your player model to make yourself invisible."; 
	};

	class spectate {
		title = "Spectate";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> is spectating <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_spectate";
		conditions = "";
		disableIF = "";
		tooltip = "Spectate the selected player."; 
	};

	class heal {
		title = "Heal";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has healed <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_healPlayer";
		conditions = "";
		disableIF = "";
		tooltip = "Heal the selected player and fill their thirst and hunger levels."; 
	};

	class revive {
		title = "Revive";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has revived <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_revivePlayer";
		conditions = "";
		disableIF = "";
		tooltip = "Revive the selected player."; 
	};

	/*
	class compensate {
		title = "Compensate";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has compensated <t color = '#8A2BE2'>%2</t> for <t color = '#8A2BE2'>%3</t>.";
		function = "[_msg] spawn PHX_fnc_openCompensate";
		conditions = "";
		disableIF = "";
		tooltip = "Compensate a selected player for a specific amount."; 
	};
	*/

	class freeze {
		title = "Freeze";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has frozen <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_freeze";
		conditions = "";
		disableIF = "";
		tooltip = "Freeze the input of the selected player."; 
	};

	class camera {
		title = "Camera";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> entered the camera.";
		function = "[_msg] call PHX_fnc_openCamera";
		conditions = "";
		disableIF = "";
		tooltip = "Make use of the camera."; 
	};

	class teleportSelect {
		title = "Teleport on Map";
		onDuty = true;
		notify = false;
		dialogs = false;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has open the teleport menu.";
		function = "[_msg] call PHX_fnc_teleport";
		conditions = "";
		disableIF = "";
		tooltip = "Teleport to a selected point on the map.";
	};

	class teleportTo {
		title = "Teleport To";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has teleported to <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_teleportToTarget";
		conditions = "";
		disableIF = "";
		tooltip = "Teleport to a selected player.";
	};

	class teleportHere {
		title = "Teleport Here";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has teleported <t color = '#8A2BE2'>%2</t> to their location.";
		function = "[_msg] call PHX_fnc_teleportTargetHere";
		conditions = "";
		disableIF = "";
		tooltip = "Teleport a selected player to your location.";
	};

	class teleportHereInVehicle {
		title = "TP Into Their Vehicle";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has teleported into the vehicle of <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_teleportToVehicle";
		conditions = "";
		disableIF = "";
		tooltip = "Teleport inside a selected player's vehicle.";
	};

	class vehicleEject {
		title = "Vehicle Eject";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has ejected <t color = '#8A2BE2'>%2</t> from their vehicle.";
		function = "[_msg] call PHX_fnc_vehicleEject";
		conditions = "";
		disableIF = "";
		tooltip = "Eject the selected player from their vehicle.";
	};

	class vehicleRepair {
		title = "Repair Vehicle";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has repaired the vehicle of <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg] call PHX_fnc_vehicleRepair";
		conditions = "";
		disableIF = "";
		tooltip = "Repair the selected player's vehicle.";
	};

	class vehicleEmpty {
		title = "Defuel Vehicle";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has emptyed the vehicle of <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg, false] call PHX_fnc_vehicleFuel";
		conditions = "";
		disableIF = "";
		tooltip = "Empty the selected player's vehicle.";
	};

	class vehicleRefuel {
		title = "Refuel Vehicle";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has refueled the vehicle of <t color = '#8A2BE2'>%2</t>.";
		function = "[_msg, true] call PHX_fnc_vehicleFuel";
		conditions = "";
		disableIF = "";
		tooltip = "Refuel the selected player's vehicle.";
	};

	class ATM {
		title = "ATM";
		onDuty = true;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has opened the ATM.";
		function = "closeDialog 0; [] spawn PHX_fnc_atmMenu;";
		conditions = "";
		disableIF = "";
		tooltip = "Opens the ATM.";
	};

	class reviveAll {
		title = "Revive All";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has revived all players.";
		function = "[_msg] call PHX_fnc_reviveAll";
		conditions = "";
		disableIF = "";
		tooltip = "Revive all players."; 
	};

	class healAll {
		title = "Heal All";
		onDuty = true;
		notify = true;
		dialogs = true;
		isButton = true;
		reqLevel = 3;
		message = "<t color = '#8A2BE2'>%1</t> has healed all players.";
		function = "[_msg] call PHX_fnc_healAll";
		conditions = "";
		disableIF = "";
		tooltip = "Heals all players."; 
	};

	class arsenal {
		title = "Arsenal";
		onDuty = false;
		notify = false;
		dialogs = false;
		isButton = true;
		reqLevel = 5;
		message = "<t color = '#8A2BE2'>%1</t> has opened arsenal.";
		function = "[""Open"",true] spawn BIS_fnc_arsenal;";
		conditions = "";
		disableIF = "";
		tooltip = "Open arsenal";
	};

	class quickDisconnect {
		title = "Quick Disconnect";
		onDuty = false;
		notify = true;
		dialogs = false;
		isButton = true;
		reqLevel = 2;
		message = "<t color = '#8A2BE2'>%1</t> has quickly disconnected.";
		function = "with missionNamespace do {[] spawn PHX_fnc_logoff;}; (uiNamespace getVariable 'escDisplay') closeDisplay 2; true";
		conditions = "";
		disableIF = "";
		tooltip = "Quickly disconnect to the lobby.";
	};
};