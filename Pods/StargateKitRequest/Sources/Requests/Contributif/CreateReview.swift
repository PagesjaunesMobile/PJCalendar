/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Contributif {

    /**
    Créer un avis

    <b>L'utilisateur doit être connecté au compte.</b></br></br>Exemple = "/createReview2
    */
    public enum CreateReview {

        public static let service = APIService<Response>(id: "createReview", tag: "Contributif", method: "POST", path: "/createReview2", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var token: String?

                /** Code localité */
                public var cityId: String

                /** Code établissement */
                public var etabCode: String

                /** Code activité */
                public var actCode: String

                /** Titre de l'avis */
                public var title: String?

                /** Commentaire */
                public var comment: String

                /** pos */
                public var pos: String?

                /** neg */
                public var neg: String?

                /** Note globale */
                public var rate: String

                /** Détails des notes */
                public var notation: String?

                /** Date de début d'expérience */
                public var xpSDate: String

                /** Date de fin d'expérience */
                public var xpEDate: String?

                /** Preuve (image) */
                public var pi64Ct: String?

                /** Origine solicitation */
                public var origSollicitation: String?

                /** Callback solicitation */
                public var callbackSollicitation: String?

                public init(token: String? = nil, cityId: String, etabCode: String, actCode: String, title: String? = nil, comment: String, pos: String? = nil, neg: String? = nil, rate: String, notation: String? = nil, xpSDate: String, xpEDate: String? = nil, pi64Ct: String? = nil, origSollicitation: String? = nil, callbackSollicitation: String? = nil) {
                    self.token = token
                    self.cityId = cityId
                    self.etabCode = etabCode
                    self.actCode = actCode
                    self.title = title
                    self.comment = comment
                    self.pos = pos
                    self.neg = neg
                    self.rate = rate
                    self.notation = notation
                    self.xpSDate = xpSDate
                    self.xpEDate = xpEDate
                    self.pi64Ct = pi64Ct
                    self.origSollicitation = origSollicitation
                    self.callbackSollicitation = callbackSollicitation
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: CreateReview.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, cityId: String, etabCode: String, actCode: String, title: String? = nil, comment: String, pos: String? = nil, neg: String? = nil, rate: String, notation: String? = nil, xpSDate: String, xpEDate: String? = nil, pi64Ct: String? = nil, origSollicitation: String? = nil, callbackSollicitation: String? = nil) {
                let options = Options(token: token, cityId: cityId, etabCode: etabCode, actCode: actCode, title: title, comment: comment, pos: pos, neg: neg, rate: rate, notation: notation, xpSDate: xpSDate, xpEDate: xpEDate, pi64Ct: pi64Ct, origSollicitation: origSollicitation, callbackSollicitation: callbackSollicitation)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                params["cityId"] = options.cityId
                params["etab_code"] = options.etabCode
                params["act_code"] = options.actCode
                if let title = options.title {
                  params["title"] = title
                }
                params["comment"] = options.comment
                if let pos = options.pos {
                  params["pos"] = pos
                }
                if let neg = options.neg {
                  params["neg"] = neg
                }
                params["rate"] = options.rate
                if let notation = options.notation {
                  params["notation"] = notation
                }
                params["xpSDate"] = options.xpSDate
                if let xpEDate = options.xpEDate {
                  params["xpEDate"] = xpEDate
                }
                if let pi64Ct = options.pi64Ct {
                  params["pi64Ct"] = pi64Ct
                }
                if let origSollicitation = options.origSollicitation {
                  params["orig_sollicitation"] = origSollicitation
                }
                if let callbackSollicitation = options.callbackSollicitation {
                  params["callback_sollicitation"] = callbackSollicitation
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResCR

            /** OK */
            case status200(SKRResCR)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResCR? {
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
            public var responseResult: APIResponseResult<SKRResCR, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResCR.self, from: data))
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
