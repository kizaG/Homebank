//
//  AccountsViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

final class AccountsViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = AppColor.grey01.uiColor
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = AppColor.grey01.uiColor
        tableView.allowsSelection = false
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AccountsTableViewCell.self, forCellReuseIdentifier: AccountsTableViewCell.identifier)
        tableView.register(AccountsInfoTableViewCell.self, forCellReuseIdentifier: AccountsInfoTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_history.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_bell.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColor.grey01.uiColor
        setupViews()
        setupConstraints()
        title = "Счета"
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont(name: "ArialMT", size: 30) ?? UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    // MARK: - Action
    
    @objc
    func historyButtonTapped() {
        print("history button tapped")
    }
    
    @objc
    func notificationButtonTapped() {
        print("notification button tapped")
    }
}

extension AccountsViewController {
    
    // MARK: - Setup Views
    
    func setupViews() {
        
        [tableView].forEach {
            view.addSubview($0)
        }
        [buttonsView].forEach {
            navigationController?.navigationBar.addSubview($0)
        }
        [historyButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        buttonsView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        historyButton.snp.makeConstraints { make in
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
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}

extension AccountsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionCounts: [Int: Int] = [
            0: 1,
            1: 2,
            2: 4,
            3: 1
        ]
        return sectionCounts[section] ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountsTableViewCell.identifier, for: indexPath) as? AccountsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountsInfoTableViewCell.identifier, for: indexPath) as? AccountsInfoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.frame.height
        }
        
        return 80
    }
}
