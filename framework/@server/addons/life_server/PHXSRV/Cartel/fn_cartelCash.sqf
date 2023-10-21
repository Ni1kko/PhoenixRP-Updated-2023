/*
	@File: fn_cartelCash.sqf
	@Author: Jack "Scarso" Farhall
	@Credit: Sig 
	@Description: Yes
*/
#define HAS_GANG_PERK(perk, gang) perk in (gang getVariable ["gang_perks", []])
#define CFG missionConfigFile >> "CfgCartel" >> worldName >> "Cartels"

for "_i" from 0 to 1 step 0 do {
	{
		private _owner = [_x, true] call PHX_fnc_isZoneOwner;

		if (!(_owner in [-1, -2]) && { _owner isEqualType 0 }) then {

			private _group = [_owner] call PHX_fnc_groupByID;

			if !(isNull _group) then {
				private _pCnts = count playableUnits;
				private _bank = _group getVariable ["gang_bank", 0];
				private _newFunds = _pCnts * ( [1500, 3500] select ( _pCnts >= 60 ) );
				private _cartelString = (_x getVariable ["zCFG", ""]);

				if (HAS_GANG_PERK("Cartel", (_group))) then {
					_newFunds = round(_newFunds * 1.05);
				};

				_group setVariable ["gang_bank", round (_bank + _newFunds), true];
				[(_pCnts * 2), format["Holding %1", (getText (CFG >> _cartelString >> "displayName"))]] remoteExec ["PHX_fnc_handleXP", (units _group)];
				[_pCnts, format["Holding %1", (getText (CFG >> _cartelString >> "displayName"))]] remoteExec ["PHX_fnc_handleGangXP", (units _group)];

				[_group getVariable ["gang_id", -1], _cartelString] remoteExecCall (["fnc_insertCapture", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

				[player, format ["%1 (%2) recieved %3 into their group funds for owning a cartel",
					(_group getVariable ["gang_name", "Unknown Group"]),
					_owner,
					[_newFunds] call life_fnc_numberText
				], "https://rcon.phoenixrp.co.uk/api/v1/log/money"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

				[1, _group] call TON_fnc_updateGang;
			};
		};
	} forEach (PHX_capZones select { !(isNil { _x getVariable "zOwner" }) && { (_x getVariable ["zProgress", 0]) >= 1 } });

	sleep (15 * 60);
};