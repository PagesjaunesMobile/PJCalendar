/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRVitrineAnnoncesOrcFD: StargateKitModel {

    public enum SKRTypeVitrine: String, Codable, Hashable, CaseIterable {
        case immo = "IMMO"
        case auto = "AUTO"
        case moto = "MOTO"
    }

    public var annonces: [SKRAnnonceOrcFD]?

    public var nombreLocations: Int?

    public var nombreTotalAnnonces: Int?

    public var nombreVentes: Int?

    public var produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD?

    public var refVitrine: String?

    public var typeVitrine: SKRTypeVitrine?

    public init(annonces: [SKRAnnonceOrcFD]? = nil, nombreLocations: Int? = nil, nombreTotalAnnonces: Int? = nil, nombreVentes: Int? = nil, produitPublicitaire: SKRProduitPublicitaireApiInscriptionOrcFD? = nil, refVitrine: String? = nil, typeVitrine: SKRTypeVitrine? = nil) {
        self.annonces = annonces
        self.nombreLocations = nombreLocations
        self.nombreTotalAnnonces = nombreTotalAnnonces
        self.nombreVentes = nombreVentes
        self.produitPublicitaire = produitPublicitaire
        self.refVitrine = refVitrine
        self.typeVitrine = typeVitrine
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case annonces
        case nombreLocations = "nombre_locations"
        case nombreTotalAnnonces = "nombre_total_annonces"
        case nombreVentes = "nombre_ventes"
        case produitPublicitaire = "produit_publicitaire"
        case refVitrine = "ref_vitrine"
        case typeVitrine = "type_vitrine"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        annonces = try container.decodeArrayIfPresent(.annonces)
        nombreLocations = try container.decodeIfPresent(.nombreLocations)
        nombreTotalAnnonces = try container.decodeIfPresent(.nombreTotalAnnonces)
        nombreVentes = try container.decodeIfPresent(.nombreVentes)
        produitPublicitaire = try container.decodeIfPresent(.produitPublicitaire)
        refVitrine = try container.decodeIfPresent(.refVitrine)
        typeVitrine = try container.decodeIfPresent(.typeVitrine)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(annonces, forKey: .annonces)
        try container.encodeIfPresent(nombreLocations, forKey: .nombreLocations)
        try container.encodeIfPresent(nombreTotalAnnonces, forKey: .nombreTotalAnnonces)
        try container.encodeIfPresent(nombreVentes, forKey: .nombreVentes)
        try container.encodeIfPresent(produitPublicitaire, forKey: .produitPublicitaire)
        try container.encodeIfPresent(refVitrine, forKey: .refVitrine)
        try container.encodeIfPresent(typeVitrine, forKey: .typeVitrine)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRVitrineAnnoncesOrcFD else { return false }
      guard self.annonces == object.annonces else { return false }
      guard self.nombreLocations == object.nombreLocations else { return false }
      guard self.nombreTotalAnnonces == object.nombreTotalAnnonces else { return false }
      guard self.nombreVentes == object.nombreVentes else { return false }
      guard self.produitPublicitaire == object.produitPublicitaire else { return false }
      guard self.refVitrine == object.refVitrine else { return false }
      guard self.typeVitrine == object.typeVitrine else { return false }
      return true
    }

    public static func == (lhs: SKRVitrineAnnoncesOrcFD, rhs: SKRVitrineAnnoncesOrcFD) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
