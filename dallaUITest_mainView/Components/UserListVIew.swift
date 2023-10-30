//
//  UserRankingListVIew.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/12.
//

import UIKit
import SnapKit

class UserListVIew: UIView {
    
    private var isNewBJ: Bool!
    private var displayItems: [DisplayableItem]?
    
    private let topBarContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.customWhite
        return view
    }()
    
    private let topBarTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-SemiBold", size: 19)
        label.textColor = UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        
        return label
    }()
    
    private var topBarVIconImageView: UIImageView?

    private var topBarRadioButtonContainerStackView: UIStackView?
    
    private let bjRadioButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("BJ", for: .normal)
        button.titleLabel?.font =  UIFont(name: "SUIT-SemiBold", size: 13)
        button.setTitleColor(UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0), for: .highlighted)
        

        return button
    }()
    
    private let fanRadioButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("FAN", for: .normal)
        button.titleLabel?.font =  UIFont(name: "SUIT-SemiBold", size: 13)
        button.setTitleColor(UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0), for: .highlighted)
        return button
    }()
    
    private let teamRadioButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("TEAM", for: .normal)
        button.titleLabel?.font =  UIFont(name: "SUIT-SemiBold", size: 13)
        button.setTitleColor(UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0), for: .normal)
        button.setTitleColor(UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0), for: .highlighted)
        return button
    }()
    
    let horizontalListCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 8 // cell사이의 간격 설정
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .customWhite
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return collectionView
    }()
    
    init(items: [DisplayableItem], title: String, isNewBJ: Bool = false) {
        super.init(frame: .zero)
        self.displayItems = items
        self.isNewBJ = isNewBJ
        self.topBarTitleLabel.text = title
        
        initUIComponents()
        setupSubViews()
        setupConstraints()
        setupDelegate()
        registerCell()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
            
    func setupDelegate () {
        horizontalListCollectionView.delegate = self
        horizontalListCollectionView.dataSource = self
    }
    
    private func registerCell() {
        horizontalListCollectionView.register(HorizontalListCollectionViewCell.self,
                                                   forCellWithReuseIdentifier: HorizontalListCollectionViewCell.id)
    }
    
//    private func configure(_ data: TopMainProfile) {
//
//    }
    
    private func initUIComponents() {
        if !isNewBJ {
            topBarVIconImageView = UIImageView(image: UIImage(named: "vIcon"))
                    
            let stackview = UIStackView()
            stackview.backgroundColor = .customWhite
            stackview.alignment = .center
            stackview.spacing = 10
            topBarRadioButtonContainerStackView = stackview
        }
    }
    
    private func setupSubViews() {
        addSubview(topBarContainerView)
        addSubview(horizontalListCollectionView)
        
        
        topBarContainerView.addSubview(topBarTitleLabel)
        
        if let _topBarVIconImageView = topBarVIconImageView {
            topBarContainerView.addSubview(_topBarVIconImageView)
        }
        
        
        if let _topBarRadioButtonContainerStackView = topBarRadioButtonContainerStackView {
            topBarContainerView.addSubview(_topBarRadioButtonContainerStackView)
            
            _topBarRadioButtonContainerStackView.addArrangedSubviews(
                views: [bjRadioButton,
                        fanRadioButton,
                        teamRadioButton],
                includeSeparators: true
            )
            
        }
        
    }
    
    
    
    private func setupConstraints() {
        topBarContainerView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(26)
        }
        
        topBarTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(26)
        }
        
        if let _topBarVIconImageView = topBarVIconImageView {
            _topBarVIconImageView.snp.makeConstraints {
                $0.top.equalToSuperview().offset(1)
                $0.leading.equalTo(topBarTitleLabel.snp.trailing).offset(1)
                $0.width.height.equalTo(24)
            }
        }
        
        if let _topBarRadioButtonContainerStackView = topBarRadioButtonContainerStackView {
            _topBarRadioButtonContainerStackView.snp.makeConstraints {
                $0.top.equalToSuperview().offset(4)
                $0.bottom.equalToSuperview().offset(-4)
                $0.trailing.equalToSuperview().offset(-16)
                $0.height.equalTo(18)
            }
        }
        
        horizontalListCollectionView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(topBarContainerView.snp.bottom)
            $0.width.equalToSuperview()
            $0.height.equalTo(205)
        }
    }
}

extension UserListVIew:
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    // MARK: - UICollectionViewDelegateFlowLayout
    /// 각 아이템 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 116, height: collectionView.frame.height)
    }
    
    // MARK: - UICollectionViewDataSource
    /// 전체 아이템수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayItems?.count ?? 0
    }

    /// 각 아이템 속성 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalListCollectionViewCell.id, for: indexPath) as! HorizontalListCollectionViewCell
        cell.item = displayItems?[indexPath.row]
        return cell
    }
}
