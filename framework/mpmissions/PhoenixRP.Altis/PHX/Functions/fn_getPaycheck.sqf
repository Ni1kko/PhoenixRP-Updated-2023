/*
	@File: fn_getPaycheck.sqf
	@Author: Jack "Scarso" Farhall
	@Description:
*/
#include "..\..\script_macros.hpp"

private _pay = -1;

_pay = switch (playerSide) do {
	case west: {
		private _basePay = switch(FETCH_CONST(life_coplevel)) do {
			case 1: {round (15000 * (1 - (PHX_TaxRate/100)));};
			case 2: {round (15000 * (1 - (PHX_TaxRate/100)));};
			case 3: {round (17000 * (1 - (PHX_TaxRate/100)));};
			case 4: {round (17000 * (1 - (PHX_TaxRate/100)));};
			case 5: {round (20000 * (1 - (PHX_TaxRate/100)));};
			case 6: {round (20000 * (1 - (PHX_TaxRate/100)));};
			case 7: {round (22500 * (1 - (PHX_TaxRate/100)));};
			case 8: {round (25000 * (1 - (PHX_TaxRate/100)));};
			case 9: {round (27500 * (1 - (PHX_TaxRate/100)));};
			case 10: {round (30000 * (1 - (PHX_TaxRate/100)));};
			case 11: {round (32500 * (1 - (PHX_TaxRate/100)));};
			case 12: {round (35000 * (1 - (PHX_TaxRate/100)));};
			case 13: {round (40000 * (1 - (PHX_TaxRate/100)));};
			default {PHX_PaycheckRate;};
		};
		
		private _acadLvl = (FETCH_CONST(life_academylevel));
		if (_acadLvl > 0) then {
			_basePay = _basePay * (1 + (_acadLvl / 10));
		};

		_basePay
	};

	case independent: {
		switch(FETCH_CONST(life_mediclevel)) do {
			case 1: {round (25000 * (1 - (PHX_TaxRate/100)));};
			case 2: {round (30000 * (1 - (PHX_TaxRate/100)));};
			case 3: {round (35000 * (1 - (PHX_TaxRate/100)));};
			case 4: {round (40000 * (1 - (PHX_TaxRate/100)));};
			case 5: {round (45000 * (1 - (PHX_TaxRate/100)));};
			case 6: {round (50000 * (1 - (PHX_TaxRate/100)));};
			case 7: {round (55000 * (1 - (PHX_TaxRate/100)));};
			case 8: {round (60000 * (1 - (PHX_TaxRate/100)));};
			default {PHX_PaycheckRate;};
		};
	};

	case east: {
		switch(FETCH_CONST(life_havoclevel)) do {
			case 1: {18000;};
			case 2: {18000;};
			case 3: {20000;};
			case 4: {22000;};
			case 5: {24000;};
			case 6: {26000;};
			case 7: {28000;};
			case 8: {30000;};
			case 9: {32000;};
			case 10: {34000;};
			case 11: {36000;};
			case 12: {38000;};
			case 13: {40000;};
			default {PHX_PaycheckRate;};
		};
	};

	case civilian: {
		if (isCID(player)) exitWith {
			switch(FETCH_CONST(life_cidlevel)) do {
				case 1: {round (17000 * (1 - (PHX_TaxRate/100)));};
				case 2: {round (20000 * (1 - (PHX_TaxRate/100)));};
				case 3: {round (20000 * (1 - (PHX_TaxRate/100)));};
				case 4: {round (22500 * (1 - (PHX_TaxRate/100)));};
				case 5: {round (27500 * (1 - (PHX_TaxRate/100)));};
				default {round (17000 * (1 - (PHX_TaxRate/100)));};
			};			 
		};

		if (isHSS(player)) exitWith { 65000 };

		if (PHX_isPM) then {
			round (40000 * (1 - (PHX_TaxRate/100)));
		} else {
			switch true do {
				// Job pay out...
				case (
					(isNEW(player)) || 
					{ (isLAW(player)) } || 
					{ (isTAX(player)) } || 
					{ (isSER(player)) } ||  
					{ (isSO1(player)) }
				): { round (15000 * (1 - (PHX_TaxRate/100))); };
				default {PHX_PaycheckRate;};
			};
		};
	};
};

if IS_GOAL then { _pay = round (_pay * (LIFE_SETTINGS(getNumber,"donation_goal_paycheck_multiplier"))) };

_pay;