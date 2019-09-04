/*
 * Copyright (C) PagesJaunes, SoLocal Group - All Rights Reserved.
 *
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 * Proprietary and confidential.
 */


import UIKit

@IBDesignable final class LoadingView: UIView {

  // Color of the animation
  @IBInspectable public var logoColor: UIColor = .black {
    didSet { update() }
  }

  // Duration of the animation
  @IBInspectable public var duration: CGFloat = 1.8 {
    didSet { update() }
  }

  private var totalDuration: CFTimeInterval {
    get { return Double(duration) }
  }

  private let animeSize: CGFloat = 100

  lazy var logoBounds = CGRect(x: 0, y: 0, width: self.animeSize, height: self.animeSize)
  lazy var shapesBounds = CGRect(x: 0, y: 0, width: 15, height: 16)

  private let eyeShape = CAShapeLayer()
  private let middleCircleShape = CAShapeLayer()
  private let rightCircleShape = CAShapeLayer()
  private let smileShape = CAShapeLayer()


  // MARK: Initialisations

  /// Init the loading View
  ///
  /// - Parameters:
  ///   - frame: the frame of the loading view
  ///   - logoColor: Color of loading animation. Default value is black color.
  ///   - totalDuration: duration of the animation in seconde. Default value is 2 secondes
  required convenience init(frame: CGRect, logoColor: UIColor? = nil){
    self.init(frame: frame)

    if let logoColor = logoColor {
      self.logoColor = logoColor
    }
  }

  // MARK: Setup / Updates methods

  private func update() {
   guard self.frame != .zero else { return }

    // pour l'instant on fait un setup a terme on va changer

    self.eyeShape.removeAllAnimations()
    self.eyeShape.removeFromSuperlayer()

    self.middleCircleShape.removeAllAnimations()
    self.middleCircleShape.removeFromSuperlayer()

    self.rightCircleShape.removeAllAnimations()
    self.rightCircleShape.removeFromSuperlayer()

    self.smileShape.removeAllAnimations()
    self.smileShape.removeFromSuperlayer()

    setup()
  }

  private func setup() {
    addShapes()
  }

  // MARK: UIView override

  override func layoutSubviews() {
    super.layoutSubviews()
    self.update()
  }

  // MARK: Drawing shapes / Animations

  private func addShapes() {
    guard self.frame != .zero else { return }
    addEyeShape()
    addSmileShape()
    addMiddleCircleShape()
    addRightCircleShape()
  }

  private func addEyeShape() {

    let initalEyePath = UIBezierPath(roundedRect: shapesBounds,
                                     byRoundingCorners: [.topLeft, .bottomRight],
                                     cornerRadii: CGSize(width: 20, height: 20))

    let finalEyePath = LogoPJBezierPaths.eyeLogoPJ

    let eyePositionX = center.x - 45
    let eyePositionY = center.y - 10

    let eyeShapePosition = CGPoint(x: eyePositionX, y: eyePositionY)

    eyeShape.bounds = shapesBounds
    eyeShape.fillColor = logoColor.cgColor
    eyeShape.position = eyeShapePosition
    eyeShape.path = initalEyePath.cgPath

    if eyeShape.superlayer == nil {
      self.layer.addSublayer(eyeShape)
    } else {
      return
    }

    let animatePosition = CAKeyframeAnimation()
    animatePosition.keyPath = "position.y"
    animatePosition.values = [center.y, center.y - 20, center.y - 30 , center.y - 20, center.y, center.y + 25, center.y + 25, center.y - 55, center.y - 15]
    animatePosition.keyTimes = [0, 0.05, 0.10, 0.15, 0.20, 0.25, 0.65, 0.70, 0.80]
    animatePosition.duration = totalDuration
    animatePosition.repeatCount = .infinity

    let animatePath = CAKeyframeAnimation(keyPath: "path")
    animatePath.values = [initalEyePath.cgPath,initalEyePath.cgPath,finalEyePath.cgPath]
    animatePath.keyTimes = [0,0.75,0.76]
    animatePath.duration = totalDuration
    animatePath.repeatCount = .infinity
    animatePath.fillMode = CAMediaTimingFillMode.forwards

    let animateOpacity = CAKeyframeAnimation(keyPath: "opacity")
    animateOpacity.values = [1,0,0,1]
    animateOpacity.keyTimes = [0.24,0.25,0.65,0.67]
    animateOpacity.duration = totalDuration
    animateOpacity.repeatCount = .infinity
    animateOpacity.fillMode = CAMediaTimingFillMode.forwards

    let groupeAnimation = CAAnimationGroup()
    groupeAnimation.animations = [animatePosition,animatePath,animateOpacity]
    groupeAnimation.duration = totalDuration
    groupeAnimation.repeatCount = .infinity
    groupeAnimation.fillMode = CAMediaTimingFillMode.forwards
    groupeAnimation.isRemovedOnCompletion = false

    eyeShape.removeAllAnimations()
    eyeShape.add(groupeAnimation, forKey: nil)
  }

