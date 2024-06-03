//
//  TabBarController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController, UISearchBarDelegate {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = AppColor.white.uiColor
        setUpTabs()
    }
    
    // MARK: - Private
    
    private func setUpTabs() {
        
        let mainVC = MainViewController()
        let qrVC = QRViewController()
        let accountsVC = AccountsViewController()
        let menuVC = MenuViewController()
        
        mainVC.navigationItem.largeTitleDisplayMode = .never
        qrVC.navigationItem.largeTitleDisplayMode = .never
        accountsVC.navigationItem.largeTitleDisplayMode = .never
        menuVC.navigationItem.largeTitleDisplayMode = .never
        
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: qrVC)
        let nav3 = UINavigationController(rootViewController: accountsVC)
        let nav4 = UINavigationController(rootViewController: menuVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Main",
                                       image: AppImage.tab_main.uiImage,
                                       tag: 1)
        
        nav2.tabBarItem = UITabBarItem(title: "Halyk QR",
                                       image: AppImage.tab_qr.uiImage,
                                       tag: 2)
        
        nav3.tabBarItem = UITabBarItem(title: "Счета",
                                       image: AppImage.tab_accounts.uiImage,
                                       tag: 3)
        
        nav4.tabBarItem = UITabBarItem(title: "Меню",
                                       image: AppImage.tab_menu.uiImage,
                                       tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = AppColor.grey01.uiColor
        navigationBarAppearance.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25, weight: .medium)
        ]
        
        UITabBar.appearance().tintColor = AppColor.green01.uiColor
        UITabBar.appearance().unselectedItemTintColor = AppColor.grey02.uiColor
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
    }
}
