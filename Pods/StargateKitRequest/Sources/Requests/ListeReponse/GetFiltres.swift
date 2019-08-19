/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.ListeReponse {

    /**
    Récupérer la liste des filtres applicables à la recherche

    Exemple = "/getFiltres
    */
    public enum GetFiltres {

        public static let service = APIService<Response>(id: "getFiltres", tag: "Liste reponse", method: "GET", path: "/getFiltres", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Contexte Id */
                public var ctxId: String

                /** Filtre */
                public var filter: String?

                /** Tri */
                public var sort: String?

                public init(token: String? = nil, ctxId: String, filter: String? = nil, sort: String? = nil) {
                    self.token = token
                    self.ctxId = ctxId
                    self.filter = filter
                    self.sort = sort
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetFiltres.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, ctxId: String, filter: String? = nil, sort: String? = nil) {
                let options = Options(token: token, ctxId: ctxId, filter: filter, sort: sort)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                params["ctx_id"] = options.ctxId
                if let filter = options.filter {
                  params["filter"] = filter
                }
                if let sort = options.sort {
                  params["sort"] = sort
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResFiltre

            /** OK */
            case status200(SKRResFiltre)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResFiltre? {
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
            public var responseResult: APIResponseResult<SKRResFiltre, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResFiltre.self, from: data))
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
