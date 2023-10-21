/*
    File: fn_spikeStripEffect.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Doesn't work without the server-side effect but shifted part of it clientside
    so code can easily be changed. Ultimately it just pops the tires.
*/

if (!params [["_vehicle", objNull, [objNull]]] || isNull _vehicle) exitWith {};

{_vehicle setHitPointDamage [_x, 1]} count ["HitLFWheel", "HitRFWheel"];
