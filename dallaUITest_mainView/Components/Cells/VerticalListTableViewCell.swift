//
//
//  VerticalListTableViewCell.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/12.
//

import UIKit
import SnapKit

class VerticalListTableViewCell: UITableViewCell {
     
    static var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }

    var item: DisplayableItem? {
        didSet{
            configure()
        }
    }

    private var iconImageViews: [UIImageView] = []
    private var badgeImageViews: [UIImageView] = []
    
    private let mainContainerVIew: UIView = {
        let view = UIView()
        view.backgroundColor = .customWhite
        return view
    }()
    
    private let leadingSlideImageView: UIImageView = {
        let ImageView = UIImageView()
        return ImageView
    }()
    
    private let leadingImageVIew: UIImageView = {
        let ImageView = UIImageView()
        ImageView.clipsToBounds = true
        ImageView.layer.cornerRadius = 8
        return ImageView
    }()
    
    private let bottomTrailingInnerImageContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let bottomTrailingInnerImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.clipsToBounds = true
        ImageView.layer.cornerRadius = 8
        ImageView.layer.borderWidth = 2
        ImageView.layer.borderColor = UIColor.customWhite.cgColor
        return ImageView
    }()
    
    private let topTrailingInnerImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let topTrailingInnerImageView: UIImageView = {
        let ImageView = UIImageView()
        return ImageView
    }()
    
    
    private let topTrailingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    private let topTrailingVerticalfirstLineStackComponent: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    private let topTrailingVerticalSecondLineLabelComponent: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-SemiBold", size: 15)
        label.textColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)

        return label
    }()
    
        
    private let bottomTrailingVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.spacing = 6
        stackView.axis = .vertical
        return stackView
    }()
    
    private let secondLineComponent: UIView = {
        let view = UIView()
        return view
    }()
    
    private let peopleImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(named: "peopleGS")
        return ImageView
    }()
    
    private let peopleCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Medium", size: 13)
        label.textColor = UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)
        return label
    }()
    
    private let heartOrBoostImage: UIImageView = {
        let ImageView = UIImageView()
        return ImageView
    }()
    
    private let heartOrBoostCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Medium", size: 13)
        return label
    }()
    
    private let firstLineComponentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    private let firstLineiconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.spacing = 2
        return stackView
    }()
    
    private let icoGenderImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let djNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Regular", size: 13)
        label.textColor = UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0)
        label.text = "쏭디제이"

        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        switch item {
        case let data as LiveStreamingInfo:
            updateImageView(leadingSlideImageView, with: data.timeRanking)
            updateImageView(leadingImageVIew, with: data.imageName)
            updateImageView(bottomTrailingInnerImageView, with: data.miniImageName)
            updateImageView(topTrailingInnerImageView, with: data.liveState)
            
            if !data.bdgList.isEmpty {
                setupTopViews(imageNames: data.bdgList)
            }
            
            if !data.icoList.isEmpty {
                setupBottomViews(imageNames: data.icoList)
            }
            
            heartOrBoostImage.image = UIImage(named: data.isBooster ? "icoBooster2" : "heart")
            heartOrBoostCountLabel.text = String(data.isBooster ? data.boosterCount : data.heartCount)
            heartOrBoostCountLabel.textColor = data.isBooster ? UIColor(red: 232.0/255.0, green: 82.0/255.0, blue: 102.0/255.0, alpha: 1.0) : UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1.0)

            topTrailingVerticalSecondLineLabelComponent.text = data.title
            peopleCountLabel.text = String(data.peopleCount)
            icoGenderImageView.image = UIImage(named: data.gender)
            djNameLabel.text = data.djName
            
        default:
            fatalError("타입 에러")
            break
        }
    }
    
    private func updateImageView(_ imageView: UIImageView, with imageName: String) {
        if !imageName.isEmpty {
            imageView.image = UIImage(named: imageName)
            imageView.isHidden = false
        } else {
            imageView.isHidden = true
        }
    }
    
    
    private func setupBottomViews(imageNames: [String]) {
        firstLineiconStackView.removeFullyAllArrangedSubviews()  // 스택뷰 초기화
        
        imageNames.forEach { item in
            let imageView = UIImageView()
            imageView.image = UIImage(named: item)
            
            firstLineiconStackView.addArrangedSubview(imageView)
            iconImageViews.append(imageView)
        }
        
        setupIconViewsConstraints(iconViews: iconImageViews)
    }
    
    private func setupIconViewsConstraints(iconViews: [UIView]) {
        iconViews.forEach { item in
            item.snp.makeConstraints {
                $0.width.height.equalTo(14)
            }
        }
    }
    
    private func setupTopViews(imageNames: [String] ) {
        topTrailingVerticalfirstLineStackComponent.removeFullyAllArrangedSubviews()
        
        imageNames.forEach { item in
            let imageView = UIImageView()
            imageView.image = UIImage(named: item)
            
            topTrailingVerticalfirstLineStackComponent.addArrangedSubview(imageView)
            badgeImageViews.append(imageView)
        }
        
    }
    
    private func setupSubViews() {
        contentView.addSubview(mainContainerVIew)
        
        mainContainerVIew.addSubview(leadingImageVIew)
        mainContainerVIew.addSubview(topTrailingVerticalStackView)
        mainContainerVIew.addSubview(bottomTrailingVerticalStackView)
        mainContainerVIew.addSubview(leadingSlideImageView)
        
        leadingImageVIew.addSubview(topTrailingInnerImageContainerView)
        leadingImageVIew.addSubview(bottomTrailingInnerImageView)
        
        topTrailingInnerImageContainerView.addSubview(topTrailingInnerImageView)
        
        topTrailingVerticalStackView.addArrangedSubview(topTrailingVerticalfirstLineStackComponent)
                
        firstLineComponentStackView.addArrangedSubview(firstLineiconStackView)
        firstLineComponentStackView.addArrangedSubview(icoGenderImageView)
        firstLineComponentStackView.addArrangedSubview(djNameLabel)
        
        topTrailingVerticalStackView.addArrangedSubview(topTrailingVerticalSecondLineLabelComponent)
        bottomTrailingVerticalStackView.addArrangedSubview(firstLineComponentStackView)
        bottomTrailingVerticalStackView.addArrangedSubview(secondLineComponent)
        
        secondLineComponent.addSubview(peopleImageView)
        secondLineComponent.addSubview(peopleCountLabel)
        secondLineComponent.addSubview(heartOrBoostImage)
        secondLineComponent.addSubview(heartOrBoostCountLabel)
    }
    
    private func setupConstraints() {
        mainContainerVIew.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        leadingSlideImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(90)
        }
        
        leadingImageVIew.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.equalToSuperview().offset(6)
            $0.bottom.equalToSuperview().offset(-6)
            $0.width.height.equalTo(112)
        }
        
        topTrailingInnerImageContainerView.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        
        topTrailingInnerImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().offset(-8)
            $0.width.height.equalTo(20)
        }
        
        bottomTrailingInnerImageView.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
            $0.width.height.equalTo(50)
        }
        
        bottomTrailingVerticalStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(leadingImageVIew.snp.trailing).offset(12)
            $0.bottom.equalToSuperview().offset(-17)
        }
        
        firstLineComponentStackView.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        
        secondLineComponent.snp.makeConstraints {
            $0.height.equalTo(16)
            $0.trailing.lessThanOrEqualToSuperview()
        }
        
        peopleImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.width.height.equalTo(16)
        }
        
        peopleCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(peopleImageView.snp.trailing)
            $0.height.equalTo(16)
        }
        
        heartOrBoostImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(peopleCountLabel.snp.trailing).offset(11)
            $0.width.height.equalTo(16)
        }
        
        heartOrBoostCountLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(heartOrBoostImage.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(16)
        }
        
        topTrailingVerticalStackView.snp.makeConstraints {
            $0.leading.equalTo(leadingImageVIew.snp.trailing).offset(12)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().offset(17)
        }
    }
}
