//
//  MainTopProfileView.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/11.
//

import UIKit
import SnapKit

class MainTopProfileView: UIView {
    
    
    let mainTopProfileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let mainTopProfileTextContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let mainTopBdgStarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let mainTopMainTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "SUIT-SemiBold", size: 24)
        label.textColor = UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        label.numberOfLines = 2
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    private let mainTopSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Regular", size: 14)
        label.textColor = UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        return label
    }()
    
    // 초기화 코드
    init(profileData: TopMainProfile) {
        super.init(frame: .zero)
        configure(profileData)
        setupSubViews()
        setupConstraints()
        setGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setGradient() {
        mainTopProfileTextContainerView.setGradient(
            colors: [
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.0).cgColor,
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.8).cgColor,
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            ],
            locations: [0.0, 0.67, 1.0],
            frame: CGRect(x: .zero,
                          y: .zero,
                          width: UIScreen.mainWidth,
                          height: mainTopProfileTextContainerView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
                         )
        )
    }
    
    private func setupSubViews() {
        addSubview(mainTopProfileImageView)
        addSubview(mainTopProfileTextContainerView)
        
        mainTopProfileTextContainerView.addSubview(mainTopBdgStarImageView)
        mainTopProfileTextContainerView.addSubview(mainTopMainTitleLabel)
        mainTopProfileTextContainerView.addSubview(mainTopSubtitleLabel)
    }
    
    private func configure(_ data: TopMainProfile) {
        mainTopProfileImageView.image = UIImage(named: data.imageName)
        mainTopBdgStarImageView.image = UIImage(named: data.bdgImageName)
        mainTopMainTitleLabel.text = data.title
        mainTopMainTitleLabel.addCharacterSpacing(kernValue: -0.72)
        mainTopSubtitleLabel.text = data.subtitle
//        mainTopSubtitleLabel.addCharacterSpacing(kernValue: -0.42) // 이모지가 씹힌다 왜그럴까 공간부족?
    }
    
    private func setupConstraints() {
        mainTopProfileImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }        
        
        mainTopProfileTextContainerView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
//            $0.leading.equalToSuperview()
//            $0.width.equalToSuperview()
            $0.height.equalTo(156)
        }
        
        mainTopBdgStarImageView.snp.makeConstraints {
            $0.bottom.equalTo(mainTopMainTitleLabel.snp.top).offset(-8)
            $0.leading.equalToSuperview().offset(17)
        }
        
        mainTopMainTitleLabel.snp.makeConstraints {
            $0.bottom.equalTo(mainTopSubtitleLabel.snp.top).offset(-9)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(236)
        }
        
        mainTopSubtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.bottom.equalToSuperview().offset(-14)
        }
    }
}
