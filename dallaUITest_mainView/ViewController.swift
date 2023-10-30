//
//  ViewController.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    // MARK: - Properties
    private let followListData = Repository.followListData
    private let liveStreamingInfoData = Repository.liveStreamingInfoData
    private let maxFollowDisplayCount = 11
    
    // MARK: - UI Components
    // MARK: 네비게이션바 Components
    private let navigationRightBarButtonItemContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView

    }()
    
    private let storeBarButtonItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "btnStoreW")!.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    private let rankingBarButtonItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "btnRankingW")!.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    private let messageBarButtonItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "btnMessageW")!.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    private let alarmBarButtonItem: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "btnAlarmW")!.withRenderingMode(.alwaysOriginal), for: .normal)
        
        return button
    }()
    
    // MARK: 메인뷰 Components
    private var mainTopProfileView: MainProfileView!
    private var userRankingListVIew: UserListVIew!
    private var tipBarVIew: ThinBannerBar!
    private var userNewBjListVIew: UserListVIew!
    private var adBannerWideView: PagedImageView!
    private var liveStreamCategoryBar: RadioButtonBar!
    private var stickyliveStreamCategoryBar: RadioButtonBar!
        
    private var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
        
    private let mainVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .yellow
        stackView.insetsLayoutMarginsFromSafeArea = true
        stackView.axis = .vertical
        return stackView
    }()
    
    private let followListContainerCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10 // cell사이의 간격 설정
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .customWhite
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 19)
        return collectionView
    }()
    
    private let liveStreamingOnTitleLabelContainerVIew: UIView = {
        let view = UIView()
        view.backgroundColor = .customWhite
        return view
    }()
    
    private var liveStreamingOnTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SUIT-SemiBold", size: 19)
        label.textColor = UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0)
        label.text = "🚀 지금 라이브 중!"
        label.addCharacterSpacing(kernValue: -0.57)
        
        return label
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        setupUI()
        registerCell()
        setupDelegate()
        setupNavigationbar()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(#function)
    }
    
    private func setupNavigationbar() {
        let logoImage = UIImage(named: "dallaLogo")?.withRenderingMode(.alwaysOriginal)
        let imageView = UIImageView(image: logoImage)
        imageView.alpha = 0.5 // 원하는 투명도로 설정합니다. 예: 0.5
        let titleBarButtonItem = UIBarButtonItem(customView: imageView)
        
        navigationRightBarButtonItemContainerStackView.addArrangedSubview(storeBarButtonItem)
        navigationRightBarButtonItemContainerStackView.addArrangedSubview(rankingBarButtonItem)
        navigationRightBarButtonItemContainerStackView.addArrangedSubview(messageBarButtonItem)
        navigationRightBarButtonItemContainerStackView.addArrangedSubview(alarmBarButtonItem)

        let rightBarButton = UIBarButtonItem(customView: navigationRightBarButtonItemContainerStackView)
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.tintColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
//        self.navigationController?.navigationBar.tintColor = .red
//        self.navigationController?.navigationBar.backgroundColor = .red
//        self.view.safeAreaLayoutGuide
        navigationItem.leftBarButtonItem = titleBarButtonItem
        navigationItem.rightBarButtonItem = rightBarButton
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = nil
        navigationBarAppearance.configureWithTransparentBackground()
        
        self.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
    }
    
    
    private func setupUI() {
        view.backgroundColor = .white
        
        mainTopProfileView = MainProfileView(items: Repository.mainTopProfileData)
        userRankingListVIew = UserListVIew(items: Repository.userRankingTop10Data, title: "🏆 NOW TOP 10")
        userNewBjListVIew = UserListVIew(items: Repository.userNewBjData, title: "🌱 NEW BJ", isNewBJ: true)
        tipBarVIew = ThinBannerBar()
        adBannerWideView = PagedImageView(imageViews: [UIImage(named: "adBanner01")!, UIImage(named: "adBanner02")!, UIImage(named: "adBanner03")!])
        liveStreamCategoryBar = RadioButtonBar(buttonTitles: ["전체", "VIDEO", "RADIO", "신입DJ"])
        stickyliveStreamCategoryBar = RadioButtonBar(buttonTitles: ["전체", "VIDEO", "RADIO", "신입DJ"])
        
        // 두 RadioButtonBar 인스턴스의 선택 상태를 동기화하기 위한 설정
        liveStreamCategoryBar.selectedButtonIndex = 0 // 초기선택버튼
        stickyliveStreamCategoryBar.selectedButtonIndex = liveStreamCategoryBar.selectedButtonIndex

        // 선택 상태가 변경될 때마다 호출될 클로저 설정
        liveStreamCategoryBar.selectionChanged = { [weak self] index in
            self?.stickyliveStreamCategoryBar.selectedButtonIndex = index
        }
        stickyliveStreamCategoryBar.selectionChanged = { [weak self] index in
            self?.liveStreamCategoryBar.selectedButtonIndex = index
        }
        
        stickyliveStreamCategoryBar.isHidden = true
        
        view.addSubview(mainTableView)
        view.addSubview(stickyliveStreamCategoryBar)
        
        mainVerticalStackView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 933 + 231 - 7 + 24 + 62)
        
        mainTableView.register(VerticalListTableViewCell.self, forCellReuseIdentifier: VerticalListTableViewCell.id)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.tableHeaderView = mainVerticalStackView
        
        liveStreamingOnTitleLabelContainerVIew.addSubview(liveStreamingOnTitleLabel)
        mainVerticalStackView.addArrangedSubviews(views: [mainTopProfileView,
                                                          followListContainerCollectionView,
                                                          userRankingListVIew,
                                                          tipBarVIew,
                                                          userNewBjListVIew,
                                                          adBannerWideView,
                                                          liveStreamingOnTitleLabelContainerVIew,
                                                          liveStreamCategoryBar
                                                         ])

    }
    
    private func setupConstraints() {
        mainTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainTopProfileView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(375)
        }

        followListContainerCollectionView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(139)
        }
        
        userRankingListVIew.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(231)
        }
        
        tipBarVIew.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(25 + 24)
        }
        
        userNewBjListVIew.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(224)
        }
        adBannerWideView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(115)
        }
        
        stickyliveStreamCategoryBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        liveStreamingOnTitleLabelContainerVIew.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(62)
        }
        
        liveStreamingOnTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-4)
        }
        
        liveStreamCategoryBar.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(48)
        }
    }

    private func setupDelegate() {
        followListContainerCollectionView.delegate = self
        followListContainerCollectionView.dataSource = self
    }
    
    private func registerCell() {
        followListContainerCollectionView.register(FollowListCollectionViewCell.self,
                                                   forCellWithReuseIdentifier: FollowListCollectionViewCell.id)
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView is UICollectionView { return }
        
        let yOffset = scrollView.contentOffset.y

//        print("<== \(#fileID) - \(#function) - LINE:\(#line) - START yOffset : \(yOffset) ==>")
//        if yOffset < 0 {
//            // 원본 비율 + 당겨진거리 / 100 : '당겨진거리'는 음수이기에 절대값(abs)로 묶음
//            let scaleFactor = 1 + abs(yOffset) / 100
//            print("<== scaleFactor : \(scaleFactor) ==>")
//            mainTopProfileView.mainTopProfileImageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
//        } else {
//            mainTopProfileView.mainTopProfileImageView.transform = .identity
//        }
        
        if yOffset < 0 {
            // 원본 비율 + 당겨진거리 / 100 : '당겨진거리'는 음수이기에 절대값(abs)로 묶음
            let scaleFactor = 1 + abs(yOffset) / 100


            for cell in mainTopProfileView.horizontalCollectionView.visibleCells {
                if let _cell = cell as? MainProfileCollectionViewCell {
                    print("<== scaleFactor : \(scaleFactor) ==>")
                    _cell.mainBackgroundImageView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
                }
            }

        } else {
            for cell in mainTopProfileView.horizontalCollectionView.visibleCells {
                if let _cell = cell as? MainProfileCollectionViewCell {
                    _cell.mainBackgroundImageView.transform = .identity
                }
            }
        }
        
        // contentOffset.y: 손가락을 위로 올리면 + 값, 손가락을 아래로 내리면 - 값
//        print(scrollView.contentOffset.y, liveStreamCategoryBar.frame.minY)
//        print(yOffset, liveStreamCategoryBar.frame.origin.y, liveStreamCategoryBar.frame.size.height, view.safeAreaInsets.top)
        let opacity = min((yOffset - mainTopProfileView.frame.height / 2) / 100, 1.0)
        
        print(yOffset, mainTopProfileView.frame.height / 2, opacity)
        
        if yOffset > mainTopProfileView.frame.height / 2 {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: opacity)
            self.navigationItem.leftBarButtonItem?.customView?.alpha = opacity
        } else {
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 0.0)
            self.navigationItem.leftBarButtonItem?.customView?.alpha = 0.0
        }
        
        if opacity <= 0.8  {
            storeBarButtonItem.setImage(UIImage(named: "btnStoreW")!.withRenderingMode(.alwaysOriginal), for: .normal)
            rankingBarButtonItem.setImage(UIImage(named: "btnRankingW")!.withRenderingMode(.alwaysOriginal), for: .normal)
            messageBarButtonItem.setImage(UIImage(named: "btnMessageW")!.withRenderingMode(.alwaysOriginal), for: .normal)
            alarmBarButtonItem.setImage(UIImage(named: "btnAlarmW")!.withRenderingMode(.alwaysOriginal), for: .normal)
            
        } else {
            storeBarButtonItem.setImage(UIImage(named: "btnStoreB")!.withRenderingMode(.alwaysOriginal), for: .normal)
            rankingBarButtonItem.setImage(UIImage(named: "btnRankingB")!.withRenderingMode(.alwaysOriginal), for: .normal)
            messageBarButtonItem.setImage(UIImage(named: "btnMessageB")!.withRenderingMode(.alwaysOriginal), for: .normal)
            alarmBarButtonItem.setImage(UIImage(named: "btnAlarmB")!.withRenderingMode(.alwaysOriginal), for: .normal)
            
        }
        let shouldShowSticky = yOffset >= liveStreamCategoryBar.frame.origin.y - view.safeAreaInsets.top
        stickyliveStreamCategoryBar.isHidden = !shouldShowSticky
    }
}

