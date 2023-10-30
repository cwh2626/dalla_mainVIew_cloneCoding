//
//  ThinBannerBar.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/12.
//

import UIKit
import SnapKit

class ThinBannerBar: UIView {
    
    private let roundedCornerContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 25 / 2
        view.backgroundColor = UIColor(red: 255.0/255.0, green: 243.0/255.0, blue: 247.0/255.0, alpha: 1.0)
        view.clipsToBounds = true
        return view
    }()
    
    private let leadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imgTip")
        return imageView
    }()
    
    private let centerLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "타임랭킹 1~3위시, 스타DJ 가산점 지급", attributes: [
          .font: UIFont(name: "SUIT-Bold", size: 13.0)!,
          .foregroundColor: UIColor(white: 48.0 / 255.0, alpha: 1.0)
        ])
        attributedString.addAttribute(.font, value: UIFont(name: "SUIT-Medium", size: 13.0)!, range: NSRange(location: 0, length: 5))
        attributedString.addAttribute(.font, value: UIFont(name: "SUIT-Medium", size: 13.0)!, range: NSRange(location: 9, length: 3))
        attributedString.addAttribute(.font, value: UIFont(name: "SUIT-Medium", size: 13.0)!, range: NSRange(location: 20, length: 3))
        label.attributedText = attributedString
        
        return label
    }()
    
    private let trailingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icoDropDown")
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.backgroundColor = .customWhite
        addSubview(roundedCornerContainerView)
        
        roundedCornerContainerView.addSubview(leadingImageView)
        roundedCornerContainerView.addSubview(centerLabel)
        roundedCornerContainerView.addSubview(trailingImageView)
    }
    
    private func setupConstraints() {
        roundedCornerContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
        }
        
        leadingImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(50)
        }
        
        centerLabel.snp.makeConstraints {
            $0.leading.equalTo(leadingImageView.snp.trailing).offset(11)
            $0.top.equalToSuperview().offset(5)
        }
        
        trailingImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-5)
            $0.top.equalToSuperview().offset(3)
            $0.bottom.equalToSuperview().offset(-2)
            $0.width.height.equalTo(20)
        }
    }
}
