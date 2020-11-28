/*
	@File: fn_gangMenu.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Used for managing the gang menu on the UI...
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"

private _group = grpPlayer;

if (PHX_isPM || { player getVariable ["isSO1", false] }) exitWith {};
if !(isNil "life_action_gangInUse") exitWith { [23100, "Home"] call PHX_fnc_switchApp };
if (isNil {_group getVariable "gang_owner"}) exitWith { [24100, "Create Group"] call PHX_fnc_switchApp };

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith {};

ctrlSetText[IDC_GANG_TITLE, format["%1 - Tax: %2%3", (_group getVariable "gang_name"), (_group getVariable ["gang_tax", 0]), "%"]];

private _members = _group getVariable ["gang_members", []];
private _ranks = _group getVariable ["gang_ranks", []];

private _memIndex = (_members findIf { (_x select 1) isEqualTo (getPlayerUID player) });
if (_memIndex isEqualTo -1) exitWith {};

private _myRank = (_ranks select ((_members select _memIndex) select 2));
_myRank params ["_name", "_level", ["_isLeader", false, [true]], ["_invite", false, [true]], ["_kick", false, [true]], ["_promote", false, [true]], ["_upgrade", false, [true]], ["_tax", false, [true]]];

ctrlEnable[IDC_GANG_INVITE, _invite];
ctrlEnable[IDC_GANG_KICK, _kick];
ctrlEnable[IDC_GANG_RANK, _promote];
ctrlShow[IDC_GANG_UPGRADE, _upgrade];

{ ctrlShow[_x, ((_group getVariable "gang_owner") isEqualTo (getPlayerUID player))] } forEach [
	IDC_GANG_DISBAND
];

{ ctrlEnable[_x,((_group getVariable "gang_owner") isEqualTo (getPlayerUID player))] } forEach [
	IDC_GANG_LEADER, IDC_GANG_ALLY_REMOVE, IDC_GANG_TAG, IDC_GANG_MESSAGE, IDC_GANG_RENAME, IDC_GANG_TAX, IDC_GANG_PERMS
];

CONTROL(IDD_TABLET_MAIN,IDC_GANG_BANK) ctrlSetStructuredText parseText format["<img size='1.5' image='data\icons\ico_bank.paa'/><t font='RobotoCondensedLight'>£%1</t>",[(_group getVariable ["gang_bank",0])] call life_fnc_numberText];

// Fallback to ensure we're always able to always manage our members...
if (_members isEqualTo []) then {
	{
		_members pushBackUnique [(_x getVariable["realname", name _x]), (getPlayerUID _x)];
	} forEach (units _group);
};

private _membersList = (_display displayCtrl IDC_GANG_MEMBERS);
[_membersList, [_members, true]] call PHX(gangList);

private _alliesList = (_display displayCtrl IDC_GANG_ALLIES);
[_alliesList, [(_group getVariable ["gang_allies", []]), false]] call PHX(gangList);

private _selOptions = (_display displayCtrl IDC_GANG_SELLIST_SWAP);
lbClear _selOptions;

{
	_selOptions lbAdd format["%1", _x];
	_selOptions lbSetData [(lbSize _selOptions)-1, _x];
} forEach ["Players", "Groups"];

_selOptions ctrlSetEventHandler ["LBSelChanged","
	params [""_control"", ""_selectedIndex""];

	private _list = [];
	private _data = (_control lbData _selectedIndex);
	private _actionBtn = ((findDisplay 23000) displayCtrl 24017);
	_actionBtn ctrlRemoveAllEventHandlers ""ButtonClick"";

	if (_data isEqualTo ""Players"") then {
		_list = ((allPlayers select { alive _x && { (side _x) isEqualTo civilian } && { isNil {(_x getVariable ""spawning"")} } && { !(_x getVariable [""isIncapacitated"", false]) } && { isNil {(_x getVariable ""gang_uid"")} }}) apply {[
			_x getVariable [""realname"", name _x], getPlayerUID _x
		]});

		_actionBtn ctrlSetEventHandler [""ButtonClick"", ""[] spawn PHX_fnc_gangInvite;""];
	} else {
		_list = ((allGroups select { !isNil {_x getVariable ""gang_name""} && { !((_x getVariable ""gang_id"") isEqualTo (player getVariable [""gang_uid"", -1])) }}) apply {[
			_x getVariable ""gang_name"", _x getVariable ""gang_id""
		]});

		_actionBtn ctrlSetEventHandler [""ButtonClick"", ""[] spawn PHX_fnc_startAlliance;""];
	};

	ctrlSetText [24014, _data];
	_actionBtn ctrlSetText format[""INVITE %1"", _data];

	private _playersList = ((findDisplay 23000) displayCtrl 24015);
	[_playersList, [_list, false]] call PHX_fnc_gangList;
"];

lbSetCurSel[IDC_GANG_SELLIST_SWAP, 0];

private _ranksOptions = (_display displayCtrl IDC_GANG_RANK_DROPDOWN);
lbClear _ranksOptions;

{	
	// If it's not the "leader" rank then show it
	if !(_x select 2) then {
		_ranksOptions lbAdd format["%1", (_x select 0)];
		_ranksOptions lbSetData [(lbSize _ranksOptions)-1, str _x];
		_ranksOptions lbSetValue [(lbSize _ranksOptions)-1, (_x select 1)];
	};
} forEach _ranks;

lbSortByValue _ranksOptions;
lbSetCurSel[IDC_GANG_RANK_DROPDOWN, 0];