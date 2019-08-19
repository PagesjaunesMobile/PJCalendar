
| Branch | Badge |
| --- | --- |
| master | [![Build Status](https://app.bitrise.io/app/fcc5a82dfd393824/status.svg?token=1y4NWhWFG5wsyLt3PXl4SQ&branch=master)](https://app.bitrise.io/app/fcc5a82dfd393824) |
| develop | [![Build Status](https://app.bitrise.io/app/fcc5a82dfd393824/status.svg?token=1y4NWhWFG5wsyLt3PXl4SQ&branch=develop)](https://app.bitrise.io/app/fcc5a82dfd393824) |

# StargateKitCore

## Deploiment

Il faut que le code soit sur la branche master pour deployer.

## Description

Represente la librarie réseau qui gère le StargateKit.

## Example

```swift
import UIKit
import StargateKitCore

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    StargateClient.appendRequestParameter(queryItems: [
      URLQueryItem(name: "xtor", value: "600-CS-3"),
      URLQueryItem(name: "pokemon", value: "pikachu")
      ])
    StargateClient.setServer(.prod_HTTPS)
    getLR(what: "Restaurant", where: "Lyon")
    sleep(3)
    StargateClient.removeAllRequestParameter()
    getFD(epj: "12166903")
  }

  func getFD(epj: String) {
    let getFDRequest : StargateKitRequest.FicheDetaillee.GetFicheDetaillee.Request = StargateKitRequest.FicheDetaillee.GetFicheDetaillee.Request(codeEtab: epj)
    let cancelID = StargateClient.makeRequest(request: getFDRequest) { (apiResponse : APIResponse<StargateKitRequest.FicheDetaillee.GetFicheDetaillee.Response>) in
      switch apiResponse.result {
      case let .success(apiResponseResult):
        if let success = apiResponseResult.success {
          print(success)
        } else if let failure = apiResponseResult.failure {
          print(failure)
        }
      case let .failure(apiResponseError):
        print(apiResponseError)
      }
      print(apiResponse)
    }
    StargateClient.cancelRequest(cancelID)
  }

  func getLR(what: String, where ou: String) {
    let getLRRequest : StargateKitRequest.ListeReponse.GetLR.Request = StargateKitRequest.ListeReponse.GetLR.Request(what: what, where: ou)
    let cancelID = StargateClient.makeRequest(request: getLRRequest) { (apiResponse : APIResponse<StargateKitRequest.ListeReponse.GetLR.Response>) in
      switch apiResponse.result {
      case let .success(apiResponseResult):
        if let success = apiResponseResult.success {
          print(success)
        } else if let failure = apiResponseResult.failure {
          print(failure)
        }
      case let .failure(apiResponseError):
        print(apiResponseError)
      }
      print(apiResponse)
    }
    // StargateClient.cancelRequest(cancelID)
  }
}
```

## Installation

StargateKitCore is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'StargateKitCore'
```

## Author

Jeffrey Macko, jmacko.externe@pagesjaunes.fr

## License

StargateKitCore is available under the MIT license. See the LICENSE file for more info.