  private func addMiddleCircleShape() {

    let initalCirclePath = UIBezierPath(ovalIn: shapesBounds)
    let finalCirclePath = UIBezierPath(ovalIn: CGRect.zero)

    let middleCirclePositionX = self.center.x
    let middleCirclePositionY = self.center.y

    let circleShapePosition = CGPoint(x: middleCirclePositionX, y: middleCirclePositionY)

    middleCircleShape.bounds = shapesBounds
    middleCircleShape.position = circleShapePosition
    middleCircleShape.fillColor = logoColor.cgColor
    middleCircleShape.path =  initalCirclePath.cgPath
    if middleCircleShape.superlayer == nil { self.layer.addSublayer(middleCircleShape) }
    else {
      return
    }

    let animatePosition = CAKeyframeAnimation()
    animatePosition.keyPath = "position.y"
    animatePosition.values = [center.y, center.y - 20, center.y - 35, center.y - 35, center.y - 20, center.y + 10]
    animatePosition.keyTimes = [0.10, 0.15, 0.20,0.25,0.30,0.35]
    animatePosition.duration = totalDuration
    animatePosition.repeatCount = 0

    let animatePath = CAKeyframeAnimation(keyPath: "path")
    animatePath.values = [initalCirclePath.cgPath,finalCirclePath.cgPath]
    animatePath.keyTimes = [0.34,0.35]
    animatePath.duration = totalDuration
    animatePath.repeatCount = .infinity
    animatePath.fillMode = CAMediaTimingFillMode.forwards

    let groupeAnimation = CAAnimationGroup()
    groupeAnimation.animations = [animatePosition,animatePath]
    groupeAnimation.duration = totalDuration
    groupeAnimation.repeatCount = .infinity
    groupeAnimation.fillMode = CAMediaTimingFillMode.forwards
    groupeAnimation.isRemovedOnCompletion = false

    middleCircleShape.removeAllAnimations()
    middleCircleShape.add(groupeAnimation, forKey: nil)
  }

  private func addRightCircleShape() {

    let rightCirclePositionX = self.center.x + 45
    let rightCirclePositionY = self.center.y - 10

    let circleShapePosition = CGPoint(x: rightCirclePositionX, y: rightCirclePositionY)

    let circlePath = UIBezierPath(ovalIn: shapesBounds)

    rightCircleShape.bounds = shapesBounds
    rightCircleShape.position = circleShapePosition
    rightCircleShape.fillColor = logoColor.cgColor
    rightCircleShape.path =  circlePath.cgPath
    rightCircleShape.removeAllAnimations()

    if rightCircleShape.superlayer == nil {  self.layer.addSublayer(rightCircleShape) }
    else {
      return
    }

    let animatePosition = CAKeyframeAnimation()
    animatePosition.keyPath = "position.y"
    animatePosition.values = [center.y,center.y - 25,center.y - 35,center.y - 45,center.y - 35,center.y - 25]
    animatePosition.keyTimes = [0.20, 0.25,0.30,0.35,0.4, 0.45]
    animatePosition.duration = totalDuration
    animatePosition.repeatCount = .infinity

    let animateOpacity = CAKeyframeAnimation(keyPath: "opacity")
    animateOpacity.values = [1,0]
    animateOpacity.keyTimes = [0.44,0.45]
    animateOpacity.duration = totalDuration
    animateOpacity.repeatCount = .infinity
    animateOpacity.fillMode = CAMediaTimingFillMode.forwards

    let groupeAnimation = CAAnimationGroup()
    groupeAnimation.animations = [animatePosition,animateOpacity]
    groupeAnimation.duration = totalDuration
    groupeAnimation.repeatCount = .infinity
    groupeAnimation.fillMode = CAMediaTimingFillMode.forwards
    groupeAnimation.isRemovedOnCompletion = false
    rightCircleShape.removeAllAnimations()
    rightCircleShape.add(groupeAnimation, forKey: nil)
  }

