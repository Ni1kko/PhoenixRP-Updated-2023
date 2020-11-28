/*
	@File: fn_initGovernment.sqf
	@Author: Jack "Scarso" Farhall
	@Description: handles active polls and saving of results...
*/

{
	private _val = [_x] call PHXSRV_fnc_getSetting;
	if (_val isEqualType "") then { _val = parseNumber _val };
	missionNamespace setVariable [format["PHX_%1Rate", _x], _val];
} forEach ["Tax", "Paycheck", "Revival", "Fuel"];

private _polls = ["SELECT * FROM phxpolls WHERE date >= SUBDATE(CURDATE(), INTERVAL 2 DAY) AND `delete` = '0'", 2, true] call DB_fnc_asyncCall;

if (_polls isEqualType "" || { _polls isEqualTo [] }) exitWith {diag_log "[PHXSRV][NOTICE] No results found..."}; // No active polls...

private _curDate = [] call PHXSRV_fnc_getDate;
if (_curDate isEqualType false) exitWith {diag_log "[PHXSRV][ERROR] Unable to acquire todays date..."};

fnc_deletePoll = {
	if !(params[
		["_id", 0, [0]],
		["_repeat", 0, [0]],
		["_type", "", [""]],
		["_pollDate", [], [[]]]
	]) exitWith {};

	if (_repeat > 0) then {
		[_id, "date", ([_repeat, 1, _pollDate] call PHXSRV_fnc_getDate)] call PHXSRV_fnc_setPoll;
		[_id, _type, false] call PHXSRV_fnc_setPoll;
	} else {
		[_id, "delete", true] call PHXSRV_fnc_setPoll;
	};

	// Delete everything related to it... (Results, Votes, Options / Candidates)
	[_id] call PHXSRV_fnc_resetPoll;
};

