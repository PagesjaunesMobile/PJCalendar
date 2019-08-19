/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.BonsPlans {

    public enum GetListBP {

        public static let service = APIService<Response>(id: "getListBP", tag: "Bons plans", method: "GET", path: "/getListBP", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Code établissement */
                public var epj: String

                public init(token: String? = nil, epj: String) {
                    self.token = token
                    self.epj = epj
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetListBP.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, epj: String) {
                let options = Options(token: token, epj: epj)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                params["EPJ"] = options.epj
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResultListBp

            /** OK - successful operation */
            case status200(SKRResultListBp)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResultListBp? {
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
            public var responseResult: APIResponseResult<SKRResultListBp, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResultListBp.self, from: data))
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
