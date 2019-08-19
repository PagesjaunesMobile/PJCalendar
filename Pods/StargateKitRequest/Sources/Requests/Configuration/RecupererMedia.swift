/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Configuration {

    /**
    Récupérer la liste des images de l'application

    Exemple = "/conf/media
    */
    public enum RecupererMedia {

        public static let service = APIService<Response>(id: "recupererMedia", tag: "Configuration", method: "GET", path: "/conf/media", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Type d'OS */
                public var os: String

                /** Type de device */
                public var device: String

                public init(os: String, device: String) {
                    self.os = os
                    self.device = device
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: RecupererMedia.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(os: String, device: String) {
                let options = Options(os: os, device: device)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["os"] = options.os
                params["device"] = options.device
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResMedia

            /** OK */
            case status200(SKRResMedia)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResMedia? {
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
            public var responseResult: APIResponseResult<SKRResMedia, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResMedia.self, from: data))
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
