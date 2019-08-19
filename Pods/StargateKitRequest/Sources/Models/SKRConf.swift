/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRConf: StargateKitModel {

    public var ffAppsmiles: Int?

    public var ffDataXYBroadcastInterval: Int?

    public var ffDataberries: Int?

    public var ffEzeeworld: Int?

    public var ffFirebase: Int?

    public var ffOptimizely: Int?

    public var ffOrdonnancementFd: String?

    public var ffVersion: Int?

    public var files: [SKRFile]?

    public var freqSyncTotale: Int?

    public var nbMaxFavoris: Int?

    public var nbMaxFavorisGroupe: Int?

    public var uRLAppRealiteAugmentee: String?

    public init(ffAppsmiles: Int? = nil, ffDataXYBroadcastInterval: Int? = nil, ffDataberries: Int? = nil, ffEzeeworld: Int? = nil, ffFirebase: Int? = nil, ffOptimizely: Int? = nil, ffOrdonnancementFd: String? = nil, ffVersion: Int? = nil, files: [SKRFile]? = nil, freqSyncTotale: Int? = nil, nbMaxFavoris: Int? = nil, nbMaxFavorisGroupe: Int? = nil, uRLAppRealiteAugmentee: String? = nil) {
        self.ffAppsmiles = ffAppsmiles
        self.ffDataXYBroadcastInterval = ffDataXYBroadcastInterval
        self.ffDataberries = ffDataberries
        self.ffEzeeworld = ffEzeeworld
        self.ffFirebase = ffFirebase
        self.ffOptimizely = ffOptimizely
        self.ffOrdonnancementFd = ffOrdonnancementFd
        self.ffVersion = ffVersion
        self.files = files
        self.freqSyncTotale = freqSyncTotale
        self.nbMaxFavoris = nbMaxFavoris
        self.nbMaxFavorisGroupe = nbMaxFavorisGroupe
        self.uRLAppRealiteAugmentee = uRLAppRealiteAugmentee
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case ffAppsmiles = "ff_appsmiles"
        case ffDataXYBroadcastInterval = "ff_dataXY_broadcast_interval"
        case ffDataberries = "ff_databerries"
        case ffEzeeworld = "ff_ezeeworld"
        case ffFirebase = "ff_firebase"
        case ffOptimizely = "ff_optimizely"
        case ffOrdonnancementFd = "ff_ordonnancement_fd"
        case ffVersion = "ff_version"
        case files
        case freqSyncTotale = "freq_sync_totale"
        case nbMaxFavoris = "nb_max_favoris"
        case nbMaxFavorisGroupe = "nb_max_favoris_groupe"
        case uRLAppRealiteAugmentee = "url_app_realite_augmentee"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        ffAppsmiles = try container.decodeIfPresent(.ffAppsmiles)
        ffDataXYBroadcastInterval = try container.decodeIfPresent(.ffDataXYBroadcastInterval)
        ffDataberries = try container.decodeIfPresent(.ffDataberries)
        ffEzeeworld = try container.decodeIfPresent(.ffEzeeworld)
        ffFirebase = try container.decodeIfPresent(.ffFirebase)
        ffOptimizely = try container.decodeIfPresent(.ffOptimizely)
        ffOrdonnancementFd = try container.decodeIfPresent(.ffOrdonnancementFd)
        ffVersion = try container.decodeIfPresent(.ffVersion)
        files = try container.decodeArrayIfPresent(.files)
        freqSyncTotale = try container.decodeIfPresent(.freqSyncTotale)
        nbMaxFavoris = try container.decodeIfPresent(.nbMaxFavoris)
        nbMaxFavorisGroupe = try container.decodeIfPresent(.nbMaxFavorisGroupe)
        uRLAppRealiteAugmentee = try container.decodeIfPresent(.uRLAppRealiteAugmentee)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(ffAppsmiles, forKey: .ffAppsmiles)
        try container.encodeIfPresent(ffDataXYBroadcastInterval, forKey: .ffDataXYBroadcastInterval)
        try container.encodeIfPresent(ffDataberries, forKey: .ffDataberries)
        try container.encodeIfPresent(ffEzeeworld, forKey: .ffEzeeworld)
        try container.encodeIfPresent(ffFirebase, forKey: .ffFirebase)
        try container.encodeIfPresent(ffOptimizely, forKey: .ffOptimizely)
        try container.encodeIfPresent(ffOrdonnancementFd, forKey: .ffOrdonnancementFd)
        try container.encodeIfPresent(ffVersion, forKey: .ffVersion)
        try container.encodeIfPresent(files, forKey: .files)
        try container.encodeIfPresent(freqSyncTotale, forKey: .freqSyncTotale)
        try container.encodeIfPresent(nbMaxFavoris, forKey: .nbMaxFavoris)
        try container.encodeIfPresent(nbMaxFavorisGroupe, forKey: .nbMaxFavorisGroupe)
        try container.encodeIfPresent(uRLAppRealiteAugmentee, forKey: .uRLAppRealiteAugmentee)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRConf else { return false }
      guard self.ffAppsmiles == object.ffAppsmiles else { return false }
      guard self.ffDataXYBroadcastInterval == object.ffDataXYBroadcastInterval else { return false }
      guard self.ffDataberries == object.ffDataberries else { return false }
      guard self.ffEzeeworld == object.ffEzeeworld else { return false }
      guard self.ffFirebase == object.ffFirebase else { return false }
      guard self.ffOptimizely == object.ffOptimizely else { return false }
      guard self.ffOrdonnancementFd == object.ffOrdonnancementFd else { return false }
      guard self.ffVersion == object.ffVersion else { return false }
      guard self.files == object.files else { return false }
      guard self.freqSyncTotale == object.freqSyncTotale else { return false }
      guard self.nbMaxFavoris == object.nbMaxFavoris else { return false }
      guard self.nbMaxFavorisGroupe == object.nbMaxFavorisGroupe else { return false }
      guard self.uRLAppRealiteAugmentee == object.uRLAppRealiteAugmentee else { return false }
      return true
    }

    public static func == (lhs: SKRConf, rhs: SKRConf) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
