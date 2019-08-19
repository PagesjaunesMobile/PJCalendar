/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.BonsPlans {

    public enum GetBP {

        public static let service = APIService<Response>(id: "getBP", tag: "Bons plans", method: "GET", path: "/getBP", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Id Client */
                public var idClient: String?

                /** Id du Bon Plan */
                public var idBp: String

                /** Code établissement */
                public var idEpj: String?

                /** Code activité */
                public var actCode: String?

                /** Code de la commune */
                public var cityId: String?

                /** Id du Portail */
                public var idPortail: String?

                /** Bloc id */
                public var blockId: String?

                /** InfoPro */
                public var infoPro: String?

                /** Id PVI */
                public var idPVI: String?

                public init(token: String? = nil, idClient: String? = nil, idBp: String, idEpj: String? = nil, actCode: String? = nil, cityId: String? = nil, idPortail: String? = nil, blockId: String? = nil, infoPro: String? = nil, idPVI: String? = nil) {
                    self.token = token
                    self.idClient = idClient
                    self.idBp = idBp
                    self.idEpj = idEpj
                    self.actCode = actCode
                    self.cityId = cityId
                    self.idPortail = idPortail
                    self.blockId = blockId
                    self.infoPro = infoPro
                    self.idPVI = idPVI
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetBP.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, idClient: String? = nil, idBp: String, idEpj: String? = nil, actCode: String? = nil, cityId: String? = nil, idPortail: String? = nil, blockId: String? = nil, infoPro: String? = nil, idPVI: String? = nil) {
                let options = Options(token: token, idClient: idClient, idBp: idBp, idEpj: idEpj, actCode: actCode, cityId: cityId, idPortail: idPortail, blockId: blockId, infoPro: infoPro, idPVI: idPVI)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let idClient = options.idClient {
                  params["idClient"] = idClient
                }
                params["id_bp"] = options.idBp
                if let idEpj = options.idEpj {
                  params["id_epj"] = idEpj
                }
                if let actCode = options.actCode {
                  params["actCode"] = actCode
                }
                if let cityId = options.cityId {
                  params["cityId"] = cityId
                }
                if let idPortail = options.idPortail {
                  params["id_portail"] = idPortail
                }
                if let blockId = options.blockId {
                  params["blockId"] = blockId
                }
                if let infoPro = options.infoPro {
                  params["infoPro"] = infoPro
                }
                if let idPVI = options.idPVI {
                  params["idPVI"] = idPVI
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResult

            /** OK - successful operation */
            case status200(SKRResult)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResult? {
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
            public var responseResult: APIResponseResult<SKRResult, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResult.self, from: data))
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
