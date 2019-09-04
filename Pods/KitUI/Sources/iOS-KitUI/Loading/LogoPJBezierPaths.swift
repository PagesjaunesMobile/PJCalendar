/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */


import UIKit

public struct LogoPJBezierPaths {

  // Default Color of the PJ Logo
  static let defaultLogoColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

  // This Shapes are drawn into a Bounds of 100*100 px
  // Bezier Path of the entire PJ Logo
  static var logoPJ : UIBezierPath {
    get {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 99.52, y: 139.86))
      path.addCurve(to: CGPoint(x: 92.32, y: 131.42), controlPoint1: CGPoint(x: 95.5, y: 139.86), controlPoint2: CGPoint(x: 92.32, y: 136.13))
      path.addLine(to: CGPoint(x: 92.32, y: 122.17))
      path.addCurve(to: CGPoint(x: 99.52, y: 113.72), controlPoint1: CGPoint(x: 92.32, y: 117.46), controlPoint2: CGPoint(x: 95.5, y: 113.72))
      path.addCurve(to: CGPoint(x: 106.71, y: 122.17), controlPoint1: CGPoint(x: 103.53, y: 113.72), controlPoint2: CGPoint(x: 106.71, y: 117.46))
      path.addLine(to: CGPoint(x: 106.71, y: 131.42))
      path.addCurve(to: CGPoint(x: 99.52, y: 139.86), controlPoint1: CGPoint(x: 106.71, y: 136.13), controlPoint2: CGPoint(x: 103.53, y: 139.86))
      path.close()
      path.move(to: CGPoint(x: 142.93, y: 212.48))
      path.addCurve(to: CGPoint(x: 124.13, y: 208.61), controlPoint1: CGPoint(x: 136.75, y: 212.48), controlPoint2: CGPoint(x: 130.31, y: 211.19))
      path.addCurve(to: CGPoint(x: 93.8, y: 182.63), controlPoint1: CGPoint(x: 112.32, y: 203.77), controlPoint2: CGPoint(x: 101.58, y: 194.57))
      path.addCurve(to: CGPoint(x: 95, y: 170.85), controlPoint1: CGPoint(x: 91.38, y: 178.92), controlPoint2: CGPoint(x: 92.05, y: 173.75))
      path.addCurve(to: CGPoint(x: 104.8, y: 172.3), controlPoint1: CGPoint(x: 98.09, y: 167.94), controlPoint2: CGPoint(x: 102.39, y: 168.59))
      path.addCurve(to: CGPoint(x: 154.74, y: 193.44), controlPoint1: CGPoint(x: 117.29, y: 191.34), controlPoint2: CGPoint(x: 138.23, y: 200.22))
      path.addCurve(to: CGPoint(x: 178.36, y: 142.12), controlPoint1: CGPoint(x: 170.04, y: 187.15), controlPoint2: CGPoint(x: 178.36, y: 168.91))
      path.addLine(to: CGPoint(x: 178.36, y: 120.66))
      path.addCurve(to: CGPoint(x: 185.34, y: 112.27), controlPoint1: CGPoint(x: 178.36, y: 115.98), controlPoint2: CGPoint(x: 181.45, y: 112.27))
      path.addCurve(to: CGPoint(x: 192.32, y: 120.66), controlPoint1: CGPoint(x: 189.24, y: 112.27), controlPoint2: CGPoint(x: 192.32, y: 115.98))
      path.addLine(to: CGPoint(x: 192.32, y: 142.29))
      path.addCurve(to: CGPoint(x: 159.3, y: 209.42), controlPoint1: CGPoint(x: 192.32, y: 176.34), controlPoint2: CGPoint(x: 180.24, y: 200.7))
      path.addCurve(to: CGPoint(x: 142.93, y: 212.48), controlPoint1: CGPoint(x: 154.07, y: 211.36), controlPoint2: CGPoint(x: 148.56, y: 212.48))
      path.close()
      return path
    }
  }

  // Bezier Path of the smile of the PJ Logo
  static var smileLogoPJ : UIBezierPath {
    get {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 97.5, y: 160.19))
      path.addCurve(to: CGPoint(x: 124.91, y: 185.4), controlPoint1: CGPoint(x: 104.65, y: 171.95), controlPoint2: CGPoint(x: 114.37, y: 180.75))
      path.addCurve(to: CGPoint(x: 141.92, y: 189.1), controlPoint1: CGPoint(x: 130.51, y: 187.87), controlPoint2: CGPoint(x: 136.28, y: 189.15))
      path.addCurve(to: CGPoint(x: 154.84, y: 186.58), controlPoint1: CGPoint(x: 146.34, y: 189.06), controlPoint2: CGPoint(x: 150.68, y: 188.22))
      path.addCurve(to: CGPoint(x: 156.67, y: 185.84), controlPoint1: CGPoint(x: 155.45, y: 186.34), controlPoint2: CGPoint(x: 156.06, y: 186.09))
      path.addCurve(to: CGPoint(x: 184.47, y: 124.94), controlPoint1: CGPoint(x: 173.89, y: 177.64), controlPoint2: CGPoint(x: 183.82, y: 155.89))
      path.addCurve(to: CGPoint(x: 184.52, y: 119.46), controlPoint1: CGPoint(x: 184.52, y: 123.96), controlPoint2: CGPoint(x: 184.52, y: 120.5))
      path.addLine(to: CGPoint(x: 184.52, y: 98.5))
      return path
    }
  }

  // Bezier Path of eye in the PJ Logo
  static var eyeLogoPJ : UIBezierPath {
    get {
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 7.52, y: 27.86))
      path.addCurve(to: CGPoint(x: 0.32, y: 19.42), controlPoint1: CGPoint(x: 3.5, y: 27.86), controlPoint2: CGPoint(x: 0.32, y: 24.13))
      path.addLine(to: CGPoint(x: 0.32, y: 10.17))
      path.addCurve(to: CGPoint(x: 7.52, y: 1.72), controlPoint1: CGPoint(x: 0.32, y: 5.46), controlPoint2: CGPoint(x: 3.5, y: 1.72))
      path.addCurve(to: CGPoint(x: 14.71, y: 10.17), controlPoint1: CGPoint(x: 11.53, y: 1.72), controlPoint2: CGPoint(x: 14.71, y: 5.46))
      path.addLine(to: CGPoint(x: 14.71, y: 19.42))
      path.addCurve(to: CGPoint(x: 7.52, y: 27.86), controlPoint1: CGPoint(x: 14.71, y: 24.13), controlPoint2: CGPoint(x: 11.53, y: 27.86))
      path.close()
      return path
    }
  }
}

// Used to scale the shapes
extension UIBezierPath
{
  func scale(factor: CGFloat)
  {
    // SCALE path by factor
    let scaleTransform = CGAffineTransform(scaleX: factor, y: factor)
    self.apply(scaleTransform)
  }
}

