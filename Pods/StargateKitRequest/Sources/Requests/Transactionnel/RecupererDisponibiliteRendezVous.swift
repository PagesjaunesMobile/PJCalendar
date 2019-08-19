/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

extension StargateKitRequest.Transactionnel {

    /**
    Récupérer les informations nécessaire à la finalisation d'un rdv : service (opt), catégorie (opt), intervention, agenda, et créneau de disponibilité

    Exemple = "/rendezvous/disponibilite?etab_code=01234567&typeTransactionnel=SANTE&goto=CATEGORY
    */
    public enum RecupererDisponibiliteRendezVous {

        public static let service = APIService<Response>(id: "recupererDisponibiliteRendezVous", tag: "Transactionnel", method: "GET", path: "/rendezvous/disponibilite", hasBody: false)

        /** Aller à */
        public enum SKRGoto: String, Codable, Hashable, CaseIterable {
            case services = "SERVICES"
            case category = "CATEGORY"
            case availability = "AVAILABILITY"
            case intervention = "INTERVENTION"
            case calendar = "CALENDAR"
            case resume = "RESUME"
            case fichePatient = "FICHE_PATIENT"
        }

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** Token */
                public var token: String?

                /** Type de transactionnel */
                public var typeTransactionnel: String?

                /** Code établissement */
                public var etabCode: String

                /** Service Id */
                public var serviceId: String?

                /** Categorie Id */
                public var categId: String?

                /** Calendrier Id */
                public var calendId: String?

                /** Intervention Id */
                public var intervId: String?

                /** Groupe Id */
                public var groupeId: String?

                /** Aller à */
                public var goto: SKRGoto?

                /** L'étape */
                public var landingStep: String?

                /** Période de recherche */
                public var period: String?

                /** Date de début de période */
                public var sdtime: String?

                /** Date et horaire choisie */
                public var dtime: String?

                public init(token: String? = nil, typeTransactionnel: String? = nil, etabCode: String, serviceId: String? = nil, categId: String? = nil, calendId: String? = nil, intervId: String? = nil, groupeId: String? = nil, goto: SKRGoto? = nil, landingStep: String? = nil, period: String? = nil, sdtime: String? = nil, dtime: String? = nil) {
                    self.token = token
                    self.typeTransactionnel = typeTransactionnel
                    self.etabCode = etabCode
                    self.serviceId = serviceId
                    self.categId = categId
                    self.calendId = calendId
                    self.intervId = intervId
                    self.groupeId = groupeId
                    self.goto = goto
                    self.landingStep = landingStep
                    self.period = period
                    self.sdtime = sdtime
                    self.dtime = dtime
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: RecupererDisponibiliteRendezVous.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(token: String? = nil, typeTransactionnel: String? = nil, etabCode: String, serviceId: String? = nil, categId: String? = nil, calendId: String? = nil, intervId: String? = nil, groupeId: String? = nil, goto: SKRGoto? = nil, landingStep: String? = nil, period: String? = nil, sdtime: String? = nil, dtime: String? = nil) {
                let options = Options(token: token, typeTransactionnel: typeTransactionnel, etabCode: etabCode, serviceId: serviceId, categId: categId, calendId: calendId, intervId: intervId, groupeId: groupeId, goto: goto, landingStep: landingStep, period: period, sdtime: sdtime, dtime: dtime)
                self.init(options: options)
            }

            public override var parameters: [String: Any] {
                var params: [String: Any] = [:]
                if let token = options.token {
                  params["token"] = token
                }
                if let typeTransactionnel = options.typeTransactionnel {
                  params["type_transactionnel"] = typeTransactionnel
                }
                params["etab_code"] = options.etabCode
                if let serviceId = options.serviceId {
                  params["service_id"] = serviceId
                }
                if let categId = options.categId {
                  params["categ_id"] = categId
                }
                if let calendId = options.calendId {
                  params["calend_id"] = calendId
                }
                if let intervId = options.intervId {
                  params["interv_id"] = intervId
                }
                if let groupeId = options.groupeId {
                  params["groupe_id"] = groupeId
                }
                if let goto = options.goto?.encode() {
                  params["goto"] = goto
                }
                if let landingStep = options.landingStep {
                  params["landingStep"] = landingStep
                }
                if let period = options.period {
                  params["period"] = period
                }
                if let sdtime = options.sdtime {
                  params["sdtime"] = sdtime
                }
                if let dtime = options.dtime {
                  params["dtime"] = dtime
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = SKRResDispoSante

            /** OK */
            case status200(SKRResDispoSante)

            /** Internal Server Error */
            case status500(SKRException)

            public var success: SKRResDispoSante? {
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
            public var responseResult: APIResponseResult<SKRResDispoSante, SKRException> {
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
                case 200: self = try .status200(decoder.decode(SKRResDispoSante.self, from: data))
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
