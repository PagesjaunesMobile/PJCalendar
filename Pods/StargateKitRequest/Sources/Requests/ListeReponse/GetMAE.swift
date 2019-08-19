/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.ListeReponse {

    public enum GetMAE {

        public static let service = APIService<Response>(id: "getMAE", tag: "Liste reponse", method: "GET", path: "/getMAE", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Quoi */
                public var what: String?

                /** idLieu */
                public var placeCode: String?

                /** Code Mnemo */
                public var mnemo: String?

                /** Le type : 'B' pour Pro et 'R' pour Particulier */
                public var type: String?

                /** Où */
                public var `where`: String?

                /** Coordonnées X et Y */
                public var coordinates: String?

                /** Recherche à proximité */
                public var proximity: Bool?

                /** Filtre */
                public var filter: String?

                /** Tri */
                public var sort: String?

                /** Everywhere */
                public var everywhere: Bool?

                /** Dénomination */
                public var denom: Bool?

                /** Count */
                public var count: Bool?

                /** Mode */
                public var mode: String?

                /** Index de suggestion */
                public var indexSuggestion: Int?

                /** Type de suggestion */
                public var suggestionType: String?

                /** Date et heure de réservation */
                public var dateHeureReservation: String?

                /** Nombre de personne dans la réservation */
                public var nbPersonnesReservation: String?

                /** Code Mnemo */
                public var mnemos: String

                /** OnePage */
                public var onePage: Bool?

                public init(token: String? = nil, what: String? = nil, placeCode: String? = nil, mnemo: String? = nil, type: String? = nil, `where`: String? = nil, coordinates: String? = nil, proximity: Bool? = nil, filter: String? = nil, sort: String? = nil, everywhere: Bool? = nil, denom: Bool? = nil, count: Bool? = nil, mode: String? = nil, indexSuggestion: Int? = nil, suggestionType: String? = nil, dateHeureReservation: String? = nil, nbPersonnesReservation: String? = nil, mnemos: String, onePage: Bool? = nil) {
                    self.token = token
                    self.what = what
                    self.placeCode = placeCode
                    self.mnemo = mnemo
                    self.type = type
                    self.`where` = `where`
                    self.coordinates = coordinates
                    self.proximity = proximity
                    self.filter = filter
                    self.sort = sort
                    self.everywhere = everywhere
                    self.denom = denom
                    self.count = count
                    self.mode = mode
                    self.indexSuggestion = indexSuggestion
                    self.suggestionType = suggestionType
                    self.dateHeureReservation = dateHeureReservation
                    self.nbPersonnesReservation = nbPersonnesReservation
                    self.mnemos = mnemos
                    self.onePage = onePage
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetMAE.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, what: String? = nil, placeCode: String? = nil, mnemo: String? = nil, type: String? = nil, `where`: String? = nil, coordinates: String? = nil, proximity: Bool? = nil, filter: String? = nil, sort: String? = nil, everywhere: Bool? = nil, denom: Bool? = nil, count: Bool? = nil, mode: String? = nil, indexSuggestion: Int? = nil, suggestionType: String? = nil, dateHeureReservation: String? = nil, nbPersonnesReservation: String? = nil, mnemos: String, onePage: Bool? = nil) {
                let options = Options(token: token, what: what, placeCode: placeCode, mnemo: mnemo, type: type, `where`: `where`, coordinates: coordinates, proximity: proximity, filter: filter, sort: sort, everywhere: everywhere, denom: denom, count: count, mode: mode, indexSuggestion: indexSuggestion, suggestionType: suggestionType, dateHeureReservation: dateHeureReservation, nbPersonnesReservation: nbPersonnesReservation, mnemos: mnemos, onePage: onePage)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let what = options.what {
                  params["what"] = what
                }
                if let placeCode = options.placeCode {
                  params["place_code"] = placeCode
                }
                if let mnemo = options.mnemo {
                  params["mnemo"] = mnemo
                }
                if let type = options.type {
                  params["type"] = type
                }
                if let `where` = options.`where` {
                  params["where"] = `where`
                }
                if let coordinates = options.coordinates {
                  params["coordinates"] = coordinates
                }
                if let proximity = options.proximity {
                  params["proximity"] = proximity
                }
                if let filter = options.filter {
                  params["filter"] = filter
                }
                if let sort = options.sort {
                  params["sort"] = sort
                }
                if let everywhere = options.everywhere {
                  params["everywhere"] = everywhere
                }
                if let denom = options.denom {
                  params["denom"] = denom
                }
                if let count = options.count {
                  params["count"] = count
                }
                if let mode = options.mode {
                  params["mode"] = mode
                }
                if let indexSuggestion = options.indexSuggestion {
                  params["index_suggestion"] = indexSuggestion
                }
                if let suggestionType = options.suggestionType {
                  params["suggestion_type"] = suggestionType
                }
                if let dateHeureReservation = options.dateHeureReservation {
                  params["dateHeureReservation"] = dateHeureReservation
                }
                if let nbPersonnesReservation = options.nbPersonnesReservation {
                  params["nbPersonnesReservation"] = nbPersonnesReservation
                }
                params["mnemos"] = options.mnemos
                if let onePage = options.onePage {
                  params["onePage"] = onePage
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResMAE

            /** OK - successful operation */
            case status200(SKRResMAE)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResMAE? {
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
            public var responseResult: APIResponseResult<SKRResMAE, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResMAE.self, from: data))
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
