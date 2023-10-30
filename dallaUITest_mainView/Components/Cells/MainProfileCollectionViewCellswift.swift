//
//  MainProfileCollectionViewCellswift.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/15.
//

import UIKit
import SnapKit

class MainProfileCollectionViewCell: UICollectionViewCell {
     
    static var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }

    var item: DisplayableItem? {
        didSet{
            configure()
        }
    }
    
    let mainContainerVIew: UIView = {
        let view = UIView()
        return view
    }()
    
    let mainBackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let profileContentContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let bdgStarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "SUIT-SemiBold", size: 24)
        label.textColor = UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        label.numberOfLines = 2
        label.lineBreakMode = .byCharWrapping
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Regular", size: 14)
        label.textColor = UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubViews()
        setupConstraints()
        setGradient()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setGradient() {
        profileContentContainerView.setGradient(
            colors: [
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.0).cgColor,
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.8).cgColor,
                UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
            ],
            locations: [0.0, 0.67, 1.0],
            frame: CGRect(x: .zero,
                          y: .zero,
                          width: UIScreen.mainWidth,
                          height: profileContentContainerView.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize).height
                         )
        )
    }
    
    private func configure() {
        switch item {
        case let data as TopMainProfile:
            mainBackgroundImageView.image = UIImage(named: data.imageName)
            bdgStarImageView.image = UIImage(named: data.bdgImageName)
            titleLabel.text = data.title
            titleLabel.addCharacterSpacing(kernValue: -0.72)
            subtitleLabel.text = data.subtitle
            
        default:
            fatalError("타입 에러")
            break
        }
    }
    
    private func setupSubViews() {
        contentView.addSubview(mainContainerVIew)
        
        mainContainerVIew.addSubview(mainBackgroundImageView)
        mainContainerVIew.addSubview(profileContentContainerView)
        
        profileContentContainerView.addSubview(bdgStarImageView)
        profileContentContainerView.addSubview(titleLabel)
        profileContentContainerView.addSubview(subtitleLabel)
    }
    
    private func setupConstraints() {
        mainContainerVIew.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainBackgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        profileContentContainerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(156)
        }
        
        bdgStarImageView.snp.makeConstraints {
            $0.bottom.equalTo(titleLabel.snp.top).offset(-8)
            $0.leading.equalToSuperview().offset(17)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(subtitleLabel.snp.top).offset(-9)
            $0.leading.equalToSuperview().offset(17)
            $0.width.equalTo(236)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.bottom.equalToSuperview().offset(-14)
        }
    }
}

