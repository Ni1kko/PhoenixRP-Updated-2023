/*
	@File: fn_rankUpdate.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Holds update stuff for ranks...

	THIS FILE PISSES ME THE FUCK OFF, SAME WITH THE WHOLE GANG SYSTEM IN GENERAL

	FUCK:
		getVariable / setVariable SHIT
		Arrays
		Literally half of this file
*/
#include "..\..\script_macros.hpp"
#include "..\GUI\Tablet\macros.hpp"
if !(params [["_mode", "", [""]]]) exitWith {};

if !(canSuspend) exitWith { _this spawn PHX(rankUpdate) };

private _group = grpPlayer;

private _display = findDisplay IDD_TABLET_MAIN;
if (isNull _display) exitWith { ["An error occured while preforming this action","red"] spawn PHX(notify) };

private _list = _display displayCtrl IDC_GANG_RANKS_LIST;

_list ctrlEnable false;

private _curSel = lbCurSel IDC_GANG_RANKS_LIST;
if (_curSel isEqualTo -1) exitWith { _list ctrlEnable true; ["You need to select a rank to view / edit","red"] spawn PHX(notify) };

private _ranks = (_group getVariable "gang_ranks");

private _rank = lbData[IDC_GANG_RANKS_LIST, _curSel];
_rank = parseSimpleArray _rank;
_rank params ["_name", "_level", ["_isLeader", false, [true]], ["_invite", false, [true]], ["_kick", false, [true]], ["_promote", false, [true]], ["_upgrade", false, [true]], ["_tax", false, [true]]];

private _rankIndex = (_ranks findIf { _x isEqualTo _rank});
if (_rankIndex isEqualTo -1) exitWith { _list ctrlEnable true; ["This rank does not appear to exist","red"] spawn PHX(notify) };

