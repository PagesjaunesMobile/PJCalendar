/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */

import Foundation

@available(iOS 10.0, *)
extension StargateClient {
  public enum Server : String, RawRepresentable, CaseIterable, Equatable {
    case orcpjCD_HTTPS = "https://orcpj.cd.pagesjaunes.fr/orchestrateur-stargate-1"
    case prod_HTTP = "http://uiphone-sg.mob.pagesjaunes.fr/CI118"
    case prod_HTTPS = "https://uiphone-sg.mob.pagesjaunes.fr/CI118"
    case rbulliard_HTTP = "http://10.92.67.83:8080/orchestrateur-stargate-1"
    case relmanti_HTTP = "http://10.92.67.69:8080/orchestrateur-stargate-1"
    case sgmobCD_HTTP = "http://sgmob.cd.pagesjaunes.fr/CI118"
    case sgmobCD_HTTPS = "https://sgmob.cd.pagesjaunes.fr/CI118"
    case sierra_HTTP = "http://192.168.48.153/CI118"
    case bbm_HTTPS = "https://bbm.cd.pagesjaunes.fr:5000/stargate"
    case gcloudHD_HTTPS = "https://sgcloud.cd.pagesjaunes.fr/CI118"
    case direct_HTTP = "http://varnish-orcs-in.k8s.staging.internal/orchestrateur-stargate-1"
    case solocalMobile_HTTP = "http://orcs-nocache.k8s.staging.internal/orchestrateur-stargate-1"
    case gcpProd_HTTPS = "https://sgcloud.mob.pagesjaunes.fr/CI118"
  }
}
