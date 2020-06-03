//
//  AnimationLoginController.swift
//  Project-Weather
//
//  Created by admin on 03.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class AnimationLoginController {
    
    func animationTitleWeather(weatherLabel: UILabel, view: UIView) {
        weatherLabel.transform = CGAffineTransform(translationX: 0, y: -view.bounds.height / 2)
        
        let animator = UIViewPropertyAnimator(duration: 1,
                                              dampingRatio: 0.5,
                                              animations: {
                                                  weatherLabel.transform = .identity
        })

        animator.startAnimation(afterDelay: 1)
    }
    
    func animationLabel(loginLabel: UILabel, passwordLabel: UILabel, view: UIView) {
        let offSet = view.bounds.width
        loginLabel.transform = CGAffineTransform(translationX: -offSet, y: 0)
        passwordLabel.transform = CGAffineTransform(translationX: offSet, y: 0)
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveEaseOut,
                       animations: {
                        loginLabel.transform = .identity
                        passwordLabel.transform = .identity
        },
                       completion: nil)
    }
    
    func animateFieldsAppearing(loginTextField: UITextField, passwordTextField: UITextField) {
        let fadeInAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAnimation.fromValue = 0
        fadeInAnimation.toValue = 1

        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 1
        scaleAnimation.stiffness = 150
        scaleAnimation.mass = 2

        let animationsGroup = CAAnimationGroup()
        animationsGroup.duration = 1
        animationsGroup.beginTime = CACurrentMediaTime() + 1
        animationsGroup.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animationsGroup.fillMode = CAMediaTimingFillMode.backwards
        animationsGroup.animations = [fadeInAnimation, scaleAnimation]

        loginTextField.layer.add(animationsGroup, forKey: nil)
        passwordTextField.layer.add(animationsGroup, forKey: nil)
    }
    
    func animateAuthButton(button: UIButton) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.fromValue = 0
        animation.toValue = 1
        animation.stiffness = 200
        animation.mass = 2
        animation.duration = 2
        animation.beginTime = CACurrentMediaTime() + 1
        animation.fillMode = CAMediaTimingFillMode.backwards
        
        button.layer.add(animation, forKey: nil)
    }
}
