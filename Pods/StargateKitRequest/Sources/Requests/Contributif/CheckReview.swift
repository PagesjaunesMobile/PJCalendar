/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Contributif {

    /**
    Vérifier si l'utilisateur peut déposer un avis sur un professionnel donné

    <b>L'utilisateur doit être connecté au compte.</b></br></br>Exemple = "/checkReview
    */
    public enum CheckReview {

        public static let service = APIService<Response>(id: "checkReview", tag: "Contributif", method: "GET", path: "/checkReview", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Code établissement */
                public var etabCode: String

                /** Code activité */
                public var actCode: String

                /** Code localité */
                public var cityId: String?

                public init(token: String? = nil, etabCode: String, actCode: String, cityId: String? = nil) {
                    self.token = token
                    self.etabCode = etabCode
                    self.actCode = actCode
                    self.cityId = cityId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: CheckReview.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, etabCode: String, actCode: String, cityId: String? = nil) {
                let options = Options(token: token, etabCode: etabCode, actCode: actCode, cityId: cityId)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                params["etab_code"] = options.etabCode
                params["act_code"] = options.actCode
                if let cityId = options.cityId {
                  params["cityId"] = cityId
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
