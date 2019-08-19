/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.FicheDetaillee {

    /**
    Récupérer la fiche détaillée de l'orchestrateur fiche détaillée (OCFD).
    */
    public enum GetFicheDetaillee {

        public static let service = APIService<Response>(id: "getFicheDetaillee", tag: "Fiche Detaillee", method: "GET", path: "/fiche-detaillee", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Code établissement */
                public var codeEtab: String?

                /** Bloc id */
                public var blocId: String?

                /** Code rubrique */
                public var codeRubrique: String?

                /** Code localité */
                public var codeLocalite: String?

                /** Type d'établissement */
                public var designationLigne: String?

                /** Ordonnancement des modules */
                public var ordonnancementFD: String?

                public init(token: String? = nil, codeEtab: String? = nil, blocId: String? = nil, codeRubrique: String? = nil, codeLocalite: String? = nil, designationLigne: String? = nil, ordonnancementFD: String? = nil) {
                    self.token = token
                    self.codeEtab = codeEtab
                    self.blocId = blocId
                    self.codeRubrique = codeRubrique
                    self.codeLocalite = codeLocalite
                    self.designationLigne = designationLigne
                    self.ordonnancementFD = ordonnancementFD
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetFicheDetaillee.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, codeEtab: String? = nil, blocId: String? = nil, codeRubrique: String? = nil, codeLocalite: String? = nil, designationLigne: String? = nil, ordonnancementFD: String? = nil) {
                let options = Options(token: token, codeEtab: codeEtab, blocId: blocId, codeRubrique: codeRubrique, codeLocalite: codeLocalite, designationLigne: designationLigne, ordonnancementFD: ordonnancementFD)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let codeEtab = options.codeEtab {
                  params["code_etab"] = codeEtab
                }
                if let blocId = options.blocId {
                  params["bloc_id"] = blocId
                }
                if let codeRubrique = options.codeRubrique {
                  params["code_rubrique"] = codeRubrique
                }
                if let codeLocalite = options.codeLocalite {
                  params["code_localite"] = codeLocalite
                }
                if let designationLigne = options.designationLigne {
                  params["designation_ligne"] = designationLigne
                }
                if let ordonnancementFD = options.ordonnancementFD {
                  params["ordonnancementFD"] = ordonnancementFD
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResFicheDetaillee

            /** OK - successful operation */
            case status200(SKRResFicheDetaillee)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResFicheDetaillee? {
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
            public var responseResult: APIResponseResult<SKRResFicheDetaillee, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResFicheDetaillee.self, from: data))
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
