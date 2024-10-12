local BM_Utils = require('BM_Utils')


Events.OnLoadedTileDefinitions.Add(function(manager)
    BM_Utils.setOrUnsetSpriteProperties(manager, {
        "fencing_Simon_MD_35",
        "fencing_Simon_MD_34",
        "fencing_Simon_MD_39",
        "fencing_Simon_MD_40",

        "fencing_Simon_MD_47",
        "fencing_Simon_MD_46",
        "fencing_Simon_MD_51",
        "fencing_Simon_MD_52",

        "fencing_Simon_MD_57",
        "fencing_Simon_MD_56",
        "fencing_Simon_MD_60",
        "fencing_Simon_MD_61",

        "fencing_Simon_MD_65",
        "fencing_Simon_MD_64",
        "fencing_Simon_MD_68",
        "fencing_Simon_MD_69",
    }, {
        { IsoFlagType.CantClimb },
    });
end)
