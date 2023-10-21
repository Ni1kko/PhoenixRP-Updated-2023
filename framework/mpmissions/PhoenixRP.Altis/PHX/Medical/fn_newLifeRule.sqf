#include "..\..\script_macros.hpp"
/*
*   @File: fn_newLifeRule.sqf
*   @Author: Sig
*     - Original Author: Ciaran, completely rewritten by Sig
*
*   Description:
*   Handles the new life rule timer that can be seen on
*   the left of the screen after dying (bleeding out)
*/

#define THREAD PHX_FNC_NLR_Timer_Thread
#define LAYER "life_nlrtimer"

params [["_terminate", false, [false]]];

if !(isNil "PHX_FNC_NLR_Timer_Thread") exitWith {
  terminate THREAD;
  THREAD = nil;
  LAYER cutFadeOut 0;
};

// -- Make sure that the script exits if the terminate param is passed as true
// -- This is used for making sure that the script is terminated, and won't create
// -- a new ui if the requirement for the exit above is not met.
if _terminate exitWith {};

THREAD = _this spawn {
	disableSerialization;
	(LAYER call BIS_fnc_RscLayer) cutRsc [LAYER, "PLAIN", 0];

	private _ui = uiNameSpace getVariable [LAYER, displayNull];
	private _stamp = time + (15 * 60);
	if (isNull _ui) then {terminate _thisScript};

	for "_i" from 0 to 1 step 0 do {
		_distance = position player distance PHX_deathPos;
		if (_stamp - time < 1) exitWith {}; // Terminate the script if the timer has expired
		if (isNull _ui) then {_ui = uiNameSpace getVariable [LAYER, displayNull]};
		private _lastTime = [_stamp - time, "MM:SS"] call BIS_fnc_secondsToString;
		(_ui displayCtrl 38301) ctrlSetText (format["NLR: %1 [%2m]",_lastTime, round(_distance)]);
		sleep .1;

		//--- To close to their death point
		if (_distance < 1000) then {
			PHX_deathNLRMsg = true;
			(_ui displayCtrl 38301) ctrlSetText (format["NLR: %1 [Paused]",_lastTime]);
			["Please note you are too close to your old death location. Stay 1km away at all times!"] spawn PHX(notify);

			[format["%1 is breaking NLR...", player getVariable ["realname", name player]], "(call life_adminlevel) > 1"] remoteExecCall ["PHX_fnc_hint", -2];
			[player, format["%1 came within the 1km NLR line!",player getVariable ["realname", name player]], "https://rcon.phoenixrp.co.uk/api/v1/nlr"] remoteExecCall (["fnc_sendHook", "PHXSRV"] call SOCK_fnc_getRemoteDestination);

			private _timeOnPause = time;
			for "_i" from 0 to 1 step 0 do {
				_distance = position player distance PHX_deathPos;
				if (_distance > 1000) exitWith {
					["You've now exited the 1km distance of your previous death! Keep above 1km away at all times!"] spawn PHX(notify);
					(_ui displayCtrl 38301) ctrlSetText (format["NLR: %1 [%2m]",_lastTime, round(_distance)]);
					PHX_deathNLRMsg = false;
					_stamp = _stamp + (time - _timeOnPause);
				};
			};
		};
	};

	// -- Destroy the ui once the timer has finished
	LAYER cutFadeOut 0;
	THREAD = nil;
};