/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

public struct SKRAccount: StargateKitModel {

    public var age: Int?

    public var avatarEnModeration: Bool?

    public var birthdate: String?

    public var cgus: SKRCgu?

    public var city: String?

    public var civility: String?

    public var email: String?

    public var emailContactFid: String?

    public var firstname: String?

    public var idUtilisateur: String?

    public var idUtilisateurExterne: String?

    public var inscritNewsletter: Bool?

    public var lastname: String?

    public var nbReview: String?

    public var numeroMobile: String?

    public var numeroMobileVerifie: Bool?

    public var profil: String?

    public var pseudo: String?

    public var pseudoEnModeration: Bool?

    public var rate: Int?

    public var status: String?

    public var type: String?

    public var urlPhoto: String?

    public var urls: SKRUrls?

    public var valid: Bool?

    public var zip: String?

    public init(age: Int? = nil, avatarEnModeration: Bool? = nil, birthdate: String? = nil, cgus: SKRCgu? = nil, city: String? = nil, civility: String? = nil, email: String? = nil, emailContactFid: String? = nil, firstname: String? = nil, idUtilisateur: String? = nil, idUtilisateurExterne: String? = nil, inscritNewsletter: Bool? = nil, lastname: String? = nil, nbReview: String? = nil, numeroMobile: String? = nil, numeroMobileVerifie: Bool? = nil, profil: String? = nil, pseudo: String? = nil, pseudoEnModeration: Bool? = nil, rate: Int? = nil, status: String? = nil, type: String? = nil, urlPhoto: String? = nil, urls: SKRUrls? = nil, valid: Bool? = nil, zip: String? = nil) {
        self.age = age
        self.avatarEnModeration = avatarEnModeration
        self.birthdate = birthdate
        self.cgus = cgus
        self.city = city
        self.civility = civility
        self.email = email
        self.emailContactFid = emailContactFid
        self.firstname = firstname
        self.idUtilisateur = idUtilisateur
        self.idUtilisateurExterne = idUtilisateurExterne
        self.inscritNewsletter = inscritNewsletter
        self.lastname = lastname
        self.nbReview = nbReview
        self.numeroMobile = numeroMobile
        self.numeroMobileVerifie = numeroMobileVerifie
        self.profil = profil
        self.pseudo = pseudo
        self.pseudoEnModeration = pseudoEnModeration
        self.rate = rate
        self.status = status
        self.type = type
        self.urlPhoto = urlPhoto
        self.urls = urls
        self.valid = valid
        self.zip = zip
    }

