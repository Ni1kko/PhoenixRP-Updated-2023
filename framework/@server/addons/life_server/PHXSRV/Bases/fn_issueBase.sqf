/*
	@File: fn_issueBase.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Gives all the gang bases to the winning bidders...
*/
#include "\life_server\script_macros.hpp"
if !(params [["_base", "", [""]]]) exitWith {};

private _query = format[
	"SELECT phxgangs.id, phxgangs.bank, PHXBaseBids.bid FROM phxbasebids INNER JOIN phxgangs WHERE PHXBaseBids.base = '%1' AND PHXBaseBids.gangID = phxgangs.id AND PHXBaseBids.bid <= phxgangs.bank AND PHXBaseBids.active = '1' ORDER BY PHXBaseBids.bid DESC", 
	_base
];

private _winner = [_query, 2] call DB_fnc_asyncCall;
if (_winner isEqualType "" || { _winner isEqualTo [] }) exitWith {}; // No one wins...

_winner params ["_id", "_bank", "_bid"];

private _newBank = _bank - _bid;
if (_newBank < 0) exitWith {}; // Should never happen as the query shouldn't allow it if the bid is over bank...

[format ["UPDATE phxgangs SET bank = '%2' WHERE id='%1'", _id, [_newBank] call DB_fnc_numberSafe], 1] call DB_fnc_asyncCall;
[_base, _id] call PHXSRV_fnc_setSetting;