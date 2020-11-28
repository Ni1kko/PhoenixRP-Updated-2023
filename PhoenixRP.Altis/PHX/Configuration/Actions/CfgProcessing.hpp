/*
	@File: CfgPRO.hpp
	@Author: Jack "Scarso" Farhall & Lewis Mackinnon
	@Description: Configures the contents of all map inits.
*/

class cookhouseProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"rabbit","hen","rooster","sheep","goat","salema","ornate","mackerel","tuna","mullet","catshark","turtle"}, "playerSide isEqualTo civilian", 5 }
	};
};
class appleProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"cider"}, "playerSide isEqualTo civilian && {!license_civ_cider}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"apple"}, "playerSide isEqualTo civilian && license_civ_cider", 5 }
	};
};
class cigaretteProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"tobacco"}, "playerSide isEqualTo civilian && {!license_civ_tobacco}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"tobaccoCigarette"}, "playerSide isEqualTo civilian && license_civ_tobacco", 5 }
	};
};
class cigarProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"tobacco"}, "playerSide isEqualTo civilian && {!license_civ_tobacco}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"tobaccoCigar"}, "playerSide isEqualTo civilian && license_civ_tobacco", 5 }
	};
};
class copperProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"copper"}, "playerSide isEqualTo civilian && {!license_civ_copper}", 5 },
			{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"copper"}, "playerSide isEqualTo civilian && license_civ_copper", 5 }
	};
};
class ironProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"iron"}, "playerSide isEqualTo civilian && {!license_civ_iron}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"iron"}, "playerSide isEqualTo civilian && license_civ_iron", 5 }
	};
};
class silverProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"silver"}, "playerSide isEqualTo civilian && {!license_civ_silver}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"silver"}, "playerSide isEqualTo civilian && license_civ_silver", 5 }
	};
};
class siliconProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"silicon"}, "playerSide isEqualTo civilian && {!license_civ_silicon}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"silicon"}, "playerSide isEqualTo civilian && license_civ_silicon", 5 }
	};
};
class aluminiumProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"aluminium"}, "playerSide isEqualTo civilian && {!license_civ_aluminium}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"aluminium"}, "playerSide isEqualTo civilian && license_civ_aluminium", 5 }
	};
};
class sandProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"sand"}, "playerSide isEqualTo civilian && {!license_civ_sand}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"sand"}, "playerSide isEqualTo civilian && license_civ_sand", 5 }
	};
};
class saltProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"salt"}, "playerSide isEqualTo civilian && {!license_civ_salt}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"salt"}, "playerSide isEqualTo civilian && license_civ_salt", 5 }
	};
};
class oilProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"oil"}, "playerSide isEqualTo civilian && {!license_civ_oil}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"oil"}, "playerSide isEqualTo civilian && license_civ_oil", 5 }
	};
};
class diamondProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"diamond"}, "playerSide isEqualTo civilian && {!license_civ_diamond}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"diamond"}, "playerSide isEqualTo civilian && license_civ_diamond", 5 }
	};
};
class gemProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"gem"}, "playerSide isEqualTo civilian && {!license_civ_gem}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"opal","sapphire","ruby","emerald","diamond"}, "playerSide isEqualTo civilian && license_civ_gem", 5 }
	};
};
class uraniumProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"uranium"}, "playerSide isEqualTo civilian && {!license_civ_uranium}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"uranium"}, "playerSide isEqualTo civilian && license_civ_uranium", 5 }
	};
};
class weedProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"marijuana"}, "playerSide isEqualTo civilian && {!license_civ_marijuana}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"weed"}, "playerSide isEqualTo civilian && license_civ_marijuana", 5 }
	};
};
class heroinProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"heroin"}, "playerSide isEqualTo civilian && {!license_civ_heroin}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"heroin"}, "playerSide isEqualTo civilian && license_civ_heroin", 5 }
	};
};
class cocaineProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"cocaine"}, "playerSide isEqualTo civilian && {!license_civ_cocaine}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"cocaine"}, "playerSide isEqualTo civilian && license_civ_cocaine", 5 }
	};
};
class methProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"meth"}, "playerSide isEqualTo civilian && {!license_civ_meth}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"meth"}, "playerSide isEqualTo civilian && license_civ_meth", 5 }
	};
};
class ecstasyProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"ecstasy"}, "playerSide isEqualTo civilian && {!license_civ_ecstasy}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"ecstasy"}, "playerSide isEqualTo civilian && license_civ_ecstasy", 5 }
	};
};
class moonshineProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"moonshine"}, "playerSide isEqualTo civilian && {!license_civ_moonshine}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"moonshine"}, "(playerSide isEqualTo civilian && license_civ_moonshine) || { playerSide isEqualTo east }", 5 }
	};
};
class multiDrugProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"marijuana","heroin","cocaine","meth","ecstasy","moonshine"}, "", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"weed","heroin","cocaine","meth","ecstasy","moonshine"}, "playerSide isEqualTo civilian && (license_civ_marijuana || license_civ_heroin || license_civ_cocaine || license_civ_meth || license_civ_ecstasy || license_civ_moonshine)", 5 }
	};
};
class weaponProcessing {
	actions[] = { 
		{ "<t color='#b4a7d6'>[CIV]</t> License Store", "PHX_fnc_openLicenses", {"weapon"}, "playerSide isEqualTo civilian && {!license_civ_weapon}", 5 },
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"weapon"}, "(playerSide isEqualTo civilian && license_civ_weapon) || { playerSide isEqualTo east }", 5 }
	};
};
class goldProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"gold"}, "playerSide in [east, civilian]", 5 }
	};
};
class plutoniumProcessing {
	actions[] = {
		{ "<t color='#b4a7d6'>[CIV]</t> Processing Site", "PHX_fnc_openProcessing", {"plutonium"}, "playerSide isEqualTo civilian", 5 }
	};
};