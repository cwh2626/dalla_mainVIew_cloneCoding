//
//  UILabel+Extensions.swift
//  testApp
//
//  Created by Mac on 2023/10/11.
//

import UIKit

extension UILabel {
    // 문자 간격 설정
    func addCharacterSpacing(kernValue: Double) {
        guard let labelText = text, labelText.count > 0 else { return }

        let attributedString = NSMutableAttributedString(string: labelText)
        attributedString.addAttribute(.kern,
                                      value: kernValue,
                                      range: NSRange(location: 0, length: attributedString.length - 1))
        
        self.attributedText = attributedString
    }
}


