//
//  FollowListCollectionViewCell.swift
//  appTest
//
//  Created by 조웅희 on 2023/10/06.
//

import UIKit
import SnapKit

class FollowListCollectionViewCell: UICollectionViewCell {
    
    static var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }

    var followData: Follow? {
        didSet{
            configure(self.followData)
        }
    }
        
    private let circularGradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        gradientLayer.cornerRadius = gradientLayer.frame.height / 2
        return gradientLayer
    }()

    private let followProfileContainerView: UIView = {
        let view = UIView()
        return view
    }()
        
    private let followCountTextContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 246.0/255.0, green: 246.0/255.0, blue: 246.0/255.0, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 70 / 2
        return view
    }()
    
    private let followCountLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0)
        label.textAlignment = .center
        label.addCharacterSpacing(kernValue: -1.0)

        return label
    }()
    
    private let followProfileImageContainerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let followProfileImageInnerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .customWhite
        view.layer.cornerRadius = 76 / 2
        return view
    }()
    
    private let followProfileImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let followNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-Regular", size: 12)
        label.textColor = UIColor(red: 48.0/255.0, green: 48.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        label.textAlignment = .center
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
    
    func configureForLastCell(_ followCount: Int) {
        // 다른 뷰들을 숨기고 회색 원모양만 보이게 설정합니다.
        followProfileImageContainerView.isHidden = true
        followNameLabel.isHidden = true
        followCountTextContainerView.isHidden = false
        followCountLabel.text = "+\(followCount)"
    }
    
    private func configure(_ data: Follow?) {
        guard let _data = data else { return }
        // 뷰들의 기본 상태를 초기화합니다.
        followCountTextContainerView.isHidden = true
        followProfileImageContainerView.isHidden = false
        followNameLabel.isHidden = false
        
        followProfileImageView.image = UIImage(named: _data.imageName)
        followNameLabel.text = _data.djName
                
        if _data.isLiveStreamingOn {
            circularGradientLayer.colors = [
                UIColor(red: 255.0/255.0, green: 60.0/255.0, blue: 123.0/255.0, alpha: 1.0).cgColor,
                UIColor(red: 255.0/255.0, green: 133.0/255.0, blue: 101.0/255.0, alpha: 1.0).cgColor,
            ]
        } else {
            circularGradientLayer.colors = [
                UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0).cgColor,
                UIColor(red: 225/255.0, green: 225.0/255.0, blue: 225.0/255.0, alpha: 1.0).cgColor,
            ]
        }
    }
    
    private func setupSubViews() {
        contentView.addSubview(followProfileContainerView)

        followProfileContainerView.addSubview(followProfileImageContainerView)
        followProfileContainerView.addSubview(followCountTextContainerView)
        followProfileContainerView.addSubview(followNameLabel)
        
        followCountTextContainerView.addSubview(followCountLabel)
        
        
        followProfileImageContainerView.layer.addSublayer(circularGradientLayer)
        
        followProfileImageContainerView.addSubview(followProfileImageInnerContainerView)
        followProfileImageInnerContainerView.addSubview(followProfileImageView)
    }
    
    private func setupConstraints() {
        followProfileContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        followCountTextContainerView.snp.makeConstraints {
            $0.width.height.equalTo(70)
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        
        
        followCountLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        followProfileImageContainerView.snp.makeConstraints {
            $0.width.height.equalTo(80)
            $0.top.equalToSuperview().offset(15)
            $0.centerX.equalToSuperview()
        }
        
        followProfileImageInnerContainerView.snp.makeConstraints {
            $0.width.height.equalTo(76)
            $0.top.leading.equalToSuperview().offset(2)
            $0.bottom.trailing.equalToSuperview().offset(-2)
        }
        
        followProfileImageView.snp.makeConstraints {
            $0.width.height.equalTo(70)
            $0.top.leading.equalToSuperview().offset(3)
            $0.bottom.trailing.equalToSuperview().offset(-3)
        }
        
        followNameLabel.snp.makeConstraints {
            $0.top.equalTo(followProfileImageContainerView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
}
