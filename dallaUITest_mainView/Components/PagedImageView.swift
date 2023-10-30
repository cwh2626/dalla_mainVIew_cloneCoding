//
//  PagedImageView.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/13.
//

import UIKit
import SnapKit

class PagedImageView: UIView {
    private var isInitialLayout = true
    private var autoScrollTimer: Timer?
    private var images: [UIImage] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .customWhite
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let pageIndicatorContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        view.layer.cornerRadius = 20 / 2
        view.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMinXMaxYCorner) //CACornerMask ios 11 이상
        return view
    }()
    
    private let pageIndicatorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .customWhite
        label.font = UIFont(name: "SUIT-Medium", size: 13)
        label.clipsToBounds = true
        return label
    }()
    
    private let bannerArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bannerArrow")
        return imageView
    }()
    
    init(imageViews: [UIImage]) {
        super.init(frame: .zero)
        registerCell()
        setupDelegate()
        setupSubViews()
        setupConstraints()
        prepareImagesForInfiniteScrolling(imageViews)
        startAutoScrollTimer()        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isInitialLayout {
            collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
            isInitialLayout = false
        }
    }
    
    private func setupSubViews() {
        addSubview(collectionView)
        addSubview(pageIndicatorContainerView)
        
        pageIndicatorContainerView.addSubview(pageIndicatorLabel)
        pageIndicatorContainerView.addSubview(bannerArrowImageView)
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pageIndicatorContainerView.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-15)
        }
        
        pageIndicatorLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(8)
            $0.top.equalToSuperview().offset(2)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        bannerArrowImageView.snp.makeConstraints {
            $0.leading.equalTo(pageIndicatorLabel.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().offset(-4)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func setupDelegate () {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCell() {
        collectionView.register(FullScreenImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: FullScreenImageCollectionViewCell.id)
    }
    
    private func startAutoScrollTimer() {
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(autoScroll), userInfo: nil, repeats: true)
    }

    @objc private func autoScroll() {
        let currentOffset = collectionView.contentOffset
        let targetOffset = CGPoint(x: currentOffset.x + collectionView.bounds.width, y: currentOffset.y)
    
        collectionView.setContentOffset(targetOffset, animated: true)
    }
    
    func handleInfiniteScrolling(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / frame.width)
        
        if pageIndex == 0 {  // 복제된 마지막 아이템으로 스크롤한 경우
            collectionView.scrollToItem(at: IndexPath(item: images.count - 2, section: 0), at: .centeredHorizontally, animated: false)
        } else if pageIndex == CGFloat(images.count) - 1 {  // 복제된 첫 번째 아이템으로 스크롤한 경우
            collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
    
    private func prepareImagesForInfiniteScrolling(_ images: [UIImage]) {
        guard !images.isEmpty else { return }
        
        // 무한스크롤을 위해 : 마지막 페이지 + 기존 이미지들 + 처음 페이지
        self.images = [images.last!] + images + [images.first!]
    }

    private func updatePageIndicator(currentPage: Int) {
        let actualCount = images.count - 2
        var actualPage = currentPage

        if currentPage == 0 {  // 앞에 추가한 마지막 페이지의 경우
           actualPage = actualCount
        } else if currentPage == images.count - 1 {  // 뒤에 추가한 첫 페이지의 경우
           actualPage = 1
        } else {
           actualPage = currentPage - 1
        }

        pageIndicatorLabel.text = "\(actualPage + 1) / \(actualCount)"
        
    }
}

extension PagedImageView:
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    // MARK: - UICollectionViewDelegate
    
    /// 스크롤중
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / frame.width)
        updatePageIndicator(currentPage: Int(pageIndex))
    }
    
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
        print(FullScreenImageCollectionViewCell.id,"numberOfItemsInSection")
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullScreenImageCollectionViewCell.id, for: indexPath) as! FullScreenImageCollectionViewCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
