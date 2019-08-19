/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.FicheDetaillee {

    /**
    Récupérer la fiche détaillée d'un professionnel

    Exemple = "/getFD?id=01753191000001C0001
    */
    public enum GetFD {

        public static let service = APIService<Response>(id: "getFD", tag: "Fiche Detaillee", method: "GET", path: "/getFD", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Bloc id */
                public var id: String?

                /** Code activité */
                public var codeAN9: String?

                /** Code établissement */
                public var codeEtab: String?

                /** Code localité */
                public var codeLoc: String?

                /** Type d'établissement */
                public var designationLigne: String?

                /** Display */
                public var display: String?

                /** Client id */
                public var idClient: String?

                /** Pvi id */
                public var idPVI: String?

                /** Statistique Src */
                public var statSrc: String?

                /** Statistique What */
                public var statWhat: String?

                /** Statistique Where */
                public var statWhere: String?

                /** Nombre d'actualités */
                public var nbActus: Int?

                /** Ordonnancement des modules */
                public var ordonnancementFD: String?

                public init(token: String? = nil, id: String? = nil, codeAN9: String? = nil, codeEtab: String? = nil, codeLoc: String? = nil, designationLigne: String? = nil, display: String? = nil, idClient: String? = nil, idPVI: String? = nil, statSrc: String? = nil, statWhat: String? = nil, statWhere: String? = nil, nbActus: Int? = nil, ordonnancementFD: String? = nil) {
                    self.token = token
                    self.id = id
                    self.codeAN9 = codeAN9
                    self.codeEtab = codeEtab
                    self.codeLoc = codeLoc
                    self.designationLigne = designationLigne
                    self.display = display
                    self.idClient = idClient
                    self.idPVI = idPVI
                    self.statSrc = statSrc
                    self.statWhat = statWhat
                    self.statWhere = statWhere
                    self.nbActus = nbActus
                    self.ordonnancementFD = ordonnancementFD
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetFD.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, id: String? = nil, codeAN9: String? = nil, codeEtab: String? = nil, codeLoc: String? = nil, designationLigne: String? = nil, display: String? = nil, idClient: String? = nil, idPVI: String? = nil, statSrc: String? = nil, statWhat: String? = nil, statWhere: String? = nil, nbActus: Int? = nil, ordonnancementFD: String? = nil) {
                let options = Options(token: token, id: id, codeAN9: codeAN9, codeEtab: codeEtab, codeLoc: codeLoc, designationLigne: designationLigne, display: display, idClient: idClient, idPVI: idPVI, statSrc: statSrc, statWhat: statWhat, statWhere: statWhere, nbActus: nbActus, ordonnancementFD: ordonnancementFD)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let id = options.id {
                  params["id"] = id
                }
                if let codeAN9 = options.codeAN9 {
                  params["codeAN9"] = codeAN9
                }
                if let codeEtab = options.codeEtab {
                  params["codeEtab"] = codeEtab
                }
                if let codeLoc = options.codeLoc {
                  params["codeLoc"] = codeLoc
                }
                if let designationLigne = options.designationLigne {
                  params["designationLigne"] = designationLigne
                }
                if let display = options.display {
                  params["display"] = display
                }
                if let idClient = options.idClient {
                  params["idClient"] = idClient
                }
                if let idPVI = options.idPVI {
                  params["idPVI"] = idPVI
                }
                if let statSrc = options.statSrc {
                  params["statSrc"] = statSrc
                }
                if let statWhat = options.statWhat {
                  params["statWhat"] = statWhat
                }
                if let statWhere = options.statWhere {
                  params["statWhere"] = statWhere
                }
                if let nbActus = options.nbActus {
                  params["nbActus"] = nbActus
                }
                if let ordonnancementFD = options.ordonnancementFD {
                  params["ordonnancementFD"] = ordonnancementFD
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResFD

            /** OK */
            case status200(SKRResFD)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResFD? {
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
            public var responseResult: APIResponseResult<SKRResFD, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResFD.self, from: data))
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
