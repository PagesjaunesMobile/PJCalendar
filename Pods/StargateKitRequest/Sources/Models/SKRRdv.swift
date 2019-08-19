/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRRdv: StargateKitModel {

    public var activite: String?

    public var blocId: String?

    public var cp: String?

    public var dateDebut: String?

    public var denomination: String?

    public var denominationStructure: String?

    public var duree: Int?

    public var epj: String?

    public var estAnnulable: Bool?

    public var estRepliClic: Bool?

    public var groupeId: String?

    public var intervention: String?

    public var labelRepliClic: String?

    public var nom: String?

    public var numeroTelephone: String?

    public var partenaireTransac: String?

    public var prenom: String?

    public var rdvId: String?

    public var rue: String?

    public var typeTransac: String?

    public var uRLVisuel: String?

    public var ville: String?

    public init(activite: String? = nil, blocId: String? = nil, cp: String? = nil, dateDebut: String? = nil, denomination: String? = nil, denominationStructure: String? = nil, duree: Int? = nil, epj: String? = nil, estAnnulable: Bool? = nil, estRepliClic: Bool? = nil, groupeId: String? = nil, intervention: String? = nil, labelRepliClic: String? = nil, nom: String? = nil, numeroTelephone: String? = nil, partenaireTransac: String? = nil, prenom: String? = nil, rdvId: String? = nil, rue: String? = nil, typeTransac: String? = nil, uRLVisuel: String? = nil, ville: String? = nil) {
        self.activite = activite
        self.blocId = blocId
        self.cp = cp
        self.dateDebut = dateDebut
        self.denomination = denomination
        self.denominationStructure = denominationStructure
        self.duree = duree
        self.epj = epj
        self.estAnnulable = estAnnulable
        self.estRepliClic = estRepliClic
        self.groupeId = groupeId
        self.intervention = intervention
        self.labelRepliClic = labelRepliClic
        self.nom = nom
        self.numeroTelephone = numeroTelephone
        self.partenaireTransac = partenaireTransac
        self.prenom = prenom
        self.rdvId = rdvId
        self.rue = rue
        self.typeTransac = typeTransac
        self.uRLVisuel = uRLVisuel
        self.ville = ville
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case activite
        case blocId = "bloc_id"
        case cp
        case dateDebut = "date_debut"
        case denomination
        case denominationStructure = "denomination_structure"
        case duree
        case epj
        case estAnnulable = "est_annulable"
        case estRepliClic = "est_repli_clic"
        case groupeId = "groupe_id"
        case intervention
        case labelRepliClic = "label_repli_clic"
        case nom
        case numeroTelephone = "numero_telephone"
        case partenaireTransac = "partenaire_transac"
        case prenom
        case rdvId = "rdv_id"
        case rue
        case typeTransac = "type_transac"
        case uRLVisuel = "url_visuel"
        case ville
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        activite = try container.decodeIfPresent(.activite)
        blocId = try container.decodeIfPresent(.blocId)
        cp = try container.decodeIfPresent(.cp)
        dateDebut = try container.decodeIfPresent(.dateDebut)
        denomination = try container.decodeIfPresent(.denomination)
        denominationStructure = try container.decodeIfPresent(.denominationStructure)
        duree = try container.decodeIfPresent(.duree)
        epj = try container.decodeIfPresent(.epj)
        estAnnulable = try container.decodeIfPresent(.estAnnulable)
        estRepliClic = try container.decodeIfPresent(.estRepliClic)
        groupeId = try container.decodeIfPresent(.groupeId)
        intervention = try container.decodeIfPresent(.intervention)
        labelRepliClic = try container.decodeIfPresent(.labelRepliClic)
        nom = try container.decodeIfPresent(.nom)
        numeroTelephone = try container.decodeIfPresent(.numeroTelephone)
        partenaireTransac = try container.decodeIfPresent(.partenaireTransac)
        prenom = try container.decodeIfPresent(.prenom)
        rdvId = try container.decodeIfPresent(.rdvId)
        rue = try container.decodeIfPresent(.rue)
        typeTransac = try container.decodeIfPresent(.typeTransac)
        uRLVisuel = try container.decodeIfPresent(.uRLVisuel)
        ville = try container.decodeIfPresent(.ville)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(activite, forKey: .activite)
        try container.encodeIfPresent(blocId, forKey: .blocId)
        try container.encodeIfPresent(cp, forKey: .cp)
        try container.encodeIfPresent(dateDebut, forKey: .dateDebut)
        try container.encodeIfPresent(denomination, forKey: .denomination)
        try container.encodeIfPresent(denominationStructure, forKey: .denominationStructure)
        try container.encodeIfPresent(duree, forKey: .duree)
        try container.encodeIfPresent(epj, forKey: .epj)
        try container.encodeIfPresent(estAnnulable, forKey: .estAnnulable)
        try container.encodeIfPresent(estRepliClic, forKey: .estRepliClic)
        try container.encodeIfPresent(groupeId, forKey: .groupeId)
        try container.encodeIfPresent(intervention, forKey: .intervention)
        try container.encodeIfPresent(labelRepliClic, forKey: .labelRepliClic)
        try container.encodeIfPresent(nom, forKey: .nom)
        try container.encodeIfPresent(numeroTelephone, forKey: .numeroTelephone)
        try container.encodeIfPresent(partenaireTransac, forKey: .partenaireTransac)
        try container.encodeIfPresent(prenom, forKey: .prenom)
        try container.encodeIfPresent(rdvId, forKey: .rdvId)
        try container.encodeIfPresent(rue, forKey: .rue)
        try container.encodeIfPresent(typeTransac, forKey: .typeTransac)
        try container.encodeIfPresent(uRLVisuel, forKey: .uRLVisuel)
        try container.encodeIfPresent(ville, forKey: .ville)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRRdv else { return false }
      guard self.activite == object.activite else { return false }
      guard self.blocId == object.blocId else { return false }
      guard self.cp == object.cp else { return false }
      guard self.dateDebut == object.dateDebut else { return false }
      guard self.denomination == object.denomination else { return false }
      guard self.denominationStructure == object.denominationStructure else { return false }
      guard self.duree == object.duree else { return false }
      guard self.epj == object.epj else { return false }
      guard self.estAnnulable == object.estAnnulable else { return false }
      guard self.estRepliClic == object.estRepliClic else { return false }
      guard self.groupeId == object.groupeId else { return false }
      guard self.intervention == object.intervention else { return false }
      guard self.labelRepliClic == object.labelRepliClic else { return false }
      guard self.nom == object.nom else { return false }
      guard self.numeroTelephone == object.numeroTelephone else { return false }
      guard self.partenaireTransac == object.partenaireTransac else { return false }
      guard self.prenom == object.prenom else { return false }
      guard self.rdvId == object.rdvId else { return false }
      guard self.rue == object.rue else { return false }
      guard self.typeTransac == object.typeTransac else { return false }
      guard self.uRLVisuel == object.uRLVisuel else { return false }
      guard self.ville == object.ville else { return false }
      return true
    }

    public static func == (lhs: SKRRdv, rhs: SKRRdv) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