  private func addSmileShape() {

    let smilePositionX = self.center.x - 90
    let smilePositionY = self.center.y - 80
    let smileShapePosition = CGPoint(x: smilePositionX , y: smilePositionY)

    let initialPath = LogoPJBezierPaths.smileLogoPJ

    // Smile Shape
    smileShape.path = initialPath.cgPath
    smileShape.bounds = logoBounds
    smileShape.opacity = 0
    smileShape.strokeColor = logoColor.cgColor
    smileShape.fillColor = nil
    smileShape.lineWidth = 14
    smileShape.strokeStart = 0
    smileShape.strokeEnd = 0
    smileShape.lineCap = CAShapeLayerLineCap.round
    smileShape.position = smileShapePosition
    if smileShape.superlayer == nil { self.layer.addSublayer(smileShape) }
    else {
      return
    }

    let animateOpacity = CAKeyframeAnimation()
    animateOpacity.keyPath = "opacity"
    animateOpacity.values = [0,1,1,0]
    animateOpacity.keyTimes = [0.24,0.25,0.99,1]
    animateOpacity.fillMode = CAMediaTimingFillMode.forwards
    animateOpacity.duration = totalDuration

    let animateStrokeStart1 = CABasicAnimation(keyPath: "strokeStart")
    animateStrokeStart1.toValue = 0.9
    animateStrokeStart1.duration = totalDuration / 2.85
    animateStrokeStart1.autoreverses = false
    animateStrokeStart1.beginTime = totalDuration / 4
    animateStrokeStart1.fillMode = CAMediaTimingFillMode.forwards

    let animateStrokeEnd1 = CABasicAnimation(keyPath: "strokeEnd")
    animateStrokeEnd1.fromValue = 0.3
    animateStrokeEnd1.toValue = 1
    animateStrokeEnd1.duration = totalDuration / 5
    animateStrokeEnd1.autoreverses = false
    animateStrokeEnd1.beginTime = totalDuration / 4
    animateStrokeEnd1.fillMode = CAMediaTimingFillMode.forwards

    let animateStrokeStart2 = CABasicAnimation(keyPath: "strokeStart")
    animateStrokeStart2.fromValue = 0.9
    animateStrokeStart2.toValue = 0
    animateStrokeStart2.duration = totalDuration / 10
    animateStrokeStart2.beginTime = totalDuration / 1.81
    animateStrokeStart2.autoreverses = false
    animateStrokeStart2.fillMode = CAMediaTimingFillMode.forwards

    let animateStrokeEnd2 = CABasicAnimation(keyPath: "strokeEnd")
    animateStrokeEnd2.fromValue = 1
    animateStrokeEnd2.toValue = 0
    animateStrokeEnd2.duration = totalDuration / 5.71
    animateStrokeEnd2.beginTime = totalDuration / 1.21
    animateStrokeEnd2.autoreverses = false
    animateStrokeEnd2.fillMode = CAMediaTimingFillMode.forwards

    let animateStrokeEnd3 = CABasicAnimation(keyPath: "strokeEnd")
    animateStrokeEnd3.fromValue = 1
    animateStrokeEnd3.toValue = 0.9
    animateStrokeEnd3.duration = totalDuration / 20
    animateStrokeEnd3.autoreverses = false
    animateStrokeEnd3.beginTime = totalDuration / 2
    animateStrokeEnd3.fillMode = CAMediaTimingFillMode.forwards

    let groupeAnimation = CAAnimationGroup()
    groupeAnimation.animations = [animateStrokeStart1,
                                  animateStrokeEnd1,
                                  animateStrokeStart2,
                                  animateStrokeEnd2,
                                  animateStrokeEnd3,
                                  animateOpacity]

    groupeAnimation.duration = totalDuration
    groupeAnimation.fillMode = CAMediaTimingFillMode.forwards
    groupeAnimation.isRemovedOnCompletion = false
    groupeAnimation.repeatCount = .infinity

    smileShape.removeAllAnimations()
    smileShape.add(groupeAnimation, forKey: nil)
  }
}



