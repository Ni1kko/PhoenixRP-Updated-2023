/*
    File: fn_vehicleAnimate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Pass what you want to be animated.
*/
params [["_vehicle", objNull, [objNull]], ["_animate", "", ["", []]], ["_preset", false, [false]]];

if (isNull _vehicle) exitWith {}; //FUCK

if (!_preset) then
{
    if (count _animate > 1) then
    {
        {
            _vehicle animate[_x select 0,_x select 1];
        } forEach _animate;
    }
        else
    {
        _vehicle animate[_animate select 0,_animate select 1];
    };
}
    else
{
    switch (_animate) do
    {
        case "service_truck":
        {
            _vehicle animate ["HideServices", 0];
            _vehicle animate ["HideDoor3", 1];
        };

        case "med_offroad":
        {
            _vehicle animate ["HidePolice", 0];
            _vehicle setVariable ["lights",false,true];
        };

        case "cop_offroad":
        {
            _vehicle animate ["HidePolice", 0];
            _vehicle animate ["HideBumper1", 0];
            _vehicle setVariable ["lights",false,true];
        };
    };
};