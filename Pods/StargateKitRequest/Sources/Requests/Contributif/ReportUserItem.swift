/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Contributif {

    /**
    Envoyer un signalement d'abus photo, avis, ddr

    <b>L'utilisateur doit être connecté au compte.</b></br></br>Exemple = "/reportUserItem
    */
    public enum ReportUserItem {

        public static let service = APIService<Response>(id: "reportUserItem", tag: "Contributif", method: "POST", path: "/reportUserItem", hasBody: true)

        public final class Request: APIRequest<Response> {

            public struct Options {

                public var token: String?

                /** Code établissement */
                public var codeEtab: String

                /** Id de l'item */
                public var itemId: String

                /** Type de signalement */
                public var type: String?

                /** Reason Id */
                public var reasonId: String

                /** Texte */
                public var text: String?

                public init(token: String? = nil, codeEtab: String, itemId: String, type: String? = nil, reasonId: String, text: String? = nil) {
                    self.token = token
                    self.codeEtab = codeEtab
                    self.itemId = itemId
                    self.type = type
                    self.reasonId = reasonId
                    self.text = text
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: ReportUserItem.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, codeEtab: String, itemId: String, type: String? = nil, reasonId: String, text: String? = nil) {
                let options = Options(token: token, codeEtab: codeEtab, itemId: itemId, type: type, reasonId: reasonId, text: text)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                params["code_etab"] = options.codeEtab
                params["itemId"] = options.itemId
                if let type = options.type {
                  params["type"] = type
                }
                params["reasonId"] = options.reasonId
                if let text = options.text {
                  params["text"] = text
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResReportUserItem

            /** OK */
            case status200(SKRResReportUserItem)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResReportUserItem? {
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
            public var responseResult: APIResponseResult<SKRResReportUserItem, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResReportUserItem.self, from: data))
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
