//
//  UIView+Extension.swift
//  OnboardingDemo
//
//  Created by Ahmed mazher on 2/27/21.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get{ return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
