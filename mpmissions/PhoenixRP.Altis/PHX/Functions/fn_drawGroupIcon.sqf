/*
*   @File: fn_drawGroupIcons.sqf
*   @Author: Sig
*
*   Description: Draws group icons for players in groups
*
*	@param _player <Object> Object to draw on
*/

#include "..\..\script_macros.hpp"

#define MAXDISTANCE 4500

params [["_unit", objNull, [objNull]]];

if (vehicle _unit isEqualTo vehicle player) exitWith {false};
if (_unit getVariable ["isAdminOnDuty", false]) exitWith {false};

if (player distance _unit < MAXDISTANCE && (_unit call PHX(hasGPS) || playerSide isEqualTo independent) && alive _unit && isPlayer _unit && !PHX_settings_disableGroupIcons) exitWith {

    private _color = [+(PHX_hex_color), [0.9 , 0, 0, 0.7]] select (isDowned(_unit));
    private _nameColor = [0.9,0.9,0.9,1];
    private _pos = [_unit modelToWorldVisual (_unit selectionPosition "spine3"), (vehicle _unit) modelToWorldVisual [0,0,0]] select (!isNull objectParent _unit);

    // --- Calculate alpha to make sure the color fades out nicely at max distance
    {
    	_X set [3, linearConversion [MAXDISTANCE / 1.2, MAXDISTANCE, player distance _pos, 1, 0, true]];
    } forEach [_color, _nameColor];
    
	// --- Draw main hexagon
    drawIcon3D [ "\a3\ui_f\data\IGUI\Cfg\Cursors\select_ca.paa", _color, _pos, .9, .9, 0 ];

    // -- Draw name in a different color if they have names enabled
    if (PHX_showHexname) then {
        if (vehicle _unit isEqualTo _unit) then {
            drawIcon3D [ "", _nameColor, _pos, 1, 1, 0, (_unit getVariable "realname"), 0, 0.027, "RobotoCondensedBold" ];
        } else {
            if (driver (vehicle _unit) isEqualTo _unit) then {
                drawIcon3D [ "", _nameColor, _pos, 1, 1, 0, format["%1 +%2",(_unit getVariable "realname"),(count crew (vehicle _unit))-1], 0, 0.027, "RobotoCondensedBold" ];
            };
        };
    };

    // --- Draw medical icons inside the hex if the unit is incapacitated
    if (isDowned(_unit)) then {

        drawIcon3D [ "\a3\ui_f\data\IGUI\Cfg\Cursors\unitInjured_ca.paa", _color, _pos, 1.26, 1.26, 0 ];

    };

	true
};

false