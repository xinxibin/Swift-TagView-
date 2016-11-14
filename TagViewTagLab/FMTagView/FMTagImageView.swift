//
//  FMTagImageView.swift
//  testTagImage
//
//  Created by Xinxibin on 16/9/4.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

class FMTagImageView: UIImageView {
    var yellowView:UIView?

    var isLoading = false {
        didSet {
            if isLoading {
                stopTagAnimation()
                startTagAnimation()
            }
        }
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    func setUI() {
        self.layer.removeAllAnimations()
        yellowView?.removeFromSuperview()

        let shapeLayer          = CAShapeLayer()
        shapeLayer.frame        = self.bounds
        shapeLayer.path         = UIBezierPath(ovalIn: shapeLayer.bounds).cgPath
        shapeLayer.fillColor    = UIColor.black.cgColor
        shapeLayer.opacity      = 0
        
        let opacityAnimation        = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue  = 0.5
        opacityAnimation.toValue    = 0
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = shapeLayer.bounds
        replicatorLayer.instanceCount = 2
        replicatorLayer.instanceDelay = 1
        replicatorLayer.addSublayer(shapeLayer)
        self.layer.addSublayer(replicatorLayer)
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform")
        scaleAnimation.fromValue = NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity,0.18,0.18, 0))
        scaleAnimation.toValue   = NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity,1, 1, 0))
        
        let groupAnimation          = CAAnimationGroup()
        groupAnimation.animations   = [opacityAnimation,scaleAnimation]
        groupAnimation.duration     = 2
        groupAnimation.repeatCount  = HUGE
        groupAnimation.autoreverses = false
        shapeLayer.add(groupAnimation, forKey: "groupAnimation")
        
        yellowView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
        yellowView!.backgroundColor = UIColor(red: 254/255.0, green: 220/255.0, blue: 0, alpha: 1)
        yellowView!.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        self.addSubview(yellowView!)
        
        yellowView!.layer.cornerRadius = 2
        yellowView!.layer.masksToBounds = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUI()

    }
    
    func startTagAnimation() {
        setUI()
    }
    
    func stopTagAnimation() {
        if yellowView != nil {
            yellowView!.removeFromSuperview()
            yellowView = nil
        }

        self.layer.removeAllAnimations()
    }

}
