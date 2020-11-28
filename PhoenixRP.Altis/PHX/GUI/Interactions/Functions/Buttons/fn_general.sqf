#include "..\..\..\..\..\script_macros.hpp"

private _buttons = [];
private _items = assignedItems life_pInact_curTarget + items life_pInact_curTarget;

if (alive life_pInact_curTarget) then {
	if (life_pInact_curTarget getVariable ["isIncapacitated", false]) then {
		if (playerSide isEqualTo independent || (ONLINE(independent) < 1)) then {
			_buttons pushBack ["Open Tablet","[life_pInact_curTarget] spawn PHX_fnc_openMedical; closeDialog 0;"];
		};

		if((life_pInact_curTarget getVariable["Dragging",false])) then {
			_buttons pushBack ["Stop Dragging","[life_pInact_curTarget] call phx_fnc_stopDragging; closeDialog 0;"];
		} else {
			_buttons pushBack ["Drag Player","[life_pInact_curTarget] call phx_fnc_dragAction; closeDialog 0;"];
		};

		if (life_inv_blood_bag > 0) then {
			_buttons pushBack ["Administer Blood","life_pInact_curTarget spawn PHX_fnc_administerBlood; closeDialog 0;"];
		};

		if ("ItemRadio" in _items || {"ItemGPS" in _items} || {"B_UavTerminal" in _items}) then {
			_buttons pushBack ["Seize Communications","[] remoteExecCall ['PHX_fnc_seizeCommunications',life_pInact_curTarget]; closeDialog 0;"];
		};

		_buttons pushBack ["Put In Vehicle","[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;"];

		if (HAS_PERK("graveRobber")) then {
			_buttons pushBack ["Inventory","[life_pInact_curTarget,true] call PHX_fnc_forceOpenInv; closeDialog 0; closeDialog 0;"];
			_buttons pushBack ["Rob Items","['getHostageInventory', player, '']  remoteExecCall ['PHX_fnc_robInventory', life_pInact_curTarget]"];
		};
	} else {

		if !(isRestrained(player)) then {
			_buttons pushBack ["Give Money", "life_pInact_curTarget spawn life_fnc_giveMoney; closeDialog 0;"];
			_buttons pushBack ["Give Item", """Load"" spawn life_fnc_giveItem; closeDialog 0;"];
			_buttons pushBack ["Give Keys", """Load"" spawn life_fnc_keyGive; closeDialog 0;"];
		};

		if (!(playerSide isEqualTo east) && { !(isRestrained(player)) } && { (isNil "PHX_cardCool") }) then {
			_buttons pushBack ["Show ID","[player] RemoteExecCall ['PHX_fnc_RscIDCard',life_pInact_curTarget]; closeDialog 0;"];
			[] spawn {
				PHX_cardCool = true;
				sleep 10;
				PHX_cardCool = nil;
			};
		};

		if ((playerSide isEqualTo east || playerSide isEqualTo civilian) && (animationState life_pInact_curTarget in ["incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon","amovpercmstpsnonwnondnon_ease","amovppnemstpsraswrfldnon"] || life_pInact_curTarget getVariable ["isKnockedOut",false])) then {
			_buttons pushBack ["Rob person","[life_pInact_curTarget] call life_fnc_robAction; closeDialog 0;"];
		};

		if (isRestrained(life_pInact_curTarget)) then {
			if (license_civ_pmc || {(playerSide isEqualTo west)} || {(playerSide isEqualTo east)}) then {
				_buttons pushBack ["Inventory","[life_pInact_curTarget] call PHX_fnc_forceOpenInv; closeDialog 0; closeDialog 0;"];
			};

			if ("ItemRadio" in _items || {"ItemGPS" in _items} || {"B_UavTerminal" in _items}) then {
				_buttons pushBack ["Seize Communications","[] remoteExecCall ['PHX_fnc_seizeCommunications',life_pInact_curTarget]; closeDialog 0;"];
			};

			if ((playerSide isEqualTo east || playerSide isEqualTo civilian) && !(life_pInact_curTarget getVariable ["blindfolded",false]) && (life_inv_blindfold > 0)) then {
				_buttons pushBack ["Blindfold","[life_pInact_curTarget] call PHX_fnc_blindfoldAction; closeDialog 0;"];
			};

			if ((playerSide isEqualTo east || playerSide isEqualTo civilian) && (life_pInact_curTarget getVariable ["blindfolded",false])) then {
				_buttons pushBack ["Un-Blindfold","[life_pInact_curTarget] call PHX_fnc_blindfoldAction; closeDialog 0;"];
			};

			if ((player distance (getMarkerPos "havoc_jail_marker") < 50) && { playerSide isEqualTo east }) exitWith {
				_buttons pushBack ["Jail Person","[life_pInact_curTarget] spawn life_fnc_arrestAction; closeDialog 0;"];
			};

			_buttons pushBack ["Rob Items","['getHostageInventory', player, '']  remoteExecCall ['PHX_fnc_robInventory', life_pInact_curTarget]"];
			_buttons pushBack ["Force Feed / Drink","createDialog 'RscForceFeed'"];
		};

		if (playerSide isEqualTo west || {player getVariable ['isAdmin',false]}) exitWith {
			_buttons pushBack ["Ticket Person","[life_pInact_curTarget] spawn life_fnc_ticketGive;"];

			if (isRestrained(life_pInact_curTarget)) then {
				_buttons pushBack ["Unrestrain Person","[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;"];

				_buttons pushBack ["Check Licenses","[player] remoteExecCall ['life_fnc_licenseCheck',life_pInact_curTarget]; closeDialog 0;"];

				if (life_pInact_curTarget getVariable ['escorting',false]) then {
					_buttons pushBack ["Stop Escorting","[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;"];
				} else {
					_buttons pushBack ["Escort Person","[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;"];
				};

				_buttons pushBack ["Put In Vehicle","[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;"];

				if !((side life_pInact_curTarget) isEqualTo east) then {
					_buttons pushBack ["View ID","[life_pInact_curTarget] call PHX_fnc_RscIDCard; closeDialog 0;"];
				};

				_buttons pushBack ["Search Person","[life_pInact_curTarget] call life_fnc_searchAction; closeDialog 0;"];

				if (FETCH_CONST(life_coplevel) >= 3) then {
					_buttons pushBack ["Seize Cash","[life_pInact_curTarget] call PHX_fnc_seizeMoney; closeDialog 0;"];
					_buttons pushBack ["Seize Items","[life_pInact_curTarget] call PHX_fnc_seizevItems; closeDialog 0;"];
				};
				
				_buttons pushBack ["Inventory", "[life_pInact_curTarget] call PHX_fnc_forceOpenInv; closeDialog 0;"];

				{
					if ((player distance (getMarkerPos _x) < 30) || { player getVariable ['isAdmin',false] }) exitWith {
						_buttons pushBack ["Jail Person","[life_pInact_curTarget] spawn life_fnc_arrestAction; closeDialog 0;"];
					};
				} forEach LIFE_SETTINGS(getArray,"sendtoJail_locations");
			};

			_buttons pushBack ["Request Licenses","[player] remoteExec ['PHX_fnc_requestLicense',life_pInact_curTarget]; closeDialog 0;"];

			if (FETCH_CONST(life_coplevel) >= 11) then {
				if !(life_pInAct_curTarget getVariable["PHX_isSO1",false]) then {
					_buttons pushBack ["Give SO1 Authorisation", "[player, life_pInAct_curTarget, 'add'] remoteExecCall (['fnc_HandleSO1', 'PHXSRV'] call SOCK_fnc_getRemoteDestination); closeDialog 0;"];
				} else {
					_buttons pushBack ["Remove SO1 Authorisation", "[player, life_pInAct_curTarget, 'remove'] remoteExecCall (['fnc_HandleSO1', 'PHXSRV'] call SOCK_fnc_getRemoteDestination); closeDialog 0;"];
				};
			};
		};

		if (playerSide in [civilian, east]) then {
			if (isRestrained(life_pInact_curTarget) && { !((life_pInact_curTarget getVariable ["restrained",sideUnknown]) isEqualTo west) }) then {
				_buttons pushBack ["Remove Ziptie","[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;"];

				if (life_pInact_curTarget getVariable ['escorting',false]) then {
					_buttons pushBack ["Stop Escorting","[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;"];
				} else {
					_buttons pushBack ["Escort Person","[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;"];
				};
				
				_buttons pushBack ["Put In Vehicle","[life_pInact_curTarget] call life_fnc_putInCar; closeDialog 0;"];
			};
		};
	};
};

["Player Interactions", _buttons]