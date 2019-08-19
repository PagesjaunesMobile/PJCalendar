/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

/** Orchestrateur Stargate : back office mobile */
public struct StargateKitRequest {

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = true

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = true

    public static let version = "1.0-20190717104426"

    public enum Actualites {}
    public enum BonsPlans {}
    public enum Cartographie {}
    public enum Configuration {}
    public enum Contributif {}
    public enum Favoris {}
    public enum FicheDetaillee {}
    public enum ListeReponse {}
    public enum Pvi {}
    public enum RechercheGeographique {}
    public enum RechercheInverse {}
    public enum Session {}
    public enum Transactionnel {}
    public enum Utilisateurs {}

}