extension ViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    // MARK: - UICollectionViewDelegateFlowLayout
    /// 각 아이템 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case followListContainerCollectionView:
            let dataCount = followListData.count > maxFollowDisplayCount ? maxFollowDisplayCount : followListData.count
            
            if indexPath.row == dataCount - 1 && followListData.count > maxFollowDisplayCount - 1 {
                return CGSize(width: 70, height: collectionView.frame.height)
            }
            return CGSize(width: 80, height: collectionView.frame.height)

        default:
            return CGSize(width: 100, height: 100)
        }
        
    }
    
    // MARK: - UICollectionViewDataSource
    /// 전체 아이템수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case followListContainerCollectionView:
            return followListData.count > maxFollowDisplayCount ? maxFollowDisplayCount : followListData.count

        default:
            return 0
        }
    }

    // MARK: - UICollectionViewDataSource
    /// 각 아이템 속성 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case followListContainerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowListCollectionViewCell.id, for: indexPath) as! FollowListCollectionViewCell
            let dataCount = followListData.count > maxFollowDisplayCount ? maxFollowDisplayCount : followListData.count
            let undisplayedFollowCount = followListData.count - (maxFollowDisplayCount - 1)
            
            if indexPath.row == dataCount - 1 && followListData.count > maxFollowDisplayCount - 1 {
                cell.configureForLastCell(undisplayedFollowCount)
                return cell
            }
            
            cell.followData = followListData[indexPath.row]
            return cell

        default:
            fatalError("Unknown collectionView instance")
        }
        
        
    }
}

extension ViewController:
    UITableViewDataSource,
    UITableViewDelegate {

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(VerticalListTableViewCell.id,"numberOfRowsInSection")
        return liveStreamingInfoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VerticalListTableViewCell.id, for: indexPath) as! VerticalListTableViewCell
        
        cell.item = liveStreamingInfoData[indexPath.row]
        
        return cell
    }

    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
        

}
