class PHXSRV {
    tag = "PHXSRV";

    class ROOT {
        file = "\life_server\PHXSRV";
        class getUndercover {};
        class prestigeWipe {};
        class changeOwner {};
        class sendHook {};
        class logDispute {};
        class getDate {};
        class changeMarker {};
        class handleChat {};
    };

    class Database {
        file = "\life_server\PHXSRV\Database";
        class getConnection {};
    };

    class Player {
        file = "\life_server\PHXSRV\Database\Player";
        class getPlayerInfo {};
    };

    class Crimes  {
        file = "\life_server\PHXSRV\Crimes";
        class getHMValue {};
        class fillArmoury {};
        class getDestroyerValue {};
        class getLockupValue {};
    };

    class ID {
        file = "\life_server\PHXSRV\ID";
        class getID {};
        class insertID {};
        class wipeID {};
        class lookupID {};
        class updateID {};
    };

    class Loyatly {
        file = "\life_server\PHXSRV\Loyalty";
        class getRewards {};
        class saveRewards {};
    };

    class Government {
        file = "\life_server\PHXSRV\Government";
        class getGovernor {};
        class setLegislation {};
        class setLegality {};
        class HandleSO1 {};
    };

    class Government_Polling {
        file = "\life_server\PHXSRV\Government\Polling";
        class initGovernment {};
        class setPoll {};
        class getOptions {};
        class getResults {};
        class getVotes {};
        class saveResult {};
        class resetPoll {};
        class addOption {};
        class addVote {};
    };

    class Settings {
        file = "\life_server\PHXSRV\Settings";
        class getSetting {};
        class setSetting {};
    };

    class Bases {
        file = "\life_server\PHXSRV\Bases";
        class getBid {};
        class addBid {};
        class issueBase {};
        class changeBaseName {};
    };

    class Housing {
        file = "\life_server\PHXSRV\Housing";
        class insertCategory {};
        class getCategories {};
        class saveCategory {};
    };

    class Cartel {
        file = "\life_server\PHXSRV\Cartel";
        class setupCartels {};
        class captureLoop {};
        class insertCapture {};
        class cartelCash {};
    };

    class Stats {
        file = "\life_server\PHXSRV\Stats";
        class getStats {};
        class saveStat {};
    };

    class Mail {
        file = "\life_server\PHXSRV\Mail";
        class getMail {};
        class updateMail {};
        class sendMail {};
    };
};