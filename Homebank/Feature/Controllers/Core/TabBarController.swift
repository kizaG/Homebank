//
//  TabBarController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit

final class TabBarController: UITabBarController {
    
    // MARK: - UI
    
    let searchController = UISearchController()
    
    private lazy var navigationView: NavigationBarView = {
        let view = NavigationBarView()
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = AppColor.white.uiColor
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Поиск по Халык банк"
        
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        setUpTabs()
        setupNavBar()
    }
    
    // MARK: - Private
    
    private func setUpTabs() {
        
        let mainVC = MainViewController()
        let qrVC = QRViewController()
        let accountsVC = AccountsViewController()
        let menuVC = MenuViewController()
        
        mainVC.navigationItem.largeTitleDisplayMode = .automatic
        qrVC.navigationItem.largeTitleDisplayMode = .automatic
        accountsVC.navigationItem.largeTitleDisplayMode = .automatic
        menuVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let nav1 = UINavigationController(rootViewController: mainVC)
        let nav2 = UINavigationController(rootViewController: qrVC)
        let nav3 = UINavigationController(rootViewController: accountsVC)
        let nav4 = UINavigationController(rootViewController: menuVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Main",
                                       image: AppImage.main.uiImage,
                                       tag: 1)
        
        nav2.tabBarItem = UITabBarItem(title: "Halyk QR",
                                       image: AppImage.qr.uiImage,
                                       tag: 2)
        
        nav3.tabBarItem = UITabBarItem(title: "Счета",
                                       image: AppImage.accounts.uiImage,
                                       tag: 3)
        
        nav4.tabBarItem = UITabBarItem(title: "Меню",
                                       image: AppImage.menu.uiImage,
                                       tag: 4)
        
        for nav in [nav1, nav2, nav3, nav4] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        UITabBar.appearance().tintColor = AppColor.green01.uiColor
        UITabBar.appearance().unselectedItemTintColor = AppColor.grey02.uiColor
        
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
    }
    
    private func setupNavBar() {
//        self.navigationItem.rightBarButtonItems = [
//            UIBarButtonItem(image: UIImage(systemName: "bell"),
//                            style: .plain,
//                            target: self,
//                            action: #selector(notificationButtonTapped)),
//            UIBarButtonItem(image: UIImage(systemName: "ellipsis.message"),
//                            style: .plain,
//                            target: self,
//                            action: #selector(messageButtonTapped)),
//        ]
//
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: avatarView)
    }
    
}
