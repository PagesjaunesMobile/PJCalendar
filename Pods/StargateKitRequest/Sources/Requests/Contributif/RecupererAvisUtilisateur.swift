/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Contributif {

    /**
    Récupérer les avis d'un utilisateur

    <b>L'utilisateur doit être connecté au compte.</b></br></br>Exemple = "/utilisateurs/avis?token=123456789123&pageNum=2
    */
    public enum RecupererAvisUtilisateur {

        public static let service = APIService<Response>(id: "recupererAvisUtilisateur", tag: "Contributif", method: "GET", path: "/utilisateurs/avis", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Nombre de page */
                public var pageNum: Int

                /** Tri */
                public var sort: String?

                /** Id d'un avis */
                public var revId: String?

                /** 'true' pour afficher les avis 'VALIDE', 'false' pour les avis 'REFUSE' et null pour la totalité */
                public var publie: Bool?

                public init(token: String? = nil, pageNum: Int, sort: String? = nil, revId: String? = nil, publie: Bool? = nil) {
                    self.token = token
                    self.pageNum = pageNum
                    self.sort = sort
                    self.revId = revId
                    self.publie = publie
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: RecupererAvisUtilisateur.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, pageNum: Int, sort: String? = nil, revId: String? = nil, publie: Bool? = nil) {
                let options = Options(token: token, pageNum: pageNum, sort: sort, revId: revId, publie: publie)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                params["page_num"] = options.pageNum
                if let sort = options.sort {
                  params["sort"] = sort
                }
                if let revId = options.revId {
                  params["revId"] = revId
                }
                if let publie = options.publie {
                  params["publie"] = publie
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResReviews

            /** OK */
            case status200(SKRResReviews)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResReviews? {
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
            public var responseResult: APIResponseResult<SKRResReviews, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResReviews.self, from: data))
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