    private enum CodingKeys: String, Hashable, CodingKey {
        case age
        case avatarEnModeration
        case birthdate
        case cgus
        case city
        case civility
        case email
        case emailContactFid
        case firstname
        case idUtilisateur
        case idUtilisateurExterne
        case inscritNewsletter
        case lastname
        case nbReview
        case numeroMobile
        case numeroMobileVerifie
        case profil
        case pseudo
        case pseudoEnModeration
        case rate
        case status
        case type
        case urlPhoto
        case urls
        case valid
        case zip
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        age = try container.decodeIfPresent(.age)
        avatarEnModeration = try container.decodeIfPresent(.avatarEnModeration)
        birthdate = try container.decodeIfPresent(.birthdate)
        cgus = try container.decodeIfPresent(.cgus)
        city = try container.decodeIfPresent(.city)
        civility = try container.decodeIfPresent(.civility)
        email = try container.decodeIfPresent(.email)
        emailContactFid = try container.decodeIfPresent(.emailContactFid)
        firstname = try container.decodeIfPresent(.firstname)
        idUtilisateur = try container.decodeIfPresent(.idUtilisateur)
        idUtilisateurExterne = try container.decodeIfPresent(.idUtilisateurExterne)
        inscritNewsletter = try container.decodeIfPresent(.inscritNewsletter)
        lastname = try container.decodeIfPresent(.lastname)
        nbReview = try container.decodeIfPresent(.nbReview)
        numeroMobile = try container.decodeIfPresent(.numeroMobile)
        numeroMobileVerifie = try container.decodeIfPresent(.numeroMobileVerifie)
        profil = try container.decodeIfPresent(.profil)
        pseudo = try container.decodeIfPresent(.pseudo)
        pseudoEnModeration = try container.decodeIfPresent(.pseudoEnModeration)
        rate = try container.decodeIfPresent(.rate)
        status = try container.decodeIfPresent(.status)
        type = try container.decodeIfPresent(.type)
        urlPhoto = try container.decodeIfPresent(.urlPhoto)
        urls = try container.decodeIfPresent(.urls)
        valid = try container.decodeIfPresent(.valid)
        zip = try container.decodeIfPresent(.zip)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(age, forKey: .age)
        try container.encodeIfPresent(avatarEnModeration, forKey: .avatarEnModeration)
        try container.encodeIfPresent(birthdate, forKey: .birthdate)
        try container.encodeIfPresent(cgus, forKey: .cgus)
        try container.encodeIfPresent(city, forKey: .city)
        try container.encodeIfPresent(civility, forKey: .civility)
        try container.encodeIfPresent(email, forKey: .email)
        try container.encodeIfPresent(emailContactFid, forKey: .emailContactFid)
        try container.encodeIfPresent(firstname, forKey: .firstname)
        try container.encodeIfPresent(idUtilisateur, forKey: .idUtilisateur)
        try container.encodeIfPresent(idUtilisateurExterne, forKey: .idUtilisateurExterne)
        try container.encodeIfPresent(inscritNewsletter, forKey: .inscritNewsletter)
        try container.encodeIfPresent(lastname, forKey: .lastname)
        try container.encodeIfPresent(nbReview, forKey: .nbReview)
        try container.encodeIfPresent(numeroMobile, forKey: .numeroMobile)
        try container.encodeIfPresent(numeroMobileVerifie, forKey: .numeroMobileVerifie)
        try container.encodeIfPresent(profil, forKey: .profil)
        try container.encodeIfPresent(pseudo, forKey: .pseudo)
        try container.encodeIfPresent(pseudoEnModeration, forKey: .pseudoEnModeration)
        try container.encodeIfPresent(rate, forKey: .rate)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(urlPhoto, forKey: .urlPhoto)
        try container.encodeIfPresent(urls, forKey: .urls)
        try container.encodeIfPresent(valid, forKey: .valid)
        try container.encodeIfPresent(zip, forKey: .zip)
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? SKRAccount else { return false }
      guard self.age == object.age else { return false }
      guard self.avatarEnModeration == object.avatarEnModeration else { return false }
      guard self.birthdate == object.birthdate else { return false }
      guard self.cgus == object.cgus else { return false }
      guard self.city == object.city else { return false }
      guard self.civility == object.civility else { return false }
      guard self.email == object.email else { return false }
      guard self.emailContactFid == object.emailContactFid else { return false }
      guard self.firstname == object.firstname else { return false }
      guard self.idUtilisateur == object.idUtilisateur else { return false }
      guard self.idUtilisateurExterne == object.idUtilisateurExterne else { return false }
      guard self.inscritNewsletter == object.inscritNewsletter else { return false }
      guard self.lastname == object.lastname else { return false }
      guard self.nbReview == object.nbReview else { return false }
      guard self.numeroMobile == object.numeroMobile else { return false }
      guard self.numeroMobileVerifie == object.numeroMobileVerifie else { return false }
      guard self.profil == object.profil else { return false }
      guard self.pseudo == object.pseudo else { return false }
      guard self.pseudoEnModeration == object.pseudoEnModeration else { return false }
      guard self.rate == object.rate else { return false }
      guard self.status == object.status else { return false }
      guard self.type == object.type else { return false }
      guard self.urlPhoto == object.urlPhoto else { return false }
      guard self.urls == object.urls else { return false }
      guard self.valid == object.valid else { return false }
      guard self.zip == object.zip else { return false }
      return true
    }

    public static func == (lhs: SKRAccount, rhs: SKRAccount) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
