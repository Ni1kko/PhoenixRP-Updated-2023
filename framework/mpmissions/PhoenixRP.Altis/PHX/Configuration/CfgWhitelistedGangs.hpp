/*
 *  @file: Config_Gangs.hpp
 *  @author: Sig
 *
 *  Description: Config for whitelisted gangs, aswell as gang bases
 *  Vehicle skins for gangs will need to be manually added in Config_Vehicles.hpp
 *  Adding new gang bases will require to change config_spawnpoints aswell
 *
 *  Formats:
 *  Gangs
 *    gangID = ""; //ID (string) of the gang that is getting the whitelist
 *    displayName = ""; //Name of the gang
 *    clothingShop = ""; //Config name of the shop that will be used for the gang uniform
 *    uniformTextures[] = {}; //Textures for the gang uniform, 2d array ({<clothing type>, <path to texture>})
 *
 *  Bases
 *    ownerID = ""; //ID (string) of the gang that owns the base. Id is the one used in the database
 */

// -- Todo change texture uniform to base off of here aswell

class CfgWhitelistedGangs {

  class EvolvE {
    gangID = "11141";
    displayName = "EvolvE";
    clothingShop = "EvolvE";
  };

  class Ares {
    gangID = "9765";
    displayName = "Ares";
    clothingShop = "Ares";
  };

  class Vanq {
    gangID = "12703";
    displayName = "Vanquish";
    clothingShop = "Vanq";
  };

  class Temper {
    gangID = "12706";
    displayName = "Temper";
    clothingShop = "Temper";
  };

  class TMC {
    gangID = "12681";
    displayName = "TMC";
    clothingShop = "TMC";
  };
};
