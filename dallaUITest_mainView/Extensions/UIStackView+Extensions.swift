//
//  UIStackView+Extensions.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/12.
//

import UIKit
import SnapKit

extension UIStackView{
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }

    func addArrangedSubviews(views: [UIView], includeSeparators: Bool = false) {
        views.forEach {
            if arrangedSubviews.count > 0 && includeSeparators {
                let separator = UIView()
                separator.backgroundColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)
                addArrangedSubview(separator)
                separator.snp.makeConstraints {
                    $0.width.equalTo(1)
                    $0.height.equalTo(10)
                }
            }
            addArrangedSubview($0)
        }
    }
}
