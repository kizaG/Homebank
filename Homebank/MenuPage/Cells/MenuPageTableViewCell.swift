//
//  MenuPageTableViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.06.2024.
//

import UIKit
import SnapKit

final class MenuPageTableViewCell: UITableViewCell {
    
    static let identifier = "MenuPageTableViewCell"
    
    // MARK: - UI
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.menu_settings.uiImage
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 8
        imageView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
        return imageView
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Профиль и настройки"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var extraLabel: UILabel = {
        let label = UILabel()
        label.text = "Настройки и безопасность"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = AppColor.grey02.uiColor
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = AppColor.grey01.uiColor
        contentView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MenuPageTableViewCell {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [infoView].forEach {
            contentView.addSubview($0)
        }
        [iconImageView, mainLabel, extraLabel].forEach {
            infoView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        infoView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(48)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.top)
            make.leading.equalTo(iconImageView.snp.trailing).offset(5)
        }
        
        extraLabel.snp.makeConstraints { make in
            make.bottom.equalTo(iconImageView.snp.bottom).offset(-5)
            make.leading.equalTo(mainLabel.snp.leading)
        }
    }
    
    func configureExit() {
        self.iconImageView.image = AppImage.menu_exit.uiImage
        self.infoView.backgroundColor = AppColor.grey01.uiColor
        self.mainLabel.text = "Выйти"
        self.mainLabel.textColor = AppColor.red01.uiColor
        self.extraLabel.textColor = AppColor.red02.uiColor
    }
}
