/*
	@File: fn_searchList.sqf

	@Author: Jack "Scarso" Farhall

	@Description: Allows for the user to search through a list and update accordingly.

	@Written For: SerenityRP, PhoeinxRP

	@Note:
	Currently only supports one search box per UI. I could make it support multiple but it's not required currently.
*/
#include "..\..\..\script_macros.hpp"
params [
	["_display",-1,[0]],
	["_listBox",-1,[0]],
	["_searchBox",-1,[0]],
	["_type","",[""]]
];

disableSerialization;
if(_display isEqualTo -1 || { _listBox isEqualTo -1 } || { _searchBox isEqualTo -1 }) exitWith { NOTIFY("Bad Input!","red") };

private _list = CONTROL(_display,_listBox);
private _ctrlSearchEdit = CONTROL(_display,_searchBox);

switch(_type) do {
	case "setup": {
		private _listInArray = [];

		for "_i" from 0 to (lbSize _list) do {
			private _value = lbText [_listBox, _i];
			private _data = lbData [_listBox, _i];
			private _pic = lbPicture [_listBox, _i];
			private _number = lbValue [_listBox, _i];
			_listInArray pushBack [_value, _data, _pic, _number];
		};
		PHX_originalList = _listInArray;
	};

	case "search": {
		lbClear _list;

		{
			_value = _x select 0;
			_dataRaw = str(_x select 1);
			_data = ((_dataRaw splitString '"') joinString '');
			_number = _x select 3;
			if (toUpper _value find (toUpper ctrlText _ctrlSearchEdit) >= 0) then {
				_list lbAdd format["%1",_value];
				_list lbSetData [(lbSize _list)-1,_data];
				_list lbSetValue [(lbSize _list)-1, _number];
				if !((_x select 2) isEqualTo "") then { _list lbSetPicture [(lbSize _list)-1, (_x select 2)] };
			};
		} foreach PHX_originalList;
	};
};