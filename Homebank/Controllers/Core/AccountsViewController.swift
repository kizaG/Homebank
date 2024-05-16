//
//  AccountsViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit

final class AccountsViewController: UIViewController {
    
    // MARK: - UI
    
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
    
    func setupViews() {
        [buttonsView].forEach {
            navigationController?.navigationBar.addSubview($0)
        }
        [historyButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
    }
    
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
    }
}
