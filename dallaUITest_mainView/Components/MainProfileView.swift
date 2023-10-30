//
//  MainProfileView.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/15.
//

import UIKit
import SnapKit

class MainProfileView: UIView {
    
    private var isInitialLayout = true
    private var autoScrollTimer: Timer?
    private var displayItems: [DisplayableItem]?
    
    let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.clipsToBounds = false
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .customWhite

        return collectionView
    }()
    
    init(items: [DisplayableItem]) {
        super.init(frame: .zero)
        self.displayItems = items
        preparedisplayItemsForInfiniteScrolling(displayItems)
        setupSubViews()
        setupConstraints()
        setupDelegate()
        registerCell()
        startAutoScrollTimer()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func setupDelegate () {
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
    }
    
    private func registerCell() {
        horizontalCollectionView.register(MainProfileCollectionViewCell.self,
                                                   forCellWithReuseIdentifier: MainProfileCollectionViewCell.id)
    }
    
    private func setupSubViews() {
        addSubview(horizontalCollectionView)

    }
    
    private func setupConstraints() {
        horizontalCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func preparedisplayItemsForInfiniteScrolling(_ items: [DisplayableItem]?) {
        guard let _item = displayItems else { return }
        
        // 무한스크롤을 위해 : 마지막 페이지 + 기존 이미지들 + 처음 페이지
        self.displayItems = [_item.last!] + _item + [_item.first!]
    }
    
    
    func handleInfiniteScrolling(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / frame.width)
        
        if pageIndex == 0 {  // 복제된 마지막 아이템으로 스크롤한 경우
            horizontalCollectionView.scrollToItem(at: IndexPath(item: displayItems!.count - 2, section: 0), at: .centeredHorizontally, animated: false)
        } else if pageIndex == CGFloat(displayItems!.count) - 1 {  // 복제된 첫 번째 아이템으로 스크롤한 경우
            horizontalCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
    
    private func startAutoScrollTimer() {
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }

    @objc private func autoScroll() {
        let currentOffset = horizontalCollectionView.contentOffset
        let targetOffset = CGPoint(x: currentOffset.x + horizontalCollectionView.bounds.width, y: currentOffset.y)
    
        horizontalCollectionView.setContentOffset(targetOffset, animated: true)
    }
}

extension MainProfileView:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout 
{

    // MARK: - UICollectionViewDelegate
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let yOffset = scrollView.contentOffset.y

//        print("<== \(#fileID) - \(#function) - LINE:\(#line) - START yOffset : \(yOffset) ==>")
//        if yOffset < 0 {
//            // 원본 비율 + 당겨진거리 / 100 : '당겨진거리'는 음수이기에 절대값(abs)로 묶음
//            let scaleFactor = 1 + abs(yOffset) / 100
//            print("<== scaleFactor : \(scaleFactor) ==>")
//            mainTopProfileView.mainTopProfileImageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
//        } else {
//            mainTopProfileView.mainTopProfileImageView.transform = .identity
//        }
        
//        if yOffset < 0 {
//            // 원본 비율 + 당겨진거리 / 100 : '당겨진거리'는 음수이기에 절대값(abs)로 묶음
//            let scaleFactor = 1 + abs(yOffset) / 100
//            
//
//            for cell in horizontalCollectionView.visibleCells {
//                if let _cell = cell as? MainProfileCollectionViewCell {
//                    print("<== scaleFactor : \(scaleFactor) ==>")
//                    _cell.mainContainerVIew.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
//                }
//            }
//
//        } else {
//            for cell in horizontalCollectionView.visibleCells {
//                if let _cell = cell as? MainProfileCollectionViewCell {
////                        _cell.mainBackgroundImageView.transform = .identity
//                    _cell.mainContainerVIew.transform = .identity
//                }
//            }
//        }
//    }
    
    /// 사용자가 스크롤 시작시
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        autoScrollTimer?.invalidate()
    }
    
    /// 스크롤애니메이션이 끝날시 ( 사용자에 의한 스크롤 애니메이션은 적용안됨)
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        handleInfiniteScrolling(scrollView)
    }
    
    /// 사용자 스크롤 끝 (애니메이션이까지 끝날떄 발동)
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        handleInfiniteScrolling(scrollView)
        startAutoScrollTimer()
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayItems?.count ?? 0 // 이 부분은 데이터 배열에 따라 수정할 수 있습니다.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainProfileCollectionViewCell.id, for: indexPath) as! MainProfileCollectionViewCell
        
        cell.item = displayItems?[indexPath.row]
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return bounds.size
    }
}


