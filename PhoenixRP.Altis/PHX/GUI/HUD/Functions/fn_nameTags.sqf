/*
	@File: fn_nameTags.sqf
  
	@Author: Jack "Scarso" Farhall
  
	@Description: Creates and displays nametags above player names...
*/
#include "..\..\..\..\script_macros.hpp"

if (!isNil "PHX_fnc_nameTags_draw3d") then {removeMissionEventHandler ["Draw3D", PHX_fnc_nameTags_loop]};

PHX_fnc_nameTags_draw3d = addMissionEventHandler ["Draw3D", {
	if (life_settings_tagson && { !(isDowned(player)) }) then {
		private _masks = LIFE_SETTINGS(getArray,"clothing_masks");
		private _colorSub = [1,1,1,1];

		{
			private _tagPos = ( _x modelToWorldVisual ( _x selectionPosition "pilot" ) ) vectorAdd [ 0, 0, 0.48 ];
			private _myPos = positionCameraToWorld [ 0, 0, 0 ];

			if (!lineIntersects [eyePos player, eyePos _x, player, _x] && {!isNil {_x getVariable "realname"}} && { !(_x getVariable ["hideName", false]) }) then {
				( [ _tagPos, _myPos, 0.00571 ] call PHX(D3DTextCal) ) params [ "_up", "_mid", "_down", "_below" ];

				// Default some values...
				private _name = (_x getVariable["realname", name _x]);
				private _icon = "";
				private _subtitle = "";
				private _title = "";
				private _colorMain = switch true do {
					case ((_x getVariable ["nameColour", "default"]) isEqualType []): {(_x getVariable "nameColour")};
					default { [0,0.901,0.074] };
				};

				private _alpha = linearConversion [ 15 / 1.25, 15, _tagPos distance _myPos, 1, 0, true];
				_colorMain set [3, _alpha];
				_colorSub set [3, _alpha];

				switch true do {
					case (_x getVariable ["isAdmin", false]): {
						_icon = format["%1data\ui\iconlogo.paa", MISSION_ROOT];
						_subtitle = format["On-Duty %1", _x getVariable ["isStaff", "Moderator"]];
					};

					// Masked Player...
					case ((headgear _x) in _masks || {(goggles _x) in _masks} || {(uniform _x) in _masks}): {
						_name = str(_x getVariable ["PHX_ID","Unknown"]);
						_subtitle = "Masked Player";
					};

					case (isDowned(_x)): {
						_icon = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heal_ca.paa";
						_subtitle = "Incapacitated Player";
					};

					case (_x getVariable ["isTazed", false] || { (_x getVariable ["isKnockedOut", false]) }): {
						_subtitle = "Immobilised Player";
					};

					// Faction Information...
					case ((side _x) in [west, independent, east]): {
						private _rankDetails = _x call PHX(getRank);
						_subtitle = _rankDetails # 0;
						_icon = _rankDetails # 1;
					};

					case (((side _x) isEqualTo civilian) && { !(isNil {_x getVariable "isPM"}) }): {_icon = format["%1data\ui\PM.paa", MISSION_ROOT]; _subtitle = "Governor"};

					// CID...
					case (((side _x) isEqualTo civilian) && { (isCID(_x)) } && { (_x getVariable ["showBadge", false]) }): {
						private _rankDetails = _x call PHX(getRank);
						_subtitle = _rankDetails # 0;
						_icon = _rankDetails # 1;
					};

					/* Job Titles */
					case (((side _x) isEqualTo civilian) && { (isNEW(_x)) }): {_icon = format["%1data\ui\ico_News.paa", MISSION_ROOT]; _subtitle = "Altis News"};
					case (((side _x) isEqualTo civilian) && { (isLAW(_x)) }): {_icon = format["%1data\ui\lawyer.paa", MISSION_ROOT]; _subtitle = "Altis Lawyers"};
					case (((side _x) isEqualTo civilian) && { (isTAX(_x)) }): {_icon = format["%1data\ui\taxi.paa", MISSION_ROOT]; _subtitle = "Altis Taxis"};
					case (((side _x) isEqualTo civilian) && { (isSER(_x)) }): {_icon = format["%1data\ui\ico_Repair.paa", MISSION_ROOT]; _subtitle = "Altis Services"};
					case (((side _x) isEqualTo civilian) && { (isSO1(_x)) }): {_icon = format["%1data\ui\so1.paa", MISSION_ROOT]; _subtitle = "SO1 Protection Officer"};

					// Civilian...
					case (!isNil {(group _x) getVariable "gang_name"}): {
						_subtitle = (group _x) getVariable ["gang_name",""];
					};

					default { _subtitle = "Civilian" };
              	};

				if (isRestrained(_x)) then {
					_icon = format["%1data\ui\handcuffs.paa", MISSION_ROOT];
					_subtitle = "Restrained";
				};

				private _title = (_x getVariable ["titleSel",""]);

				private _iconSel = _x getVariable ["iconSel", _icon];
				if ((side _x) isEqualTo civilian && { !(_iconSel isEqualTo "") } && { isClass (missionConfigFile >> "CfgDonatorIcons" >> _iconSel) }) then { 
					_icon = format["%1%2", MISSION_ROOT, (getText(missionConfigFile >> "CfgDonatorIcons" >> _iconSel >> "icon"))];
				};

				if (_x getVariable ["isSpeaking", false]) then {
					_icon = format["%2data\ui\sound%1.paa", (round(time * 7)) mod 2, MISSION_ROOT];
				};

				if !(_icon isEqualTo "" ) then { drawIcon3D [_icon, _colorSub, _up, 1, 1, 0] };
				drawIcon3D ["", _colorMain, _mid, 0, 0, 0, _name, 0, 0.0323, "RobotoCondensed"];
              	drawIcon3D ["", _colorSub, _down, 0, 0, 0, _subtitle, 0, 0.0285, "RobotoCondensed"];
				if !(_title isEqualTo "") then {drawIcon3D ["", _colorSub, _below, 0, 0, 0, _title, 0, 0.0285, "RobotoCondensed"]};
			};
		} forEach ( 
			((getPosATLVisual player) nearEntities [ "Man", 15 ]) select { 
				isPlayer _x && { alive _x } && { isNull objectParent _x } && { !(_x isEqualTo player) || life_settings_player }
			}
		);
	};
}];