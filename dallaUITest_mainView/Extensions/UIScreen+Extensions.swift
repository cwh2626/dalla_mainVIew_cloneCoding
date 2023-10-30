//
//  UIScreen+Extensions.swift
//  dallaUITest_mainView
//
//  Created by 조웅희 on 2023/10/15.
//

import UIKit

extension UIScreen {
    
    /// UIScreen.main 의 Deprecated 인한 대용
    static var mainWidth: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.screen.bounds.width ?? 0
    }

    static var mainHeight: CGFloat {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.screen.bounds.height ?? 0
    }
}
