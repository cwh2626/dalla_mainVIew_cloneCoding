//
//  MainTabBarController.swift
//  dallaUITest_mainView
//
//  Created by Mac on 2023/10/10.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad(){
        super.viewDidLoad()

        let tabOne = UINavigationController(rootViewController: ViewController()) // 뷰컨 품은 네비게이션 컨트롤러
        let tabOneBarItem = UITabBarItem(title: "", image: UIImage(named: "footerLive")?.withRenderingMode(.alwaysOriginal), tag: 0)
        tabOne.tabBarItem = tabOneBarItem

        let tabTwo = UINavigationController(rootViewController: OtherVIewController()) // 뷰컨 품은 네비게이션 컨트롤러
        let tabTwoBarItem = UITabBarItem(title: "", image: UIImage(named: "footerClipD")?.withRenderingMode(.alwaysOriginal), tag: 1)
        tabTwo.tabBarItem = tabTwoBarItem
        
        let tabThree = OtherVIewController() // 뷰컨 품은 네비게이션 컨트롤러
        let tabThreeBarItem = UITabBarItem(title: "", image: UIImage(named: "footerPlus")?.withRenderingMode(.alwaysOriginal), tag: 2)
        tabThree.tabBarItem = tabThreeBarItem

        let tabFour = UINavigationController(rootViewController: OtherVIewController())
        let tabFourBarItem = UITabBarItem(title: "", image: UIImage(named: "footerSearchD")?.withRenderingMode(.alwaysOriginal), tag: 3)
        tabFour.tabBarItem = tabFourBarItem

        let tabFive = UINavigationController(rootViewController: OtherVIewController())
        let tabFiveBarItem = UITabBarItem(title: "", image: UIImage(named: "footerMyD")?.withRenderingMode(.alwaysOriginal), tag: 4)
        tabFive.tabBarItem = tabFiveBarItem
        
        
        
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
            self.tabBar.scrollEdgeAppearance = tabBarAppearance
//            self.tabBar.standardAppearance = tabBarAppearance
        } else {
            self.tabBar.isTranslucent = false
            self.tabBar.backgroundColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        }

        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour, tabFive]
    }
       
}
