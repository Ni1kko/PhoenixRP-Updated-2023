/*
	@File: fn_onLoad.sqf
	@Author: Jack "Scarso" Farhall
	@Description: Runs on switch application...
*/
#include "..\..\..\..\script_macros.hpp"
#include "..\macros.hpp"
params [
	["_title", "AsYetUntitled", [""]]
];

disableSerialization;
if (_title isEqualTo "AsYetUntitled") exitWith { systemChat "No Title..." };

[] call PHX(wipeElements);

switch (_title) do {
	case "Inventory": {
		private _list = CONTROL(IDD_TABLET_MAIN, IDC_INV_LIST);
		lbClear _list;
		
		ctrlSetText[IDC_INV_TITLE,format["Inventory Menu [Weight: %1 / %2]", life_carryWeight, life_maxWeight]];
		
		{
			if(ITEM_VALUE(configName _x) > 0) then {
				_list lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x),(getText(_x >> "displayName"))];
				_list lbSetData [(lbSize _list)-1,configName _x];
				_icon = ICON(M_CONFIG(getText,"CfgItems",configName _x,"icon"));
				if !(_icon isEqualTo "") then {
					_list lbSetPicture [(lbSize _list)-1,_icon];
				};
			};
		} foreach ("true" configClasses (missionConfigFile >> "CfgItems"));

		if (((lbSize _list)-1) isEqualTo -1) then {
			_list lbAdd "You don't have any items...";
			_list lbSetData [(lbSize _list)-1,""];
		};

		_list = CONTROL(IDD_TABLET_MAIN, IDC_INV_LICENSE_LIST);
		lbClear _list;

		private _side = switch (playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"}; case east: {"hav"};};
		
		private _keyword = ["License", "Authorisation"] select (playerSide isEqualTo west);

		{
			if (LICENSE_VALUE(configName _x,_side)) then { _list lbAdd getText(_x >> "displayName") };
		} forEach (format ["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "CfgLicenses"));

		if (((lbSize _list)-1) isEqualTo -1) then {
			_list lbAdd format["You don't have any %1s...", _keyword];
			_list lbSetData [(lbSize _list)-1,""];
		};
	};
	
	case "KeyChain": {
		private _list = CONTROL(IDD_TABLET_MAIN, IDC_KEY_LIST);
		lbClear _list;
		
		for "_i" from 0 to (count life_vehicles)-1 do {
			_veh = life_vehicles select _i;
			if (!isNull _veh && alive _veh) then {
				_color = ((M_CONFIG(getArray,"LifeCfgVehicles",(typeOf _veh),"textures") select (_veh getVariable "Life_VEH_color")) select 0);
				if (isNil "_color") then {_color = ""};
				_text = format ["(%1)",_color];
				if (_text isEqualTo "()") then {
					_text = "";
				};

				private _distance = round(player distance _veh);
				if (_distance >= 100) then { _distance = ">100" };

				_name = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");

				if !((_veh getVariable ["house_name", ""]) isEqualTo "") then {
					_name = format["%1 (%2)", (_veh getVariable ["house_name", ""]), _name];
				};

				_pic = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "picture");
				_list lbAdd format ["%1 %3 - [Distance: %2m]",_name,_distance,_text];

				if (_pic != "pictureStaticObject") then {
					_list lbSetPicture [(lbSize _list)-1,_pic];
				};
				_list lbSetData [(lbSize _list)-1,str(_i)];
			};
		};

		if(((lbSize _list)-1) isEqualTo -1) then {
			_list lbAdd "You don't have any keys...";
			_list lbSetData [(lbSize _list)-1,""];
		};

		/*
		_list = CONTROL(IDD_TABLET_MAIN, IDC_KEY_PLAYERS);
		lbClear _list;

		{
			_list lbAdd format ["%1 - %2",_x getVariable ["realname",name _x], side _x];
			_list lbSetData [(lbSize _list)-1,str(_x)];
		} forEach (playableUnits select {!isNull _x && alive _x && {player distance _x < 20} && {!(_x isEqualTo player)} && {!(_x getVariable ["isInvisibile", false])}});
		*/
	};

	case "Market": {
		private _listHeader = CONTROL(IDD_TABLET_MAIN, IDC_MARKET_HEADER);
		private _itemList = CONTROL(IDD_TABLET_MAIN, IDC_MARKET_LIST);
		private _searchEdit = CONTROL(IDD_TABLET_MAIN, IDC_MARKET_SEARCH);
		private _taxText = CONTROL(IDD_TABLET_MAIN, IDC_MARKET_TAXRATE);

		[_listHeader, _itemList, IDC_MARKET_HEADER_BUTTONS_BASE] call PHX(setupFilter);
		["MarketUpdate"] call PHX(onLoad);

		if !(FETCH_CONST(life_adminlevel) >= 5) then {
			ctrlShow [IDC_MARKET_AMOUNTTXT, false];
			ctrlShow [IDC_MARKET_SPWNBTN, false];
		};

		_searchEdit ctrlAddEventHandler ["KeyUp", {["MarketUpdate"] call PHX(onLoad);}]; // Reload when searching...
		_taxText ctrlSetStructuredText parseText format ["<t align='right'>Tax Rate: %1%2</t>", PHX_TaxRate, "%"];
	};

	case "MarketUpdate": {
		private _itemList = CONTROL(IDD_TABLET_MAIN, IDC_MARKET_LIST);
		private _searchEdit = CONTROL(IDD_TABLET_MAIN, IDC_MARKET_SEARCH);

		lnbClear _itemList; // Ensure the list is cleared...

		private ["_name", "_isIllegal", "_price"];

		{
			_name = (getText(_x >> "displayName"));
			_isIllegal = (ITEM_ILLEGAL(configName _x));
			_price = (getNumber(_x >> "sellPrice"));
			_buyPrice = (getNumber(_x >> "buyPrice"));

			if (toUpper _name find (toUpper ctrlText _searchEdit) >= 0 && { (getNumber(_x >> "marketDisplay")) isEqualTo 1 }) then {
				
				_row = _itemList lnbAddRow [
					_name, // Display Name...
					["Legal", "Illegal"] select (_isIllegal),
					[(getNumber(_x >> "weight"))] call life_fnc_numberText, // Item Weight...
					// Item Sell Price...
					[
						(format["£%1", 
							[
								[
									(getNumber(_x >> "buyPrice")),
									_price,
									_isIllegal,
									false
								] call PHX(calSellPrice)
							] call life_fnc_numberText
						]),
						"N/A"
					] select (_price <= 0),
					[
						(format["£%1", 
							[_buyPrice] call life_fnc_numberText
						]),
						"N/A"
					] select (_buyPrice <= 0)
				];
				
				_itemList lnbSetPicture [[_row, 0], ICON((getText(_x >> "icon")))];
				_itemList lnbSetData [[_row, 0], (configName _x)];
				_itemList lnbSetData [[_row, 1], " "];
				_itemList lnbSetValue [[_row, 2], (getNumber(_x >> "weight"))];
				_itemList lnbSetValue [[_row, 3], _price];
				_itemList lnbSetValue [[_row, 4], _buyPrice];
			};
		} foreach ("true" configClasses (missionConfigFile >> "CfgItems"));

		_itemList lnbSetCurSelRow -1; // Set current selection...
	};

	case "Perks": {
		private _display = findDisplay IDD_TABLET_MAIN;
		private _scrollView = CONTROL(IDD_TABLET_MAIN, IDC_PERK_SCROLL);
		private _removalInfo = CONTROL(IDD_TABLET_MAIN, IDC_PERK_REMOVE_INFO);

		private _side = switch (playerSide) do {case west:{"Police"}; case civilian:{"Civilian"}; case independent:{"Medic"}; case east: {"HAVOC"};};
		
		private _baseIDC = IDC_TABLET_BASE;
		private _yValues = [0.236,0.258,0.302,0.236,0.258];
		#define INC 0.099

		_removalInfo ctrlSetStructuredText parseText format["<t align='center'>Removal Cost: <t color = '#8A2BE2'>£%1</t></t>", [LIFE_SETTINGS(getNumber, "perk_removal")] call LIFE(numberText)];

		private ["_thisElement", "_title", "_description", "_button", "_picDir", "_picture", "_requirement", "_cover", "_requiredText", "_function"];

		// This area works out and updates the inactive perks...
		{
			_thisElement = [];

			// Create Perk Title...
			_title = _display ctrlCreate ["Life_RscText", _baseIDC, _scrollView];
			_title ctrlSetText (getText(_x >> "displayName"));
			_title ctrlSetPosition [0.355312 * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.201094 * safezoneW, 0.022 * safezoneH];
			_thisElement pushBack _title;
			
			// Create Perk Description...
			_description = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 1), _scrollView];
			_description ctrlSetStructuredText parseText (getText(_x >> "description"));
			_description ctrlSetPosition [0.355312 * safezoneW + safezoneX, (_yValues select 1) * safezoneH + safezoneY, 0.37125 * safezoneW, 0.044 * safezoneH];
			ctrlEnable[(_baseIDC + 1), false]; // Disable (Stops "Hovering" text...)
			_thisElement pushBack _description;

			// Create Select Button...
			_button = _display ctrlCreate ["Life_RscButtonMenu", (_baseIDC + 2), _scrollView];
			_button ctrlSetStructuredText parseText "SELECT PERK";
			_button ctrlSetPosition [0.355312 * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0721875 * safezoneW, 0.022 * safezoneH];
			_thisElement pushBack _button;

			_picDir = call compile (getText(_x >> "picture"));
			_picture = _display ctrlCreate ["Life_RscPictureKeepAspect", (_baseIDC + 6), _scrollView];
			_picture ctrlSetPosition [0.298906 * safezoneW + safezoneX, (_yValues select 3) * safezoneH + safezoneY, 0.0567187 * safezoneW, 0.088 * safezoneH];
			_picture ctrlSetText ([_picDir, "\a3\3den\Data\CfgWaypoints\transportUnload_ca.paa"] select (_picDir isEqualTo ""));
			_thisElement pushBack _picture;

			if (PHX_Level < (getNumber(_x >> "unlockLevel")) || { PHX_prestigeLevel < (getNumber(_x >> "presitgeLevel")) }) then {
				ctrlDelete _button;

				_requirement = [
					["LEVEL", (getNumber(_x >> "unlockLevel"))],
					["PRESTIGE", (getNumber(_x >> "presitgeLevel"))]
				] select (PHX_prestigeLevel < (getNumber(_x >> "presitgeLevel")));

				// Create Cover...
				_cover = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 4), _scrollView];
				_cover ctrlSetPosition [0.298906 * safezoneW + safezoneX, (_yValues select 3) * safezoneH + safezoneY, 0.433125 * safezoneW, 0.088 * safezoneH];
				_cover ctrlSetBackgroundColor [0,0,0,0.8];
				_thisElement pushBack _cover;

				// Create Text...
				_requiredText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 5), _scrollView];
				_requiredText ctrlSetPosition [0.298906 * safezoneW + safezoneX, (_yValues select 4) * safezoneH + safezoneY, 0.433125 * safezoneW, 0.044 * safezoneH];
				_requiredText ctrlSetStructuredText parseText format["<t align='center' size='2'>%2 <t color = '#8A2BE2'>%1</t> REQUIRED</t>", (_requirement select 1), (_requirement select 0)];
				_thisElement pushBack _requiredText;
			} else {
				_function = format["['%1', false] spawn PHX_fnc_changePerks", (configName _x)];
				_button ctrlSetEventHandler ["ButtonClick", _function];
			};

			{ _yValues set[_forEachIndex, ((_yValues select _forEachIndex) + INC)] } forEach _yValues; // Work out different Y Values...

			{ _x ctrlCommit 0 } forEach _thisElement;

			_baseIDC = _baseIDC + (count (_thisElement)); // Increment by count for next row...
			PHX_createdElements pushBack _thisElement; // Save it to be deleted later...
		} foreach (format ["'%1' in (getArray(_x >> 'sides')) || { count ((getArray(_x >> 'sides'))) <= 0 }", _side] configClasses (missionConfigFile >> "CfgPerks"));

		[] call PHX(updatePerks); // This will update our active perks...
	};

	case "Progression": {
		private _display = findDisplay IDD_TABLET_MAIN;

		(_display displayCtrl IDC_PROG_NAME) ctrlSetStructuredText parseText format["<t size='2'>%1</t>", name player];
		(_display displayCtrl IDC_PROG_LVL_CUR) ctrlSetStructuredText parseText format["<t align='center' size='2'>%1</t>", PHX_Level];
		(_display displayCtrl IDC_PROG_PRE_CUR) ctrlSetStructuredText parseText format["<t align='center' size='2'>%1</t>", PHX_PrestigeLevel];

		if (!PHX_canPrestige || { PHX_PrestigeLevel >= (getNumber(missionConfigFile >> "CfgLevels" >> "maxPrestige")) }) then { ctrlShow [IDC_PROG_PRES_BUTTON, false] };
	};

	case "Professions": {
		[] call PHX(switchProgression);

		private _display = findDisplay IDD_TABLET_MAIN;
		private _scrollView = CONTROL(IDD_TABLET_MAIN, IDC_PROG_VIEW);

		private _side = switch (playerSide) do {case west:{"Police"}; case civilian:{"Civilian"}; case independent:{"Medic"}; case east: {"HAVOC"};};
		private _baseIDC = IDC_TABLET_BASE;

		#define BASED_X 0.29375
		#define INCREMENT_X 0.113437
		#define INCREMENT_Y 0.173
		
		private _xValues = [(BASED_X - INCREMENT_X), 0.185469]; // Body, Inside
		private _yValues = [0.236, 0.34, 0.364, 0.245]; // Body, Title, Bar, Pic

		private ["_thisElement", "_curLevel", "_maxLevel", "_background", "_titleText", "_backProgress", "_progressBar", "_picture", "_xpText"];

		{
			_thisElement = [];
			
			_curLevel = PROF_LVL(configName _x);
			_maxLevel = getNumber(_x >> "maxLevel");
			
			{  _xValues set[_forEachIndex, (_x + INCREMENT_X)] } forEach _xValues;

			if ((_xValues select 0) > 0.634061) then {
				_xValues set[0, BASED_X];
				{  if !(_forEachIndex isEqualTo 0) then { _xValues set[_forEachIndex, (0.185469  + INCREMENT_X)] } } forEach _xValues;
				{  _yValues set[_forEachIndex, (_x + INCREMENT_Y)] } forEach _yValues;
			};

			_background = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 1), _scrollView];
			_background ctrlSetPosition [(_xValues select 0) * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.103125 * safezoneW, 0.154 * safezoneH];
			_background ctrlSetBackgroundColor [0.15, 0.15, 0.15, 0.7];
			_thisElement pushBack _background;

			_titleText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 2), _scrollView];
			_titleText ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 1) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			_titleText ctrlSetStructuredText parseText format["<t align='center' size='1'>%1</t>", (getText(_x >> "displayName"))];
			_thisElement pushBack _titleText;

			_backProgress = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 3), _scrollView];
			_backProgress ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			_backProgress ctrlSetBackgroundColor [0.5, 0.5, 0.5, 0.5];
			_thisElement pushBack _backProgress;

			_progressBar = _display ctrlCreate ["Life_RscProgressNoFrame", (_baseIDC + 4), _scrollView];
			_progressBar ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			_progressBar ctrlSetBackgroundColor [0, 0, 0, 0.5];
			_progressBar progressSetPosition (_curLevel / _maxLevel);
			_thisElement pushBack _progressBar;
			
			_picture = _display ctrlCreate ["Life_RscPictureKeepAspect", (_baseIDC + 5), _scrollView];
			_picture ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 3) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.099 * safezoneH];
			_picture ctrlSetText format["%1%2", MISSION_ROOT,(getText(_x >> "icon"))];
			_thisElement pushBack _picture;

			_xpText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 6), _scrollView];
			_xpText ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			_xpText ctrlSetStructuredText parseText format["<t align='center' size='1'>%1/%2</t>", _curLevel, _maxLevel];
			_thisElement pushBack _xpText;

			{ _x ctrlCommit 0 } forEach _thisElement;

			_baseIDC = _baseIDC + (count (_thisElement)); // Increment by count for next row...
			PHX_createdElements pushBack _thisElement; // Save it to be deleted later...
		} foreach (format ["'%1' in (getArray(_x >> 'side'))", _side] configClasses (missionConfigFile >> "CfgProfessions"));
	};

	case "Achievements": {
		private _display = findDisplay IDD_TABLET_MAIN;
		private _scrollView = CONTROL(IDD_TABLET_MAIN, IDC_PROG_VIEW);

		[] call PHX(switchProgression);

		private _baseIDC = IDC_TABLET_BASE;

		#define BASED_X 0.29375
		#define INCREMENT_X 0.113437
		#define INCREMENT_Y 0.173
		
		private _xValues = [(BASED_X - INCREMENT_X), 0.185469]; // Body, Inside
		private _yValues = [0.236, 0.34, 0.245]; // Body, Title, Pic

		private ["_thisElement", "_thisCfg", "_tooltip", "_background", "_titleText", "_picDir", "_picture"];

		{
			_thisElement = [];
			_thisCfg = missionConfigFile >> "CfgAchievements" >> _x;
			
			{  _xValues set[_forEachIndex, (_x + INCREMENT_X)] } forEach _xValues;

			if ((_xValues select 0) > 0.634061) then {
				_xValues set[0, BASED_X];
				_xValues set[1, (0.185469  + INCREMENT_X)];
				{  _yValues set[_forEachIndex, (_x + INCREMENT_Y)] } forEach _yValues;
			};

			_tooltip = (getText(_thisCfg >> "description"));

			_background = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 1), _scrollView];
			_background ctrlSetPosition [(_xValues select 0) * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.103125 * safezoneW, 0.154 * safezoneH];
			_background ctrlSetBackgroundColor [0.15, 0.15, 0.15, 0.7];
			_background ctrlSetTooltip _tooltip;
			_thisElement pushBack _background;

			_titleText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 2), _scrollView];
			_titleText ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 1) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			_titleText ctrlSetStructuredText parseText format["<t align='center' size='1'>%1</t>", (getText(_thisCfg >> "displayName"))];
			_titleText ctrlSetTooltip _tooltip;
			_thisElement pushBack _titleText;

			_picDir = call compile (getText(_thisCfg >> "picture"));
			_picture = _display ctrlCreate ["Life_RscPictureKeepAspect", (_baseIDC + 5), _scrollView];
			_picture ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.099 * safezoneH];
			_picture ctrlSetText format["%1", _picDir];
			_picture ctrlSetTooltip _tooltip;
			_thisElement pushBack _picture;

			{ _x ctrlCommit 0 } forEach _thisElement;

			_baseIDC = _baseIDC + (count (_thisElement)); // Increment by count for next row...
			PHX_createdElements pushBack _thisElement; // Save it to be deleted later...
		} foreach (PHX_Achievements select { (isClass (missionConfigFile >> "CfgAchievements" >> _x)) });
	};

	case "Titles": {
		private _display = findDisplay IDD_TABLET_MAIN;
		private _scrollView = CONTROL(IDD_TABLET_MAIN, IDC_PROG_VIEW);

		PHX_setTitleButton = -1; // Ensure it's wiped...

		[] call PHX(switchProgression);

		private _baseIDC = IDC_TABLET_BASE;

		#define BASED_X 0.29375
		#define INCREMENT_X 0.216562
		#define INCREMENT_Y 0.115
		
		private _xValues = [(BASED_X - INCREMENT_X), (0.438125 - INCREMENT_X)]; // Everything, Button
		private _yValues = [0.236, 0.269]; // Everything, Description

		private ["_thisElement", "_thisCfg", "_des", "_background", "_butTxt", "_curTitle", "_unlocked", "_button", "_titleText", "_descText", "_fnc"];

		{
			_thisElement = [];
			_thisCfg = _x;
			
			{  _xValues set[_forEachIndex, (_x + INCREMENT_X)] } forEach _xValues;

			if ((_xValues select 0) > 0.510312) then {
				_xValues set[0, BASED_X];
				_xValues set[1, 0.438125];
				{  _yValues set[_forEachIndex, (_x + INCREMENT_Y)] } forEach _yValues;
			};

			_title = (getText(_thisCfg >> "displayName"));
			_des = (getText(_thisCfg >> "description"));
			_unlocked = (call compile (getText(_thisCfg >> "condition")));

			_background = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 1), _scrollView];
			_background ctrlSetPosition [(_xValues select 0) * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.20625 * safezoneW, 0.099 * safezoneH];
			_background ctrlSetBackgroundColor [0.15, 0.15, 0.15, 0.7];
			_thisElement pushBack _background;
			
			_curTitle = (player getVariable ["titleSel", ""]);

			_butTxt = call {
				if (_curTitle isEqualTo _title && { !(_curTitle isEqualTo "") } && { _unlocked }) exitWith {["Remove", [0,0.1,0,0.5]]};
				if (_unlocked) exitWith {["Select", [0,0.3,0,1]]};
				["Locked", [0.1,0,0, 0.3]]
			};

			_button = _display ctrlCreate ["Life_RscButtonLoyalty", (_baseIDC + 2), _scrollView];
			_button ctrlSetStructuredText parseText format["<t size='1'>&#160;</t><br/><t align='center' size='1.5'>%1</t>", (_butTxt select 0)];
			_button ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.061875 * safezoneW, 0.099 * safezoneH];
			_button ctrlSetBackgroundColor (_butTxt select 1);

			if (_unlocked) then {
				_fnc = format["[(_this select 0), '%1'] call PHX_fnc_setTitle", _title];

				if (_curTitle isEqualTo _title && { !(_curTitle isEqualTo "") }) then {
					_fnc = "[(_this select 0), ''] call PHX_fnc_setTitle";
				};

				_button ctrlSetEventHandler ["ButtonClick", _fnc];
			};

			_thisElement pushBack _button;

			_titleText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 3), _scrollView];
			_titleText ctrlSetPosition [(_xValues select 0) * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.144375 * safezoneW, 0.033 * safezoneH];
			_titleText ctrlSetStructuredText parseText format["<t valign='middle' size='1.25'>%1</t>", _title];
			_titleText ctrlSetBackgroundColor [0.05, 0.05, 0.05, 0.85];
			_thisElement pushBack _titleText;

			_descText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 3), _scrollView];
			_descText ctrlSetPosition [(_xValues select 0) * safezoneW + safezoneX, (_yValues select 1) * safezoneH + safezoneY, 0.144375 * safezoneW, 0.066 * safezoneH];
			_descText ctrlSetStructuredText parseText format["<t size='1'>%1</t>", _des];
			_thisElement pushBack _descText;

			{ _x ctrlCommit 0 } forEach _thisElement;

			if (_curTitle isEqualTo _title && { !(_curTitle isEqualTo "") } && { _unlocked }) then {
				PHX_setTitleButton = ctrlIDC _button;
			};

			_baseIDC = _baseIDC + (count (_thisElement)); // Increment by count for next row...
			PHX_createdElements pushBack _thisElement; // Save it to be deleted later...
		} forEach ("true" configClasses(missionConfigFile >> "CfgTitles"));
	};

	case "Loyalty": {
		[_title] call PHX(switchProgression);

		private _display = findDisplay IDD_TABLET_MAIN;
		private _scrollView = _display displayCtrl IDC_PROG_VIEW;

		private _baseIDC = IDC_TABLET_BASE;

		#define BASED_X 0.29375
		#define INCREMENT_X 0.113437
		#define INCREMENT_Y 0.173
		
		private _xValues = [(BASED_X - INCREMENT_X), 0.185469]; // Body, Inside
		private _yValues = [0.236, 0.34, 0.364, 0.245]; // Body, Title, Bar, Pic

		PHX_loyalty params ["_loyDays", "_loyRewards"];
		private _intoTotal = floor (_loyDays / 8);
		if (_loyDays % 8 isEqualTo 0) then { _intoTotal = _intoTotal - 1 }; // Fixes stuff
		private _totalTerms = 8 * (_intoTotal);
		private _loyDaysTerm = _loyDays - _totalTerms;

		private ["_thisElement", "_isClaimed", "_rewardInfo", "_background", "_titleText", "_picture", "_butTxt", "_thisIDCS", "_button", "_function"];

		for  "_i" from 1 to 8 do {
			_thisElement = [];
			
			{  _xValues set[_forEachIndex, (_x + INCREMENT_X)] } forEach _xValues;

			if ((_xValues select 0) > 0.634061) then {
				_xValues set[0, BASED_X];
				{  if !(_forEachIndex isEqualTo 0) then { _xValues set[_forEachIndex, (0.185469  + INCREMENT_X)] } } forEach _xValues;
				{  _yValues set[_forEachIndex, (_x + INCREMENT_Y)] } forEach _yValues;
			};

			_isClaimed = ((count _loyRewards) >= _i);
			_rewardInfo = ["", (format["%1%2", MISSION_ROOT,"data\ui\QuestionMark.paa"]), 1];

			if (_isClaimed) then {
				_rewardInfo = [(_i - 1)] call PHX_fnc_getRewardInfo;
			};

			_rewardInfo params ["_reTitle", "_rePic", "_reVal"];

			_background = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 1), _scrollView];
			_background ctrlSetPosition [(_xValues select 0) * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.103125 * safezoneW, 0.154 * safezoneH];
			_background ctrlSetBackgroundColor [0.15, 0.15, 0.15, 0.7];
			_thisElement pushBack _background;

			_titleText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 2), _scrollView];
			_titleText ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 1) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			_titleText ctrlSetStructuredText parseText format["<t align='center' size='1'>Day %1</t>", (_i + _totalTerms)];
			_thisElement pushBack _titleText;

			_picture = _display ctrlCreate ["Life_RscPictureKeepAspect", (_baseIDC + 3), _scrollView];
			_picture ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 3) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.088 * safezoneH];
			_picture ctrlSetText _rePic;
			_thisElement pushBack _picture;

			// Add tooltip...
			if !(_reTitle isEqualTo "") then { 
				{
					_x ctrlSetTooltip format["%1 (%2)", _reTitle, _reVal];
				} forEach _thisElement;
			};

			_butTxt = call {
				if (_isClaimed) exitWith {["Reward Claimed", [0,0.1,0,0.5]]};
				if (_i <= _loyDaysTerm) exitWith {["Claim Reward", [0,0.3,0,1]]};
				["Reward Locked", [0.1,0,0, 0.3]]
			};

			_thisIDCS = [(_baseIDC + 1), (_baseIDC + 2), (_baseIDC + 3)];

			_button = _display ctrlCreate ["Life_RscButtonLoyalty", (_baseIDC + 4), _scrollView];
			_button ctrlSetStructuredText parseText format["<t align='center' size='1'>%1</t>", (_butTxt select 0)];
			_button ctrlSetPosition [(_xValues select 1) * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0928125 * safezoneW, 0.022 * safezoneH];
			if !((_butTxt select 0) isEqualTo "Claim Reward") then { _button ctrlEnable false } else {
				_function = format["[(_this select 0), %2, %1] spawn PHX_fnc_claimReward", _i, _thisIDCS];
				_button ctrlSetEventHandler ["ButtonClick", _function];
			};
			_button ctrlSetBackgroundColor (_butTxt select 1);
			_thisElement pushBack _button;

			{ _x ctrlCommit 0 } forEach _thisElement;

			_baseIDC = _baseIDC + (count (_thisElement)); // Increment by count for next row...
			PHX_createdElements pushBack _thisElement; // Save it to be deleted later...
		};
	};

	case "DonatorSettings": { 
		[_title] call PHX(switchProgression);

		private _display = findDisplay IDD_TABLET_MAIN;

		private _iconList = (_display displayCtrl IDC_PROG_DONT_LIST);
		tvClear _iconList;

		private _rgbValues = ([[0,0.901,0.074], PHX_NameColour] select (PHX_NameColour isEqualType []));

		{
			slidersetRange [(_x select 0), 0, 100];
			(_display displayCtrl (_x select 0)) sliderSetSpeed [1, 1, 1];
			sliderSetPosition [(_x select 0), round(((_x select 1) * 100))];
			ctrlSetText[(_x select 2), format["%1", round(((_x select 1) * 100))]];
		} forEach [
			[IDC_PROG_DONT_RED_SLIDER,(_rgbValues select 0),IDC_PROG_DONT_RED_EDIT],
			[IDC_PROG_DONT_GRE_SLIDER,(_rgbValues select 1),IDC_PROG_DONT_GRE_EDIT],
			[IDC_PROG_DONT_BLU_SLIDER,(_rgbValues select 2),IDC_PROG_DONT_BLU_EDIT]
		];

		private _nameColourList = (_display displayCtrl IDC_PROG_DONT_NME_TYP);
		lbClear _nameColourList;

		{ 
			_nameColourList lbAdd format[_x]; 
			_nameColourList lbSetData [(lbSize _nameColourList)-1, _x];
			if (_x isEqualTo PHX_NameColour) then { lbSetCurSel [IDC_PROG_DONT_NME_TYP, _forEachIndex] };
		} forEach ["Default", "Custom RGB"];

		if ((lbCurSel IDC_PROG_DONT_NME_TYP) isEqualTo -1) then { lbSetCurSel [IDC_PROG_DONT_NME_TYP, 1] };

		{
			private _name = _x;
			private _primaryIndex = _iconList tvAdd [[], _name];

			{
				if ((getText(_x >> "type") isEqualTo _name) && ((getNumber(_x >> "level")) <= PHX_DonatorLevel)) then {
					private _subIndex = _iconList tvAdd [[_primaryIndex], getText (_x >> "displayName")];
					_iconList tvSetData [[_primaryIndex, _subIndex], configName _x];
					_iconList tvSetPicture [[_primaryIndex, _subIndex], getText (_x >> "icon")];
					if (PHX_iconSel isEqualTo (configName _x)) then { tvSetCurSel[IDC_PROG_DONT_LIST, [_primaryIndex, _subIndex]] };
				};
			} forEach ("true" configClasses(missionConfigFile >> "CfgDonatorIcons"));
		} forEach ["Animals","Flags","Letters","Movies","Meme","Misc"];
	};

	case "Mobile": {
		ctrlEnable [IDC_MOBILE_INPUT_BOX, true];
		ctrlShow [IDC_MOBILE_DELETE_BUTTON, false];
		ctrlShow [IDC_MOBILE_MSG_VIEW_BOX, false];
		(_display displayCtrl IDC_MOBILE_MSG_VIEW_BOX) ctrlSetStructuredText parseText "";

		private _contactList = CONTROL(IDD_TABLET_MAIN, IDC_MOBILE_LIST);
		private _inboxButton = _display displayCtrl IDC_MOBILE_INBOX_BUTTON;
		_contactList ctrlEnable false;
		lbClear _contactList;

		_contactList ctrlSetPosition [safeZoneX + safeZoneW * 0.608279, safeZoneY + safeZoneH * 0.326, safeZoneW * 0.113437, safeZoneH * 0.318];
		_contactList ctrlCommit 0;

		_inboxButton ctrlSetText "View Inbox";
		_inboxButton ctrlSetPosition [safeZoneX + safeZoneW * 0.608281, safeZoneY + safeZoneH * 0.696, safeZoneW * 0.113437, safeZoneH * 0.022];
		_inboxButton ctrlCommit 0;

		private _toAdd = [];
		
		{
			_toAdd pushBack [(getText(_x >> "title")), (configName _x), (getText(_x >> "picture")), (getNumber(_x >> "priority"))];
		} forEach ("call compile (getText(_x >> 'condition'))" configClasses (missionConfigFile >> "CfgContacts"));

		_toAdd append ((playableUnits select {!isNil {_x getVariable "realname"} && {!(_x isEqualTo player)}}) apply {[
          _x getVariable ["realname", name _x],
          getPlayerUID _x,
          format ["\a3\3den\Data\Displays\Display3DEN\PanelRight\side_%1_ca.paa", switch (side _x) do {case independent: {"guer"}; case civilian: {"civ"}; default {side _x}}],
          switch (side _x) do {case west: {50}; case independent: {55}; case east: {60}; default {70}}
        ]});

		{
			_x params ["_name", "_value", ["_pic", "", [""]], "_priority"];

			_contactList lbAdd _name;
			_contactList lbSetData [(lbsize _contactList) - 1, _value];
			_contactList lbSetValue [(lbSize _contactList) - 1, _priority];
			if !(_pic isEqualTo "") then {
				_contactList lbSetPicture [(lbSize _contactList) - 1, _pic];
			};
        } count _toAdd;

		lbSortByValue _contactList;
		_contactList ctrlEnable true;

		[IDD_TABLET_MAIN, IDC_MOBILE_LIST, IDC_MOBILE_SEARCH, "setup"] call PHX(searchList);
		CONTROL(IDD_TABLET_MAIN, IDC_MOBILE_SEARCH) ctrlAddEventHandler ["KeyUp", {[IDD_TABLET_MAIN, IDC_MOBILE_LIST, IDC_MOBILE_SEARCH, "search"] call PHX(searchList);}];
	};

	case "Admin": {
		private _playerList = CONTROL(IDD_TABLET_MAIN, IDC_ADMIN_LIST);
		_playerList ctrlEnable false;
		lbClear _playerList;

		{
			_x params ["_name", "_value", ["_pic", "", [""]], "_priority", "_object"];

			_playerList lbAdd _name;
			_playerList lbSetData [(lbsize _playerList) - 1, _value];
			_playerList lbSetValue [(lbSize _playerList) - 1, _priority];
			
			if (isDowned(_object)) then {
				_playerList lbSetPictureRight [(lbSize _playerList)-1, "\a3\ui_f\data\IGUI\Cfg\Revive\overlayIcons\r100_ca.paa"];
				_playerList lbSetPictureRightColor [(lbSize _playerList)-1, [0.9,0.1,0.1,0.65]];
			};

			switch (true) do {
				case (_object getVariable ["isAdmin", false]): {
					_playerList lbSetPicture [(lbSize _playerList) - 1, "\a3\ui_f_curator\Data\Logos\arma3_curator_eye_64_ca.paa"];
				};

				default {
					if !(_pic isEqualTo "") then {
						_playerList lbSetPicture [(lbSize _playerList) - 1, _pic];
					};
				};
			};
        } count ((playableUnits select {!isNil {_x getVariable "realname"}}) apply {[
			_x getVariable ["realname", name _x],
			getPlayerUID _x,
			format ["\a3\3den\Data\Displays\Display3DEN\PanelRight\side_%1_ca.paa", switch (side _x) do {case independent: {"guer"}; case civilian: {"civ"}; default {side _x}}],
			switch (side _x) do {case west: {50}; case independent: {55}; case east: {60}; default {70}},
			_x
        ]});

		lbSortByValue _playerList;
		lbSetCurSel [IDC_ADMIN_LIST, 0];
		[] spawn PHX(queryPlayer);

		[IDD_TABLET_MAIN, IDC_ADMIN_LIST, IDC_ADMIN_SEARCH, "setup"] call PHX(searchList);
		CONTROL(IDD_TABLET_MAIN, IDC_ADMIN_SEARCH) ctrlAddEventHandler ["KeyUp", {[IDD_TABLET_MAIN, IDC_ADMIN_LIST, IDC_ADMIN_SEARCH, "search"] call PHX(searchList);}];
		
		private _idc = IDC_ADMIN_BUTTONS;

		#define BASED_X 0.278281
		#define INCREMENT_X 0.113438
		#define INCREMENT_Y 0.024

		private _currentX = BASED_X - INCREMENT_X;
		private _currentY = 0.61;

		{
			private _button = _display ctrlCreate ["Life_RscButtonMenu", _idc];

			_button ctrlSetStructuredText parseText format["%1", getText(_x >> "title")];

			private _xValue = _currentX + INCREMENT_X;
			private _yValue = _currentY;

			if (_xValue > 0.618595) then {
				_xValue = BASED_X;
				_currentY = _currentY + INCREMENT_Y;
			};

			_button ctrlSetPosition [
				_xValue * safezoneW + safezoneX,
				_currentY * safezoneH + safezoneY,
				0.103125 * safezoneW,
				0.022 * safezoneH
			];

			_button ctrlSetTooltip getText(_x >> "tooltip");
			_button ctrlSetEventHandler ["ButtonClick", (format["['%1'] call PHX_fnc_doPower", (configName _x)])];
			_button ctrlCommit 0;

			_idc = _idc + 1;
			_currentX = _xValue;
			PHX_createdElements pushBack _button;
		} forEach ("[getText(_x >> 'conditions')] call life_fnc_levelCheck && { getNumber(_x >> 'isButton') isEqualTo 1 }" configClasses (missionConfigFile >> "CfgPowers"));

		_playerList ctrlEnable true;
	};

	case "Group": { call PHX(gangMenu) };

	case "PNC": { call LIFE(wantedMenu) };
	
	case "Create Group": {};

	case "Group Permissions": {
		private _group = grpPlayer;
		
		if !(isNil "life_action_gangInUse") exitWith { [23100, "Home"] call PHX_fnc_switchApp };
		if (isNil {_group getVariable "gang_owner"}) exitWith { [24100, "Create Group"] call PHX_fnc_switchApp };

		private _display = findDisplay IDD_TABLET_MAIN;
		if (isNull _display) exitWith {};

		private _ranks = (_group getVariable "gang_ranks");

		private _list = _display displayCtrl IDC_GANG_RANKS_LIST;

		_list ctrlRemoveAllEventHandlers "LBSelChanged";
		_list ctrlSetEventHandler ["LBSelChanged","[""view""] call PHX_fnc_rankUpdate"];

		_list ctrlEnable false;
		lbClear _list;

		if (_ranks isEqualTo []) then {
			_list lbAdd format["No Ranks..."];
			_list lbSetData [(lbSize _list)-1, ""];
		} else {
			{
				_x params ["_name", "_level", "_isLeader", "_invite", "_kick", "_promote", "_upgrade"];
				_list lbAdd format["%1", _name];
				_list lbSetData [(lbSize _list)-1, str _x];
				_list lbSetValue [(lbSize _list)-1, _level];
			} foreach _ranks;

			lbSortByValue _list;
		};

		_list ctrlEnable true;
		lbSetCurSel[IDC_GANG_RANKS_LIST, 0];

		tableEsc = [24000, "Group"];
	};

	case "Group Perks": {
		private _group = grpPlayer;
		
		if !(isNil "life_action_gangInUse") exitWith { [23100, "Home"] call PHX_fnc_switchApp };
		if (isNil {_group getVariable "gang_owner"}) exitWith { [24100, "Create Group"] call PHX_fnc_switchApp };

		private _display = findDisplay IDD_TABLET_MAIN;
		if (isNull _display) exitWith {};

		private _gngCfg = missionConfigFile >> "CfgGangs";

		private _curLVL = (_group getVariable ["gang_level", 1]);
		private _curXP = (_group getVariable ["gang_xp", 0]);
		private _reqXP = round((getNumber(_gngCfg >> "baseXP")) * _curLVL) * (getNumber(_gngCfg >> "xpMultiplier"));

		private _nextLevel = [format["Level %1", _curLVL + 1], ""] select (_curLVL >= (getNumber(_gngCfg >> "maxLevel")));

		private _xpBar = _display displayCtrl IDC_GANG_PERKS_PROG;
		private _xpText = _display displayCtrl IDC_GANG_PERKS_PROG_TEXT;
		private _activePerkTitle = _display displayCtrl IDC_GANG_PERKS_ACTIVE_TITLE;
		private _removalText = _display displayCtrl IDC_GANG_PERKS_REMOVE_INFO;
		private _scrollView = _display displayCtrl IDC_GANG_PERKS_VIEW;

		_xpBar progressSetPosition (_curXP / _reqXP);
		_xpText ctrlSetStructuredText parseText format["<t size='2.5'><t align='left'>Level %1</t><t align='center'>%2 / %3</t><t align='right'>%4</t></t>", _curLVL, [_curXP] call life_fnc_numberText, [_reqXP] call life_fnc_numberText, _nextLevel];
		
		_activePerkTitle ctrlSetStructuredText parseText format["Gang Perks <t align='right'>(%1/%2)</t>", (count((_group getVariable ["gang_perks", []]))), (getNumber(_gngCfg >> "maxPerks"))];
		_removalText ctrlSetStructuredText parseText format["<t align='center'>Removal Cost: <t color = '#8A2BE2'>£%1</t></t>", [(getNumber(_gngCfg >> "perkSwitchPrice"))] call LIFE(numberText)];

		private _baseIDC = IDC_TABLET_BASE;
		private _yValues = [0.236,0.258,0.302,0.236,0.258];
		#define INC 0.099

		private ["_thisElement", "_title", "_description", "_button", "_picDir", "_picture", "_requirement", "_cover", "_requiredText", "_function", "_butTxt", "_hasPerk"];

		{
			_thisElement = [];

			// Create Perk Title...
			_title = _display ctrlCreate ["Life_RscText", _baseIDC, _scrollView];
			_title ctrlSetText (getText(_x >> "name"));
			_title ctrlSetPosition [0.355312 * safezoneW + safezoneX, (_yValues select 0) * safezoneH + safezoneY, 0.201094 * safezoneW, 0.022 * safezoneH];
			_thisElement pushBack _title;
			
			// Create Perk Description...
			_description = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 1), _scrollView];
			_description ctrlSetStructuredText parseText (getText(_x >> "description"));
			_description ctrlSetPosition [0.355312 * safezoneW + safezoneX, (_yValues select 1) * safezoneH + safezoneY, 0.37125 * safezoneW, 0.044 * safezoneH];
			ctrlEnable[(_baseIDC + 1), false]; // Disable (Stops "Hovering" text...)
			_thisElement pushBack _description;

			// Create Select Button...
			_button = _display ctrlCreate ["Life_RscButtonMenu", (_baseIDC + 2), _scrollView];
			_button ctrlSetPosition [0.355312 * safezoneW + safezoneX, (_yValues select 2) * safezoneH + safezoneY, 0.0721875 * safezoneW, 0.022 * safezoneH];
			_thisElement pushBack _button;

			_picDir = call compile (getText(_x >> "picture"));
			_picture = _display ctrlCreate ["Life_RscPictureKeepAspect", (_baseIDC + 6), _scrollView];
			_picture ctrlSetPosition [0.298906 * safezoneW + safezoneX, (_yValues select 3) * safezoneH + safezoneY, 0.0567187 * safezoneW, 0.088 * safezoneH];
			_picture ctrlSetText ([_picDir, "\a3\3den\Data\CfgWaypoints\transportUnload_ca.paa"] select (_picDir isEqualTo ""));
			_thisElement pushBack _picture;

			if (_curLVL < (getNumber(_x >> "unlockLevel"))) then {
				ctrlDelete _button;

				// Create Cover...
				_cover = _display ctrlCreate ["Life_RscBackground", (_baseIDC + 4), _scrollView];
				_cover ctrlSetPosition [0.298906 * safezoneW + safezoneX, (_yValues select 3) * safezoneH + safezoneY, 0.433125 * safezoneW, 0.088 * safezoneH];
				_cover ctrlSetBackgroundColor [0,0,0,0.8];
				_thisElement pushBack _cover;

				// Create Text...
				_requiredText = _display ctrlCreate ["Life_RscStructuredText", (_baseIDC + 5), _scrollView];
				_requiredText ctrlSetPosition [0.298906 * safezoneW + safezoneX, (_yValues select 4) * safezoneH + safezoneY, 0.433125 * safezoneW, 0.044 * safezoneH];
				_requiredText ctrlSetStructuredText parseText format["<t align='center' size='2'>LEVEL <t color = '#8A2BE2'>%1</t> REQUIRED</t>", (getNumber(_x >> "unlockLevel"))];
				_thisElement pushBack _requiredText;
			} else {
				_hasPerk = (HAS_GANG_PERK((configName _x), _group));

				_butTxt = call {
					if (_hasPerk) exitWith {["Remove", [0,0.1,0,0.5]]};
					["Select", [0,0.3,0,1]]
				};

				_button ctrlSetStructuredText parseText (_butTxt select 0);
				_button ctrlSetBackgroundColor (_butTxt select 1);

				_function = format["[(_this select 0), '%1'] spawn PHX_fnc_changeGangPerks", (configName _x)];
				_button ctrlSetEventHandler ["ButtonClick", _function];
			};

			{ _yValues set[_forEachIndex, ((_yValues select _forEachIndex) + INC)] } forEach _yValues; // Work out different Y Values...

			{ _x ctrlCommit 0 } forEach _thisElement;

			_baseIDC = _baseIDC + (count (_thisElement)); // Increment by count for next row...
			PHX_createdElements pushBack _thisElement; // Save it to be deleted later...
		} foreach ("true" configClasses (missionConfigFile >> "CfgGangs" >> "Perks"));

		tableEsc = [24000, "Group"];
	};
};