//
//  UIImage+KitUI.swift
//  KitUI
//
//  Created by Jeffrey Macko on 17/04/2018.
//  Copyright © 2018 PagesJaunes. All rights reserved.
//


import Foundation
import UIKit
import CoreGraphics

extension UIImage {

  public func render(size assetSize : KitUIAssetSize, color : UIColor = PJColor(.bluePJ), disableScale : Bool = false) -> UIImage {
    return self.render(size: assetSize.size, color : color)
  }

  public func render(size assetSize : CGSize, color : UIColor = PJColor(.bluePJ), disableScale : Bool = false) -> UIImage {
    let image = self.withRenderingMode(.alwaysTemplate)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(origin: CGPoint.zero, size: assetSize)
    imageView.tintColor = color
    return imageView.asImage()
  }
}
extension UIImage {

  static public func resize(imageNamed: String, size assetSize : KitUIAssetSize, color : UIColor = PJColor(.bluePJ), disableScale : Bool = false) -> UIImage? {
    guard let image = UIImage(named: imageNamed)?.withRenderingMode(.alwaysTemplate) else { return nil }
    return image.render(size: assetSize.size, color : color, disableScale: disableScale)
  }

  static public func resize(_ image: UIImage, size assetSize : KitUIAssetSize, color : UIColor = PJColor(.bluePJ), disableScale : Bool = false) -> UIImage {

    if image.renderingMode != .alwaysTemplate {
      print("🤪🤪🤪🤪🤪\nL'image doit etre vectoriel c'est a dire single scale + preserve vector data + rendering template pour que cela fonctionne.\n🤩🤩🤩🤩🤩")
      return UIImage.image(with: .clear)
    }

    return image.render(size: assetSize.size, color : color, disableScale : disableScale)
  }

}

extension UIImage {

  /// Return an 1x1 pixel UIImage with the given color
  /// Usefull for when you need to use an "empty" or "invisible" image somewhere
  @objc (imageWithColor:)
  static public func image(with color: UIColor) -> UIImage {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 1))
    view.backgroundColor = color
    return view.asImage()
  }
}

// MARK: -

extension UIImage {
  
  
  /// Return an Image with background draw by a layer
  ///
  /// - Parameters:
  ///   - asset: image
  ///   - imageSize: image size within the rendering
  ///   - imageColor: image color
  ///   - layer: shape layer of the background
  ///   - boundRect: CGSize on the final image
  /// - Returns: Generated UIImage
  @objc static public func generateImage(image : UIImage,
                                         ofSize imageSize : CGSize,
                                         withColor imageColor : UIColor? = nil,
                                         onLayer layer : CAShapeLayer,
                                         inRect boundRect : CGSize) -> UIImage? {
    
    let imageView = UIImageView(image: image)
    if let localColor = imageColor  { imageView.tintColor = localColor }
    imageView.frame.size = imageSize
    imageView.frame.origin = CGPoint(x: (boundRect.width / 2) - (imageSize.width / 2),
                                     y: (boundRect.height / 2) - (imageSize.height / 2))
    
    layer.addSublayer(imageView.layer)
    layer.masksToBounds = true
    
    let renderer = UIGraphicsImageRenderer(bounds: CGRect(origin: .zero, size: boundRect))
    return renderer.image { rendererContext in
      layer.render(in: rendererContext.cgContext)
    }
  }
  
  
  /// Return an Image with background color in a Circle
  ///
  /// - Parameters:
  ///   - name: image
  ///   - imageSize: image size within the rendering
  ///   - imageColor: image color
  ///   - backgroundColor: background color
  ///   - boundRect: CGSize on the final image
  ///   - withBorderInfo: Optional border info
  /// - Returns: Generated UIImage
  static public func generateImageWithCircleBackgroundLayer(image : UIImage,
                                                            ofSize imageSize : CGSize,
                                                            withColor imageColor : UIColor? = nil,
                                                            withBackgroundColor backgroundColor : UIColor,
                                                            inRect boundRect : CGSize,
                                                            withBorderInfo borderInfo : KitUIBorderInfo? = nil) -> UIImage? {
    

    let size       = CGSize(width: boundRect.width, height: boundRect.height)
    let layerBound = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
    let layer      = CAShapeLayer()
    let path       = UIBezierPath(ovalIn: layerBound).cgPath
    
    layer.bounds    = layerBound
    layer.path      = path
    layer.fillColor = backgroundColor.cgColor
    
    if let border = borderInfo {
      let halfSize:CGFloat = min(layer.bounds.size.width/2, layer.bounds.size.height/2)
      let desiredLineWidth:CGFloat = border.lineWidth
      
      let borderPath = UIBezierPath(
        arcCenter: CGPoint(x:halfSize,y:halfSize),
        radius: CGFloat( halfSize - (desiredLineWidth/2) ),
        startAngle: CGFloat(0),
        endAngle:CGFloat(Double.pi * 2),
        clockwise: true)
      
      layer.addBorder(withBorderInfo: border, frameSize: size, path: borderPath.cgPath)
    }

    return UIImage.generateImage(image: image,
                                 ofSize: imageSize,
                                 withColor: imageColor,
                                 onLayer: layer,
                                 inRect: boundRect)
    
  }
  
