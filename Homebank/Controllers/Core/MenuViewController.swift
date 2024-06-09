//
//  MenuViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

final class MenuViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_message.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_bell.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var avatarView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var avatarIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.avatar.uiImage
        return imageView
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Нурдана\nЕрмаханова"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var verifyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppImage.menu_verified.rawValue)
        return imageView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = AppColor.grey01.uiColor
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
        title = "Меню"
        view.backgroundColor = AppColor.grey01.uiColor
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
}

extension MenuViewController {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [avatarView, searchBar].forEach {
            view.addSubview($0)
        }
        [buttonsView].forEach {
            navigationController?.navigationBar.addSubview($0)
        }
        [messageButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
        [avatarIcon, greetingLabel, verifyImageView].forEach {
            avatarView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        buttonsView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
            
        }
        
        messageButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(notificationButton.snp.leading).offset(-16)
            make.size.equalTo(28)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(28)
        }
        
        avatarView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(300)
            make.height.equalTo(60)
        }
        
        avatarIcon.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview()
            make.size.equalTo(60)
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(avatarIcon.snp.trailing).offset(20)
        }
        
        verifyImageView.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.bottom.equalToSuperview().offset(-5)
            make.leading.equalTo(greetingLabel.snp.trailing).offset(10)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(avatarView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
    }
}

