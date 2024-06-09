//
//  MainViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = AppColor.grey01.uiColor
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainPageTableViewCell.self, forCellReuseIdentifier: MainPageTableViewCell.identifier)
        return tableView
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
        
        view.backgroundColor = AppColor.grey01.uiColor
        setupViews()
        setupConstraints()
        tableView.showsVerticalScrollIndicator = false
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

extension MainViewController {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        
        [searchBar, tableView].forEach {
            view.addSubview($0)
        }
        [avatarView, buttonsView].forEach {
            navigationController?.navigationBar.addSubview($0)
        }
        [avatarIcon, greetingLabel, dateLabel, bonusLabel].forEach {
            avatarView.addSubview($0)
        }
        [messageButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        avatarView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
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
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(94)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-6)
            make.leading.trailing.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainPageTableViewCell.identifier, for: indexPath) as? MainPageTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height
    }
}
