//
//  UIVIew+Extensions.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/11.
//

import UIKit

extension UIView{
    func setGradient(colors: [CGColor],
                     locations: [NSNumber],
                     frame: CGRect? = nil,
                     isCornerRadiusEnabled: Bool = false,
                     opacityValue: Float = 1.0
    ) {
        guard colors.count == locations.count else {
            print("컬러 갯수 != 지역 갯수")
            return
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = colors
        gradient.locations = locations
        gradient.frame = frame ?? bounds
        gradient.opacity = opacityValue
        if let _frame = frame, isCornerRadiusEnabled {
            gradient.cornerRadius = _frame.height / 2
        }
        
        layer.insertSublayer(gradient, at: 0)
    }
}
