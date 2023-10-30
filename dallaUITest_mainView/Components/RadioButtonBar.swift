//
//  RadioButtonBar.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/13.
//

import UIKit
import SnapKit

class RadioButtonBar: UIStackView {
    
    private var buttons: [UIButton] = []
    private var containerViews: [UIView] = []
    private var underLines: [UIView] = []
    
    var selectionChanged: ((Int) -> Void)?
    
    var selectedButtonIndex: Int? {
        didSet {
            updateButtonSelections()
        }
    }
    
    init(buttonTitles: [String]) {
        super.init(frame: .zero)
        self.backgroundColor = .customWhite
        self.axis = .horizontal
        self.distribution = .fillEqually
        
        setupButtons(with: buttonTitles)
        setupConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupButtons(with buttonTitles: [String]) {
        buttonTitles.forEach { title in
            let containerView = UIView()
            let button = UIButton()
            let underLineView = UIView()
            
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont(name: "SUIT-Bold", size: 16)
            button.setTitleColor(UIColor(red: 172.0/255.0, green: 172.0/255.0, blue: 172.0/255.0, alpha: 1.0), for: .normal)
            button.setTitleColor(UIColor(red: 32.0/255.0, green: 32.0/255.0, blue: 32.0/255.0, alpha: 1.0), for: .selected)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                        
            underLineView.layer.cornerRadius = 5 / 2
            underLineView.backgroundColor = UIColor(red: 255.0/255.0, green: 60.0/255.0, blue: 123.0/255.0, alpha: 1.0)
            underLineView.isHidden = true
            
            containerView.addSubview(button)
            containerView.addSubview(underLineView)
            
            addArrangedSubview(containerView)
            
            buttons.append(button)
            underLines.append(underLineView)
            containerViews.append(containerView)
        }
    }
    
    private func setupConstraints() {
        for (index, button) in buttons.enumerated() {
            button.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.height.equalTo(20)
            }
            
            underLines[index].snp.makeConstraints {
                $0.top.equalTo(buttons[index].snp.bottom).offset(4)
                $0.centerX.equalToSuperview()
                $0.width.equalTo(30)
                $0.height.equalTo(5)
            }
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        if let index = buttons.firstIndex(of: sender) {
            selectedButtonIndex = index
            selectionChanged?(index)
        }
    }
    
    private func updateButtonSelections() {
        for (index, button) in buttons.enumerated() {
            button.isSelected = index == selectedButtonIndex
            underLines[index].isHidden = index != selectedButtonIndex
        }
    }
}
