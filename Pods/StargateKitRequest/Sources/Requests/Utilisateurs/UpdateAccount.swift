/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Utilisateurs {

    /**
    Modifier un compte utilisateur

    <b>L'utilisateur doit être connecté au compte.</b></br></br>Exemple = "/updateAccount
    */
    public enum UpdateAccount {

        public static let service = APIService<Response>(id: "updateAccount", tag: "Utilisateurs", method: "POST", path: "/updateAccount", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var token: String?

                /** Pseudo */
                public var pseudo: String?

                /** Code postal */
                public var zip: String?

                /** Prenom */
                public var firstname: String?

                /** Nom */
                public var lastname: String?

                /** Date de naissance */
                public var birthdate: String?

                /** Civilité */
                public var civility: String?

                /** CGU */
                public var cgu: String?

                /** Email */
                public var email: String?

                /** Numéro de mobile */
                public var numeroMobile: String?

                /** Profil */
                public var profil: String?

                /** Origine de création */
                public var parcoursOrigineCreation: String?

                /** Incrit à la newsletter */
                public var inscritNewsletter: String?

                /** Type */
                public var type: String?

                public init(token: String? = nil, pseudo: String? = nil, zip: String? = nil, firstname: String? = nil, lastname: String? = nil, birthdate: String? = nil, civility: String? = nil, cgu: String? = nil, email: String? = nil, numeroMobile: String? = nil, profil: String? = nil, parcoursOrigineCreation: String? = nil, inscritNewsletter: String? = nil, type: String? = nil) {
                    self.token = token
                    self.pseudo = pseudo
                    self.zip = zip
                    self.firstname = firstname
                    self.lastname = lastname
                    self.birthdate = birthdate
                    self.civility = civility
                    self.cgu = cgu
                    self.email = email
                    self.numeroMobile = numeroMobile
                    self.profil = profil
                    self.parcoursOrigineCreation = parcoursOrigineCreation
                    self.inscritNewsletter = inscritNewsletter
                    self.type = type
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: UpdateAccount.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, pseudo: String? = nil, zip: String? = nil, firstname: String? = nil, lastname: String? = nil, birthdate: String? = nil, civility: String? = nil, cgu: String? = nil, email: String? = nil, numeroMobile: String? = nil, profil: String? = nil, parcoursOrigineCreation: String? = nil, inscritNewsletter: String? = nil, type: String? = nil) {
                let options = Options(token: token, pseudo: pseudo, zip: zip, firstname: firstname, lastname: lastname, birthdate: birthdate, civility: civility, cgu: cgu, email: email, numeroMobile: numeroMobile, profil: profil, parcoursOrigineCreation: parcoursOrigineCreation, inscritNewsletter: inscritNewsletter, type: type)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let pseudo = options.pseudo {
                  params["pseudo"] = pseudo
                }
                if let zip = options.zip {
                  params["zip"] = zip
                }
                if let firstname = options.firstname {
                  params["firstname"] = firstname
                }
                if let lastname = options.lastname {
                  params["lastname"] = lastname
                }
                if let birthdate = options.birthdate {
                  params["birthdate"] = birthdate
                }
                if let civility = options.civility {
                  params["civility"] = civility
                }
                if let cgu = options.cgu {
                  params["cgu"] = cgu
                }
                if let email = options.email {
                  params["email"] = email
                }
                if let numeroMobile = options.numeroMobile {
                  params["numeroMobile"] = numeroMobile
                }
                if let profil = options.profil {
                  params["profil"] = profil
                }
                if let parcoursOrigineCreation = options.parcoursOrigineCreation {
                  params["parcours_origine_creation"] = parcoursOrigineCreation
                }
                if let inscritNewsletter = options.inscritNewsletter {
                  params["inscrit_newsletter"] = inscritNewsletter
                }
                if let type = options.type {
                  params["type"] = type
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResAccount

            /** OK */
            case status200(SKRResAccount)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResAccount? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: SKRException? {
                switch self {
                case .status500(let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<SKRResAccount, SKRException> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status500(let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status500: return 500
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status500: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(SKRResAccount.self, from: data))
                case 500: self = try .status500(decoder.decode(SKRException.self, from: data))
                default: throw APIClientError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
