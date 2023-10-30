//
//  HorizontalListCollectionViewCell.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/12.
//

import UIKit
import SnapKit

class HorizontalListCollectionViewCell: UICollectionViewCell {
    
    static var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }

    var item: DisplayableItem? {
        didSet{
            configure()
        }
    }

    private let bottomGradientLayerContainerView: UIView = {
        let view = UIView()
        view.setGradient(
            colors: [
                UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.0).cgColor,
                UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
            ],
            locations: [0.0, 1.0],
            frame: CGRect(x: .zero, y: .zero, width: 116, height: 55),
            isCornerRadiusEnabled: false,
            opacityValue: 0.5
        )
        
        return view
    }()
    
    private let mainContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "mainTopProfileImage1")
        return imageView
    }()
    
    private let mainImageInnerTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Medium", size: 13)
        label.textColor = UIColor.customWhite
        label.text = "한개두개세개아아아"
        return label
    }()
    
    private let topLeadingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "btnMiniLive")
        return imageView
    }()
    
    private let bottomTrailingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        
        imageView.image = UIImage(named: "numberW1")
        return imageView
    }()
    
    
    private let djNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSansCJKkr-Regular", size: 15)
        label.textColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)
//        label.text = "달대리짱"
        label.addCharacterSpacing(kernValue: -0.75)
        return label
    }()
    
    
        
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented required init?(coder: NSCoder)")
    }
    
    
    private func configure() {
//        guard let _data = data as? UserRankingTop10 else { return }
        switch item {
        case let userRanking as UserRankingTop10:
            mainImageInnerTitle.isHidden = true
            topLeadingImageView.image = UIImage(named: userRanking.liveState)
            bottomTrailingImageView.image = UIImage(named: userRanking.rankingNum)
            djNameLabel.text = userRanking.djName
            mainImageView.image = UIImage(named: userRanking.imageName)

        case let newBj as UserNewBj:
            topLeadingImageView.isHidden = true
            bottomTrailingImageView.isHidden = true
            bottomTrailingImageView.isHidden = true
            mainImageInnerTitle.text = newBj.subTitle
            mainImageView.image = UIImage(named: newBj.imageName)
        default:
            fatalError("타입 에러")
            break
        }
        
        
    }
    
    private func setupSubViews() {
        contentView.addSubview(mainContainerView)
        
        mainContainerView.addSubview(mainImageView)
        mainContainerView.addSubview(djNameLabel)
        
        mainImageView.addSubview(bottomGradientLayerContainerView)
        mainImageView.addSubview(mainImageInnerTitle)
        
        mainImageView.addSubview(topLeadingImageView)
        mainImageView.addSubview(bottomTrailingImageView)
   
    }
    
    private func setupConstraints() {
  
        mainContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(16)
            $0.width.equalTo(116)
            $0.height.equalTo(154)
        }
                
        mainImageInnerTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.bottom.trailing.equalToSuperview().offset(-8)
        }
        
        bottomGradientLayerContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.width.equalTo(116)
            $0.height.equalTo(55)
        }
        
        topLeadingImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        bottomTrailingImageView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().offset(-8)
            $0.width.equalTo(49)
            $0.height.equalTo(48)
        }
        
        djNameLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(7)
            $0.centerX.equalToSuperview()
        }
        
    }
}