  /// Return an Image with background color in a Square
  ///
  /// - Parameters:
  ///   - name: image
  ///   - imageSize: image size within the rendering
  ///   - imageColor: image color
  ///   - backgroundColor: background color
  ///   - boundRect: CGSize on the final image
  ///   - withBorderInfo: Optional border info
  /// - Returns: Generated UIImage
  static public func generateImageWithSquareBackgroundLayer(image : UIImage,
                                                            ofSize imageSize : CGSize,
                                                            withColor imageColor : UIColor? = nil,
                                                            withBackgroundColor backgroundColor : UIColor,
                                                            inRect boundRect : CGSize,
                                                            cornerRadius : CGFloat = 0,
                                                            withBorderInfo borderInfo: KitUIBorderInfo? = nil) -> UIImage? {
    
    let layer = CAShapeLayer()
    let path = UIBezierPath(rect: CGRect(origin: CGPoint.zero, size: boundRect)).cgPath
    layer.bounds = CGRect(origin: CGPoint.zero, size: boundRect)
    layer.path = path
    layer.fillColor = backgroundColor.cgColor
    layer.cornerRadius = cornerRadius

    if let border = borderInfo {
      layer.addBorder(withBorderInfo: border, frameSize: boundRect, path: path)
    }
    
    
    return UIImage.generateImage(image: image,
                                 ofSize: imageSize,
                                 withColor: imageColor,
                                 onLayer: layer,
                                 inRect: boundRect)
  }
  
  
  /// Genere une image resizer correctement
  ///
  /// - Parameters:
  ///   - named: nom de l'image
  ///   - size: taille attendu de l'image
  ///   - renderingMode: si on veut render un template
  ///   - color: si on veut surcharger la couleur
  /// - Returns: Image generer
  @objc static public func resizeImage(named: String,
                                       size: CGSize,
                                       color : UIColor? = nil) -> UIImage? {
    let renderingMode : UIImage.RenderingMode = (color == nil) ? .alwaysOriginal : .alwaysTemplate
    guard let image = UIImage(named: named)?.withRenderingMode(renderingMode) else { return nil }
    
    let imageView = UIImageView(image: image)
    imageView.frame = CGRect(origin: CGPoint.zero, size: size)
    if let color = color {
      imageView.tintColor = color
    }
    return imageView.asImage()
  }
  
  /// Genere une image resizer correctement
  ///
  /// - Parameters:
  ///   - named: nom de l'image
  ///   - size: taille attendu de l'image
  ///   - renderingMode: si on veut render un template
  ///   - color: si on veut surcharger la couleur
  /// - Returns: Image generer
  @objc static public func resizeImage(image: UIImage,
                                       size: CGSize,
                                       color : UIColor? = nil) -> UIImage {
    let renderingMode : UIImage.RenderingMode = (color == nil) ? .alwaysOriginal : .alwaysTemplate
    let image = image.withRenderingMode(renderingMode)
    let imageView = UIImageView(image: image)
    
    imageView.frame = CGRect(origin: CGPoint.zero, size: size)
    if let color = color {
      imageView.tintColor = color
    }
    return imageView.asImage()
  }
}

