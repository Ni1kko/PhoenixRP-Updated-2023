/*
	@File: fn_getLockupValue.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Returns the total value in the lockup as well as adds default items...
*/

// Zyn's code (I cba to conver to cfg)
private _num = floor(random 3);
if (_num isEqualTo 0) then {evidence_locker addWeaponCargoGlobal ["LMG_Mk200_F", 2]; evidence_locker addWeaponCargoGlobal ["srifle_DMR_01_F", 3]; evidence_locker addWeaponCargoGlobal ["SMG_05_F", 5]; evidence_locker addWeaponCargoGlobal ["hgun_Rook40_F", 8];  evidence_locker addWeaponCargoGlobal ["hgun_Pistol_01_F", 8]; evidence_locker addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 3]; evidence_locker addItemCargoGlobal ["muzzle_snds_B_khk_F", 1];};
if (_num isEqualTo 1) then {evidence_locker addWeaponCargoGlobal ["srifle_LRR_F", 1]; evidence_locker addWeaponCargoGlobal ["arifle_MX_SW_khk_F", 3]; evidence_locker addWeaponCargoGlobal ["srifle_DMR_03_khaki_F", 4]; evidence_locker addWeaponCargoGlobal ["SMG_01_F", 8]; evidence_locker addWeaponCargoGlobal ["arifle_CTAR_ghex_F", 8]; evidence_locker addMagazineCargoGlobal ["7Rnd_408_Mag", 5];};
if (_num isEqualTo 2) then {evidence_locker addWeaponCargoGlobal ["arifle_MX_Black_F", 5]; evidence_locker addWeaponCargoGlobal ["arifle_Katiba_F", 5]; evidence_locker addWeaponCargoGlobal ["LMG_03_F", 2]; evidence_locker addWeaponCargoGlobal ["arifle_MXC_khk_F", 8]; evidence_locker addWeaponCargoGlobal ["SMG_01_F", 8]; evidence_locker addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 3];};

// Add virtual items...

private _trunk = [];
private _weight = 0;

private _items = ["SELECT array FROM serversettings WHERE name = 'evidence_lockup'", 2] call DB_fnc_asyncCall;

if (_items isEqualType [] && { !(_items isEqualTo []) }) then {

	_items = _items select 0;

	_items = [_items] call DB_fnc_mresToArray;

	{
		_x params ["_varName", "_value"];

		if (isClass (missionConfigFile >> "CfgItems" >> _varName) && { _value > 0 }) then {
			private _iWeight = getNumber (missionConfigFile >> "CfgItems" >> _varName >> "weight");

			_weight = _weight + (_iWeight * _value);
			_trunk pushBack [_varName, _value];
		};
	} forEach _items;

	if !(_trunk isEqualTo []) then {
		evidence_locker setVariable ["Trunk", [_trunk, _weight], true];
	};
};

[format ["UPDATE serversettings SET array = '""[]""' WHERE name = 'evidence_lockup'"], 1] call DB_fnc_asyncCall;