switch _mode do {
	case "index": {
		if (true) exitWith { ["This action has been disabled as it's been linked to issues with gang wipes.", "red"] spawn PHX(notify) };
		if (_isLeader) exitWith { ["Your unable to edit the position of the leader rank","red"] spawn PHX(notify) };
		private _maxIdx = ((count _ranks) - 1);

		private _newIdx = ctrlText IDC_GANG_RANKS_EDIT;
		if !([_newIdx] call LIFE_fnc_isNumber) exitWith { ["You can only enter numbers for the index","red"] spawn PHX(notify) };
		_newIdx = parseNumber _newIdx;
		
		if (_newIdx <= -1) exitWith { ["You can't have an index below 0","red"] spawn PHX(notify) };
		if (_maxIdx <= _newIdx) exitWith { [format["The index must be below the main ""%1"" rank", ((_ranks select _maxIdx) select 0)],"red"] spawn PHX(notify) };
		
		_ranks deleteAt _rankIndex;
		[_ranks, _rank, _newIdx] call PHX(pushBackAt); // Readd this rank...
		_group setVariable ["gang_ranks", _ranks, true];

		[9, _group, _ranks] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

		[_ranks] call PHX(orderRanks); // Resort "levels"
		["Group Permissions"] call PHX(onLoad); // Update list...
		lbSetCurSel[IDC_GANG_RANKS_LIST, _newIdx];

		[format["%1 has been moved to index %2 from %3...", _name, _newIdx, _level],"green"] spawn PHX(notify);
		["view"] call PHX(rankUpdate);
	};

	case "rename": {
		private _newName = ctrlText IDC_GANG_RANKS_NAME_EDIT;
		private _arName = toArray(_newName);
		private _nameCnt = count (_arName);

		// Name checks...
		if (_newName isEqualTo _name) exitWith { ["You must change the ranks name to something different","red"] spawn PHX(notify) };
		if (_nameCnt < 2 || { _nameCnt > 15 }) exitWith { ["The rank's name must be between 1 and 16 characters","red"] spawn PHX(notify) }; 
		if !((_ranks findIf { (_x select 0) isEqualTo _newName}) isEqualTo -1) exitWith { ["You already have a rank by this name","red"] spawn PHX(notify) };
		if !((_arName findIf {!(_x in (toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_")))}) isEqualTo -1) exitWith {
			["You have invalid characters in your rank name. It can only consist of numbers and letters with an underscore.","red"] spawn PHX(notify);
		};

		_rank set [0, _newName];
		_ranks set [_curSel, _rank];
		_group setVariable ["gang_ranks", _ranks, true];

		[9, _group, _ranks] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
		
		[format["%1 has been renamed to %2", _name, _newName],"green"] spawn PHX(notify);
		["Group Permissions"] call PHX(onLoad); // Update list...
		lbSetCurSel[IDC_GANG_RANKS_LIST, _curSel];
	};

	case "delete": {
		if (true) exitWith { ["This action has been disabled as it's been linked to issues with gang wipes.", "red"] spawn PHX(notify) };
		if (_isLeader) exitWith { ["You can't delete the leader rank","red"] spawn PHX(notify) };

		if ((count _ranks) <= 2) exitWith { ["You must have a minimum of 2 ranks at all times","red"] spawn PHX(notify) };

		private _action = [
			format["Are you sure you wish to delete the rank %1? Everyone at this rank will be set to the lowest", _name],
			"Delete Rank",
			"Delete",
			"Cancel"
		] call PHX_fnc_confirmBox;

		if (_action) then {
			_ranks deleteAt _rankIndex;
			_group setVariable ["gang_ranks", _ranks, true];

			[9, _group, _ranks] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
			
			private _members = (_group getVariable "gang_members");

			// Set all members at this rank to the lowest...
			{
				_x set [2, 0];
				
				[10, _group, [(_x select 1), 0]] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);
			} forEach (_members select { (_x select 2) isEqualTo _rankIndex });
			
			_group setVariable ["gang_members", _members, true];

			[] call PHX(orderRanks); // Resort "levels"

			["Group Permissions"] call PHX(onLoad);

			[format["%1 has been deleted", _name],"green"] spawn PHX(notify);
		};
	};

	case "create": {
		if (true) exitWith { ["This action has been disabled as it's been linked to issues with gang wipes.", "red"] spawn PHX(notify) };
		if ((count _ranks) >= 11) exitWith { ["You must have a maximum of 11 ranks","red"] spawn PHX(notify) };

		private _rankName = ["Enter Rank Name","Create","Cancel"] call PHX_fnc_editBox;

		if !(_rankName isEqualType "") exitWith {};

		private _arName = toArray(_rankName);
		private _nameCnt = count (_arName);

		if (_nameCnt < 2 || { _nameCnt > 15 }) exitWith { ["The rank's name must be between 1 and 16 characters","red"] spawn PHX(notify) }; 
		if !((_ranks findIf { (_x select 0) isEqualTo _rankName}) isEqualTo -1) exitWith { ["You already have a rank by this name","red"] spawn PHX(notify) };
		if !((_arName findIf {!(_x in (toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_")))}) isEqualTo -1) exitWith {
			["You have invalid characters in your rank name. It can only consist of numbers and letters with an underscore","red"] spawn PHX(notify);
		};

		private _newRank = [
			_rankName, // Name
			-1, // Level (Negative one ensures no one will be added to it...)
			false, // isLeader
			false, // Invite
			false, // Kick
			false, // Promote
			false, // Upgrade
			false // tax
		];

		[_ranks, _newRank, 0] call PHX(pushBackAt);
		_group setVariable ["gang_ranks", _ranks, true];

		[9, _group, _ranks] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

		[format["%1 has been created", _rankName],"green"] spawn PHX(notify);
		["Group Permissions"] call PHX(onLoad); // Update list...
	};

	case "savePerms": {
		if (_isLeader) exitWith { ["You can't edit the leader rank's permissions","red"] spawn PHX(notify) };

		_invite = cbChecked (_display displayCtrl IDC_GANG_RANKS_INV_BOX);
		_kick = cbChecked (_display displayCtrl IDC_GANG_RANKS_KIC_BOX);
		_promote = cbChecked (_display displayCtrl IDC_GANG_RANKS_PRO_BOX);
		_upgrade = cbChecked (_display displayCtrl IDC_GANG_RANKS_UPG_BOX);
		_tax = cbChecked (_display displayCtrl IDC_GANG_RANKS_TAX_BOX);

		{
			_x params ["_val", "_idx"];
			_rank set [_idx, _val];
		} forEach [
			[_invite, 3],
			[_kick, 4],
			[_promote, 5],
			[_upgrade, 6],
			[_tax, 7]
		];

		_ranks set [_rankIndex, _rank];
		_group setVariable ["gang_ranks", _ranks, true];
		
		[9, _group, _ranks] remoteExecCall (["fnc_updateGang","TON"] call SOCK_fnc_getRemoteDestination);

		[format["%1's permissions have been updated...", _name],"green"] spawn PHX(notify);

		["Group Permissions"] call PHX(onLoad);
		lbSetCurSel[IDC_GANG_RANKS_LIST, _curSel];
	};

	default {
		ctrlSetText[IDC_GANG_RANKS_EDIT, str _rankIndex];

		private _invBox = (_display displayCtrl IDC_GANG_RANKS_INV_BOX);
		private _kicBox = (_display displayCtrl IDC_GANG_RANKS_KIC_BOX);
		private _proBox = (_display displayCtrl IDC_GANG_RANKS_PRO_BOX);
		private _upgBox = (_display displayCtrl IDC_GANG_RANKS_UPG_BOX);
		private _taxBox = (_display displayCtrl IDC_GANG_RANKS_TAX_BOX);

		_invBox cbSetChecked _invite;
		_kicBox cbSetChecked _kick;
		_proBox cbSetChecked _promote;
		_upgBox cbSetChecked _upgrade;
		_taxBox cbSetChecked _tax;

		{
			_x ctrlEnable (!(_isLeader));
		} forEach [_invBox, _kicBox, _proBox, _upgBox, _taxBox];
	};
};

_list ctrlEnable true;