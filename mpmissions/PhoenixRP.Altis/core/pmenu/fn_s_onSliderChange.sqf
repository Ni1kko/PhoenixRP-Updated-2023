/*
    File: fn_s_onSliderChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the slider is changed for any field and updates the view distance for it.
*/
#include "..\..\script_macros.hpp"
#include "..\..\PHX\GUI\Tablet\macros.hpp"
params [
    ["_mode", -1, [0]],
    ["_value", -1, [0]]
];

if (_mode isEqualTo -1 || { _value isEqualTo -1 }) exitWith {};
disableSerialization;

switch (_mode) do {
    case 0:
    {
        life_settings_viewDistanceFoot = round(_value);
        ctrlSetText[IDC_SETTINGS_FOOTEDIT,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceFoot",round(_value)];
    };

    case 1:
    {
        life_settings_viewDistanceCar = round(_value);
        ctrlSetText[IDC_SETTINGS_CAREDIT,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceCar",round(_value)];
    };

    case 2:
    {
        life_settings_viewDistanceAir = round(_value);
        ctrlSetText[IDC_SETTINGS_AIREDIT,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceAir",round(_value)];
    };

    case 3: {
        _className = lbData[20302,(lbCurSel 20302)];
        _index = lbValue[20302,(lbCurSel 20302)];
        if ((lbCurSel 20302) isEqualTo -1) exitWith {NOTIFY("Select a vehicle","red");};
        if (!isNil "_classname" || _className isEqualTo "") then {
            _vehicle = life_vehicleFuelList select _index;
            _fuel = (fuel _vehicle);
            _fuelTank = (([_className] call life_fnc_fetchVehInfo) select 12);
            _fuelCost = PHX_FuelRate;
            if (HAS_PERK("ecoDriver")) then {
                _fuelCost = (_fuelCost / 2);
            };
            ctrlSetText [20305,format ["Total: £%1", [(round(_fuelCost * (_value - (_fuel * _fuelTank))))] call life_fnc_numberText]];
        } else {
            NOTIFY("Select a vehicle","red");
        };
    };

    case 4: {
        player setDir (360 - _value);
    };

    //RED
    case 5: {
        ctrlSetText[23718,format["%1",round(_value)]];
    };
    //GREEN
    case 6: {
        ctrlSetText[23721,format["%1",round(_value)]];
    };
    //BLUE
    case 7: {
        ctrlSetText[23724,format["%1",round(_value)]];
    };
};
