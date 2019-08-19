/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Utilisateurs {

    /**
    Connexion / Déconnexion au compte utilisateur

    Exemple = "/synConnect
    */
    public enum SynConnect {

        public static let service = APIService<Response>(id: "synConnect", tag: "Utilisateurs", method: "POST", path: "/synConnect", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var token: String?

                /** Id gigya de l'utilisateur (uid) */
                public var uid: String?

                /** Connexion */
                public var cnx: String?

                /** Uids */
                public var uidS: String?

                /** Timestamp */
                public var sts: String?

                /** Type de connexion */
                public var type: String?

                /** Profil */
                public var profil: String?

                public init(token: String? = nil, uid: String? = nil, cnx: String? = nil, uidS: String? = nil, sts: String? = nil, type: String? = nil, profil: String? = nil) {
                    self.token = token
                    self.uid = uid
                    self.cnx = cnx
                    self.uidS = uidS
                    self.sts = sts
                    self.type = type
                    self.profil = profil
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: SynConnect.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, uid: String? = nil, cnx: String? = nil, uidS: String? = nil, sts: String? = nil, type: String? = nil, profil: String? = nil) {
                let options = Options(token: token, uid: uid, cnx: cnx, uidS: uidS, sts: sts, type: type, profil: profil)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let uid = options.uid {
                  params["uid"] = uid
                }
                if let cnx = options.cnx {
                  params["cnx"] = cnx
                }
                if let uidS = options.uidS {
                  params["uidS"] = uidS
                }
                if let sts = options.sts {
                  params["sts"] = sts
                }
                if let type = options.type {
                  params["type"] = type
                }
                if let profil = options.profil {
                  params["profil"] = profil
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
