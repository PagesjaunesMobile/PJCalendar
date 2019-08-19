/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRResDispoSante: StargateKitModel {

    public var calendars: SKRDispoSanteCalendars?

    public var categories: SKRDispoSanteCategories?

    public var champsFiche: SKRChampsFiche?

    public var champsRdv: SKRChampsRdv?

    public var code: String?

    public var codeCI: String?

    public var days: SKRDays?

    public var fiches: SKRDispoSanteFichePatient?

    public var interventions: SKRDispoSanteInterventions?

    public var msg: String?

    public var nbStep: String?

    public var paiementActif: Bool?

    public var params: SKRParams?

    public var partenaireTransac: String?

    public var politiqueAnnulation: String?

    public var priseRdvSansCompte: Bool?

    public var resumes: SKRDispoSanteResumes?

    public var services: SKRDispoSanteServices?

    public var step: String?

    public var stitle: String?

    public var title: String?

    public var userId: String?

    public init(calendars: SKRDispoSanteCalendars? = nil, categories: SKRDispoSanteCategories? = nil, champsFiche: SKRChampsFiche? = nil, champsRdv: SKRChampsRdv? = nil, code: String? = nil, codeCI: String? = nil, days: SKRDays? = nil, fiches: SKRDispoSanteFichePatient? = nil, interventions: SKRDispoSanteInterventions? = nil, msg: String? = nil, nbStep: String? = nil, paiementActif: Bool? = nil, params: SKRParams? = nil, partenaireTransac: String? = nil, politiqueAnnulation: String? = nil, priseRdvSansCompte: Bool? = nil, resumes: SKRDispoSanteResumes? = nil, services: SKRDispoSanteServices? = nil, step: String? = nil, stitle: String? = nil, title: String? = nil, userId: String? = nil) {
        self.calendars = calendars
        self.categories = categories
        self.champsFiche = champsFiche
        self.champsRdv = champsRdv
        self.code = code
        self.codeCI = codeCI
        self.days = days
        self.fiches = fiches
        self.interventions = interventions
        self.msg = msg
        self.nbStep = nbStep
        self.paiementActif = paiementActif
        self.params = params
        self.partenaireTransac = partenaireTransac
        self.politiqueAnnulation = politiqueAnnulation
        self.priseRdvSansCompte = priseRdvSansCompte
        self.resumes = resumes
        self.services = services
        self.step = step
        self.stitle = stitle
        self.title = title
        self.userId = userId
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case calendars
        case categories
        case champsFiche
        case champsRdv
        case code
        case codeCI
        case days
        case fiches
        case interventions
        case msg
        case nbStep = "nb_step"
        case paiementActif = "paiement_actif"
        case params
        case partenaireTransac = "partenaire_transac"
        case politiqueAnnulation
        case priseRdvSansCompte = "prise_rdv_sans_compte"
        case resumes
        case services
        case step
        case stitle
        case title
        case userId
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        calendars = try container.decodeIfPresent(.calendars)
        categories = try container.decodeIfPresent(.categories)
        champsFiche = try container.decodeIfPresent(.champsFiche)
        champsRdv = try container.decodeIfPresent(.champsRdv)
        code = try container.decodeIfPresent(.code)
        codeCI = try container.decodeIfPresent(.codeCI)
        days = try container.decodeIfPresent(.days)
        fiches = try container.decodeIfPresent(.fiches)
        interventions = try container.decodeIfPresent(.interventions)
        msg = try container.decodeIfPresent(.msg)
        nbStep = try container.decodeIfPresent(.nbStep)
        paiementActif = try container.decodeIfPresent(.paiementActif)
        params = try container.decodeIfPresent(.params)
        partenaireTransac = try container.decodeIfPresent(.partenaireTransac)
        politiqueAnnulation = try container.decodeIfPresent(.politiqueAnnulation)
        priseRdvSansCompte = try container.decodeIfPresent(.priseRdvSansCompte)
        resumes = try container.decodeIfPresent(.resumes)
        services = try container.decodeIfPresent(.services)
        step = try container.decodeIfPresent(.step)
        stitle = try container.decodeIfPresent(.stitle)
        title = try container.decodeIfPresent(.title)
        userId = try container.decodeIfPresent(.userId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(calendars, forKey: .calendars)
        try container.encodeIfPresent(categories, forKey: .categories)
        try container.encodeIfPresent(champsFiche, forKey: .champsFiche)
        try container.encodeIfPresent(champsRdv, forKey: .champsRdv)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(codeCI, forKey: .codeCI)
        try container.encodeIfPresent(days, forKey: .days)
        try container.encodeIfPresent(fiches, forKey: .fiches)
        try container.encodeIfPresent(interventions, forKey: .interventions)
        try container.encodeIfPresent(msg, forKey: .msg)
        try container.encodeIfPresent(nbStep, forKey: .nbStep)
        try container.encodeIfPresent(paiementActif, forKey: .paiementActif)
        try container.encodeIfPresent(params, forKey: .params)
        try container.encodeIfPresent(partenaireTransac, forKey: .partenaireTransac)
        try container.encodeIfPresent(politiqueAnnulation, forKey: .politiqueAnnulation)
        try container.encodeIfPresent(priseRdvSansCompte, forKey: .priseRdvSansCompte)
        try container.encodeIfPresent(resumes, forKey: .resumes)
        try container.encodeIfPresent(services, forKey: .services)
        try container.encodeIfPresent(step, forKey: .step)
        try container.encodeIfPresent(stitle, forKey: .stitle)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(userId, forKey: .userId)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRResDispoSante else { return false }
      guard self.calendars == object.calendars else { return false }
      guard self.categories == object.categories else { return false }
      guard self.champsFiche == object.champsFiche else { return false }
      guard self.champsRdv == object.champsRdv else { return false }
      guard self.code == object.code else { return false }
      guard self.codeCI == object.codeCI else { return false }
      guard self.days == object.days else { return false }
      guard self.fiches == object.fiches else { return false }
      guard self.interventions == object.interventions else { return false }
      guard self.msg == object.msg else { return false }
      guard self.nbStep == object.nbStep else { return false }
      guard self.paiementActif == object.paiementActif else { return false }
      guard self.params == object.params else { return false }
      guard self.partenaireTransac == object.partenaireTransac else { return false }
      guard self.politiqueAnnulation == object.politiqueAnnulation else { return false }
      guard self.priseRdvSansCompte == object.priseRdvSansCompte else { return false }
      guard self.resumes == object.resumes else { return false }
      guard self.services == object.services else { return false }
      guard self.step == object.step else { return false }
      guard self.stitle == object.stitle else { return false }
      guard self.title == object.title else { return false }
      guard self.userId == object.userId else { return false }
      return true
    }

    public static func == (lhs: SKRResDispoSante, rhs: SKRResDispoSante) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
