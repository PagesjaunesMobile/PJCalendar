/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Session {

    /**
    Récupérer une session client

    Exemple = "/getSession
    */
    public enum GetSession {

        public static let service = APIService<Response>(id: "getSession", tag: "Session", method: "GET", path: "/getSession", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Identifiant client (profil : PROD_ANDROID_UNIV, PROD_IOS_UNIV) */
                public var idClient: String

                public var typeClient: String?

                public var provider: String?

                public var partner: String?

                public var device: String?

                public var os: String?

                public var osVersion: String?

                public var clientVersion: String?

                /** Identifiant de la session */
                public var uuId: String

                public var browser: String?

                public var portal: String?

                public var codeAladin: String?

                public var lsv: String?

                public var screen: String?

                public var protocolVersion: String?

                public var pushAppId: String?

                public var codeMCC: String?

                public var codeMNC: String?

                public var model: String?

                public var coordinates: String?

                public var echo: String?

                /** Le timestamp (ex : 20181108104958) */
                public var timeStamp: String

                /** L'encodage de plusieurs valeurs (idclient, uuid, timestamp, etc ...) */
                public var key: String

                public var ffKeys: String?

                public var deviceID: String?

                public var optout: String?

                public init(idClient: String, typeClient: String? = nil, provider: String? = nil, partner: String? = nil, device: String? = nil, os: String? = nil, osVersion: String? = nil, clientVersion: String? = nil, uuId: String, browser: String? = nil, portal: String? = nil, codeAladin: String? = nil, lsv: String? = nil, screen: String? = nil, protocolVersion: String? = nil, pushAppId: String? = nil, codeMCC: String? = nil, codeMNC: String? = nil, model: String? = nil, coordinates: String? = nil, echo: String? = nil, timeStamp: String, key: String, ffKeys: String? = nil, deviceID: String? = nil, optout: String? = nil) {
                    self.idClient = idClient
                    self.typeClient = typeClient
                    self.provider = provider
                    self.partner = partner
                    self.device = device
                    self.os = os
                    self.osVersion = osVersion
                    self.clientVersion = clientVersion
                    self.uuId = uuId
                    self.browser = browser
                    self.portal = portal
                    self.codeAladin = codeAladin
                    self.lsv = lsv
                    self.screen = screen
                    self.protocolVersion = protocolVersion
                    self.pushAppId = pushAppId
                    self.codeMCC = codeMCC
                    self.codeMNC = codeMNC
                    self.model = model
                    self.coordinates = coordinates
                    self.echo = echo
                    self.timeStamp = timeStamp
                    self.key = key
                    self.ffKeys = ffKeys
                    self.deviceID = deviceID
                    self.optout = optout
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetSession.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(idClient: String, typeClient: String? = nil, provider: String? = nil, partner: String? = nil, device: String? = nil, os: String? = nil, osVersion: String? = nil, clientVersion: String? = nil, uuId: String, browser: String? = nil, portal: String? = nil, codeAladin: String? = nil, lsv: String? = nil, screen: String? = nil, protocolVersion: String? = nil, pushAppId: String? = nil, codeMCC: String? = nil, codeMNC: String? = nil, model: String? = nil, coordinates: String? = nil, echo: String? = nil, timeStamp: String, key: String, ffKeys: String? = nil, deviceID: String? = nil, optout: String? = nil) {
                let options = Options(idClient: idClient, typeClient: typeClient, provider: provider, partner: partner, device: device, os: os, osVersion: osVersion, clientVersion: clientVersion, uuId: uuId, browser: browser, portal: portal, codeAladin: codeAladin, lsv: lsv, screen: screen, protocolVersion: protocolVersion, pushAppId: pushAppId, codeMCC: codeMCC, codeMNC: codeMNC, model: model, coordinates: coordinates, echo: echo, timeStamp: timeStamp, key: key, ffKeys: ffKeys, deviceID: deviceID, optout: optout)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                params["idClient"] = options.idClient
                if let typeClient = options.typeClient {
                  params["typeClient"] = typeClient
                }
                if let provider = options.provider {
                  params["provider"] = provider
                }
                if let partner = options.partner {
                  params["partner"] = partner
                }
                if let device = options.device {
                  params["device"] = device
                }
                if let os = options.os {
                  params["os"] = os
                }
                if let osVersion = options.osVersion {
                  params["osVersion"] = osVersion
                }
                if let clientVersion = options.clientVersion {
                  params["clientVersion"] = clientVersion
                }
                params["uuId"] = options.uuId
                if let browser = options.browser {
                  params["browser"] = browser
                }
                if let portal = options.portal {
                  params["portal"] = portal
                }
                if let codeAladin = options.codeAladin {
                  params["codeAladin"] = codeAladin
                }
                if let lsv = options.lsv {
                  params["lsv"] = lsv
                }
                if let screen = options.screen {
                  params["screen"] = screen
                }
                if let protocolVersion = options.protocolVersion {
                  params["protocolVersion"] = protocolVersion
                }
                if let pushAppId = options.pushAppId {
                  params["pushAppId"] = pushAppId
                }
                if let codeMCC = options.codeMCC {
                  params["codeMCC"] = codeMCC
                }
                if let codeMNC = options.codeMNC {
                  params["codeMNC"] = codeMNC
                }
                if let model = options.model {
                  params["model"] = model
                }
                if let coordinates = options.coordinates {
                  params["coordinates"] = coordinates
                }
                if let echo = options.echo {
                  params["echo"] = echo
                }
                params["timeStamp"] = options.timeStamp
                params["key"] = options.key
                if let ffKeys = options.ffKeys {
                  params["ffKeys"] = ffKeys
                }
                if let deviceID = options.deviceID {
                  params["deviceID"] = deviceID
                }
                if let optout = options.optout {
                  params["optout"] = optout
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResSession

            /** OK */
            case status200(SKRResSession)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResSession? {
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
            public var responseResult: APIResponseResult<SKRResSession, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResSession.self, from: data))
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
