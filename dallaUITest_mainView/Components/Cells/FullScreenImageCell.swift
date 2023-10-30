//
//  FullScreenImageCell.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/15.
//

import UIKit
import SnapKit

class FullScreenImageCollectionViewCell: UICollectionViewCell {
    
    static var id: String { return NSStringFromClass(self).components(separatedBy: ".").last! }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupSubViews() {
        contentView.addSubview(imageView)
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
