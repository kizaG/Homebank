//
//  TabBarController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

final class TabBarController: UITabBarController, UISearchBarDelegate {
    
    // MARK: - UI
    
    private lazy var avatarView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        return view
    }()
    
    private lazy var avatarIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.avatar.uiImage
        return imageView
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет Нурдана!"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Вт. 20 апреля"
        label.textColor = AppColor.grey02.uiColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private lazy var bonusLabel: UILabel = {
        let label = UILabel()
        label.text = "597.01 b"
        label.textColor = AppColor.green01.uiColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    private lazy var buttonsView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 44))
        return view
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.message"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = AppColor.grey03.uiColor
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: AppColor.black.uiColor.withAlphaComponent(0.5)
            ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск по Халык банк", attributes: placeholderAttributes)
        searchBar.setScopeBarButtonTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
        searchBar.searchTextField.textColor = AppColor.black.uiColor
        searchBar.searchTextField.leftView?.tintColor = AppColor.black.uiColor.withAlphaComponent(0.5)
        searchBar.searchTextField.rightView?.tintColor = AppColor.black.uiColor.withAlphaComponent(0.5)
        return searchBar
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = AppColor.white.uiColor
        setUpTabs()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Action
    
    @objc
    func messageButtonTapped() {
        print("message button tapped")
    }
    
    @objc
    func notificationButtonTapped() {
        print("notification button tapped")
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
}

// MARK: - Private

private extension TabBarController {
    
    // MARK: - Setup Views
    
    func setupViews() {
        [avatarView, buttonsView, searchBar].forEach {
            view.addSubview($0)
        }
        [avatarIcon, greetingLabel, dateLabel, bonusLabel].forEach {
            avatarView.addSubview($0)
        }
        [messageButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
    }
    
    // MARK: - Setup Connstraints
    
    func setupConstraints() {
        
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(searchBar.snp.leading).offset(8)
            make.width.equalTo(200)
        }
        
        avatarIcon.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(44)
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(avatarIcon.snp.trailing).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.leading.equalTo(avatarIcon.snp.trailing).offset(10)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.leading.equalTo(dateLabel.snp.trailing).offset(8)
        }
        
        buttonsView.snp.makeConstraints { make in
            make.centerY.equalTo(avatarIcon.snp.centerY)
            make.leading.equalTo(avatarView.snp.trailing).offset(60)
            make.trailing.equalTo(searchBar.snp.trailing).offset(-8)
        }
        
        messageButton.snp.makeConstraints { make in
            make.trailing.equalTo(notificationButton.snp.leading).offset(-16)
            make.size.equalTo(28)
        }

        notificationButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(28)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(avatarView.snp.bottom)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}
