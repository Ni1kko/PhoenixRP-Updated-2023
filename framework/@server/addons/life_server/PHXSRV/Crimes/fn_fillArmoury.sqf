/*
	@File: fn_fillArmoury.sqf
	@Author: Zyn
	@Description: Setup the Armoury Vault...
*/

#define CFG missionConfigFile >> "CfgArmoury"

private _class = selectRandom (getArray(CFG >> "classes"));

{
	hav_armoury addWeaponCargoGlobal [_x select 0, _x select 1];
} forEach (getArray(CFG >> _class >> "weapons"));

{
	hav_armoury addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach (getArray(CFG >> _class >> "magazines"));

{
	hav_armoury addItemCargoGlobal [_x select 0, _x select 1];
} forEach (getArray(CFG >> _class >> "items"));

/*
private _num = floor(random 4);
if (_num isEqualTo 1) then {hav_armoury addWeaponCargoGlobal ["srifle_LRR_F", 1]; hav_armoury addWeaponCargoGlobal ["arifle_MX_SW_khk_F", 3]; hav_armoury addWeaponCargoGlobal ["srifle_DMR_03_khaki_F", 4]; hav_armoury addWeaponCargoGlobal ["SMG_01_F", 8]; hav_armoury addWeaponCargoGlobal ["arifle_CTAR_ghex_F", 8]; hav_armoury addMagazineCargoGlobal ["7Rnd_408_Mag", 5];};
if (_num isEqualTo 2) then {hav_armoury addWeaponCargoGlobal ["arifle_MX_Black_F", 5]; hav_armoury addWeaponCargoGlobal ["arifle_Katiba_F", 5]; hav_armoury addWeaponCargoGlobal ["LMG_03_F", 2]; hav_armoury addWeaponCargoGlobal ["arifle_MXC_khk_F", 8]; hav_armoury addWeaponCargoGlobal ["SMG_01_F", 8]; hav_armoury addMagazineCargoGlobal ["200Rnd_556x45_Box_F", 3];};
if (_num isEqualTo 3) then {hav_armoury addWeaponCargoGlobal ["srifle_DMR_03_khaki_F", 4]; hav_armoury addWeaponCargoGlobal ["srifle_DMR_06_olive_F", 2]; hav_armoury addWeaponCargoGlobal ["srifle_EBR_F", 2]; hav_armoury addWeaponCargoGlobal ["arifle_CTAR_ghex_F", 8]; hav_armoury addWeaponCargoGlobal ["SMG_01_F", 8]; hav_armoury addMagazineCargoGlobal ["20Rnd_762x51_Mag", 14];};
*/