{
	if !(_x params [
		["_id", 0, [0]],
		["_title", "General Election", [""]],
		["_type", "general_election", [""]],
		["_description", "", [""]],
		["_pollDate", [], [[]]],
		["_repeat", 0, [0]],
		["_isPolling", 0, [0]],
		["_isCompleted", 0, [0]],
		["_noVotes", 0, [0]],
		["_noOptions", 0, [0]]
	]) then {false} else {
		private _tomorrow = [1, 1, _pollDate] call PHXSRV_fnc_getDate;
		if (_tomorrow isEqualType false) exitWith {diag_log "[PHXSRV][ERROR] Unable to acquire todays date..."};
		
		/*
		** Now I just have a bunch of checks for ensuring we keep the polls status updated...
		*/

		private _options = [_id] call PHXSRV_fnc_getOptions;

		private _check = (_curDate isEqualTo _tomorrow || { (_curDate isEqualTo _pollDate) });
		private _pushMe = [_title, _type, _id, _options, _description];

		// We've been marked as "No Votes"...
		if (_noVotes isEqualTo 1) exitWith {
			if (_check) then {
				PHX_noVotes pushBack _pushMe;
			} else {
				[_id, _repeat, "noVotes", _pollDate] call fnc_deletePoll;
			};
		};

		// We've been marked as having "No Options"...
		if (_noOptions isEqualTo 1) exitWith {
			if (_check) then {
				PHX_noOptions pushBack _pushMe;
			} else {
				[_id, _repeat, "noOptions", _pollDate] call fnc_deletePoll;
			};
		};

		if (_isCompleted isEqualTo 1) exitWith {
			if (_check) then {
				PHX_doneResults pushBack _pushMe;
			} else {
				[_id, _repeat, "isCompleted", _pollDate] call fnc_deletePoll;
			};

			PHX_curGovernor = [] call PHXSRV_fnc_getGovernor;
		};

		// We've been marked as having "Polling" and we shouldn't still be active...
		if (_isPolling isEqualTo 1 && { !(_curDate isEqualTo _pollDate) }) exitWith {

			if (_curDate isEqualTo _tomorrow) then {
				if (_options isEqualType [] && { !(_options isEqualTo []) }) then {
					if (_isCompleted isEqualTo 1) exitWith {}; // Already Handled...
					scopeName "resultChecking";

					private _finalResults = [];
					private _highest = [];

					{
						private _results = [_id, (_x select 0)] call PHXSRV_fnc_getVotes;

						if (_results isEqualType [] && { !(_results isEqualTo []) }) then {
							private _pushBack = [(_x select 0), (count _results)];
							_finalResults pushBack _pushBack;
							if (_highest isEqualTo [] || { (_highest select 1) < (_pushBack select 1) }) then { _highest = _pushBack };
						};
					} forEach _options;

					// Special Handling for selecting the Governor...
					if (_type isEqualTo "general_election") then {
						if (_highest isEqualTo []) exitWith {
							[_id, "noVotes", true] call PHXSRV_fnc_setPoll;
							PHX_noVotes pushBack _pushMe;
							breakOut "resultChecking";
						};

						private _governor = [_id, format["AND id = '%1' LIMIT 1", (_highest select 0)]] call PHXSRV_fnc_getOptions;
						if (_governor isEqualType "" || { _governor isEqualTo [] }) exitWith {
							[_id, "noOptions", true] call PHXSRV_fnc_setPoll;
							PHX_noOptions pushBack _pushMe;
							breakOut "resultChecking";
						};
						_governor = _governor select 0;

						private _uid = _governor select 3;

						PHX_curGovernor = [(_governor select 2), _uid, (_governor select 4)];
						["governor", _uid] call PHXSRV_fnc_setSetting;
						["governor_details", PHX_curGovernor, "array"] call PHXSRV_fnc_setSetting;
					};

					[_id, _finalResults] call PHXSRV_fnc_saveResult; // Save this polls results...
					PHX_doneResults pushBack (_pushMe append _finalResults);
					[_id, "isCompleted", true] call PHXSRV_fnc_setPoll;
				} else {
					[_id, "noOptions", true] call PHXSRV_fnc_setPoll;
					PHX_noOptions pushBack _pushMe;
				};

				[_id, "isPolling", false] call PHXSRV_fnc_setPoll;
			} else {
				[_id, _repeat, "isCompleted", _pollDate] call fnc_deletePoll;
			};
		};

		if (_isPolling isEqualTo 1 && { _curDate isEqualTo _pollDate }) exitWith {
			PHX_activePolls pushBack _pushMe;
			diag_log format["%1 is now active...", _title];
		};

		// We're not polling but it's polling day...
		if (_isPolling isEqualTo 0 && { _curDate isEqualTo _pollDate }) exitWith {
			if (_options isEqualType [] && { !(_options isEqualTo []) }) then {
				if (_type isEqualTo "general_election") then {
					private _governor = ["governor"] call PHXSRV_fnc_getSetting;
					private _lastGovernor = ["last_governor"] call PHXSRV_fnc_getSetting;

					[format["UPDATE serversettings SET restart = '%1' WHERE name = 'last_governor'",  ([1, 2] select (_governor isEqualTo _lastGovernor))],1] call DB_fnc_asyncCall;
					["last_governor", _governor] call PHXSRV_fnc_setSetting;

					["governor", "-1"] call PHXSRV_fnc_setSetting;
					["governor_details", [], "array"] call PHXSRV_fnc_setSetting;
            		["UPDATE phxclients SET isSO1='0'", 1] call DB_fnc_asyncCall;
				};

				[_id, "isPolling", true] call PHXSRV_fnc_setPoll;
				PHX_activePolls pushBack _pushMe;
				diag_log format["%1 is now active...", _title]; // Debugging...
			} else {
				[_id, "noOptions", true] call PHXSRV_fnc_setPoll;
				PHX_noOptions pushBack _pushMe;
			};
		};

		if (_type isEqualTo "general_election") then {
			PHX_curGovernor = [] call PHXSRV_fnc_getGovernor;
			PHX_isEnlistmentOpen = true;
		};
	};
} forEach _polls;

["CALL deletePollData", 1] call DB_fnc_asyncCall;