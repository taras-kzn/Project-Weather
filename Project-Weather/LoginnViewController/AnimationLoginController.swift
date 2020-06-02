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
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        weatherLabel.transform = .identity
        },
                       completion: nil)
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
        fadeInAnimation.duration = 1
        fadeInAnimation.beginTime = CACurrentMediaTime() + 1
        fadeInAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        fadeInAnimation.fillMode = CAMediaTimingFillMode.backwards
        
        loginTextField.layer.add(fadeInAnimation, forKey: nil)
        passwordTextField.layer.add(fadeInAnimation, forKey: nil)
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
