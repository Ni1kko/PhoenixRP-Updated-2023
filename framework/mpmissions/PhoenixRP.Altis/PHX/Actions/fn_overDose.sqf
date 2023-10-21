/*
    File: fn_drugs.sqf
    Author: Zyn
	Modified: Jack "Scarso" Farhall
    Description: Overdoes the player
*/

if (life_knockout) exitWith {
	life_knockout = false;
	player setVariable ["isKnockedOut", false, true];
};

// Knocks the player out...
life_knockout = true;
player setVariable ["isKnockedOut", true, true];

disableUserInput true;
player setUnconscious true;

"DynamicBlur" ppEffectEnable true;
"DynamicBlur" ppEffectAdjust [20];
"DynamicBlur" ppEffectCommit 1;

sleep 180;

"DynamicBlur" ppEffectEnable false;
life_knockout = false;
player setUnconscious false;
disableUserInput false;
player setVariable ["isKnockedOut", false, true];

player playMoveNow "amovppnemstpsraswrfldnon";