/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */



import UIKit

public protocol LoadingViewProtocol: class {

  var loadingDelegate: UIViewController? { get }
  var loadingViewContainer: LoadingViewContainer { get }

  func showsLoadingView()
  func removeLoadingView()
}

public extension LoadingViewProtocol {

  func showsLoadingView() {
    loadingDelegate?.view.addSubview(loadingViewContainer)
  }

  func removeLoadingView() {
    loadingViewContainer.removeFromSuperview()
  }
}


