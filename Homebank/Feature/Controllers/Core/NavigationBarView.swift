//
//  CustomNavigationBar.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 12.05.2024.
//

import UIKit

final class NavigationBarView: UINavigationBar {
    
    // MARK: - UI
    
    private lazy var navigationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var avatarView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
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
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis.message"), for: .normal)
        //        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        //        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Action
    
    @objc
    func messageButtonTapped() {
        print("message button tapped")
    }
    
    @objc
    func notificationButtonTapped() {
        print("notification button tapped")
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private

private extension NavigationBarView {
    
    // MARK: - Setup Views
    
    func setupViews() {
        [avatarView, buttonsStackView].forEach {
            navigationStackView.addArrangedSubview($0)
        }
        [avatarIcon, greetingLabel, dateLabel, bonusLabel].forEach {
            avatarView.addSubview($0)
        }
        [messageButton, notificationButton].forEach {
            buttonsStackView.addArrangedSubview($0)
        }
    }
    
    // MARK: - Setup Connstraints
    
    func setupConstraints() {
        avatarIcon.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
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
        
        messageButton.snp.makeConstraints { make in
            make.size.equalTo(28)
        }

        notificationButton.snp.makeConstraints { make in
            make.size.equalTo(28)
        }
    }
}
