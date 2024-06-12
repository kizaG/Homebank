//
//  AccountsInfoTableViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 28.05.2024.
//

import UIKit
import SnapKit

final class AccountsInfoTableViewCell: UITableViewCell {
    
    static let identifier = "AccountsInfoTableViewCell"
    
    // MARK: - UI
    
    private lazy var infoView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.eb_credit.uiImage
        imageView.backgroundColor = AppColor.green01.uiColor
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 8
        imageView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
        return imageView
    }()
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Депозит KZT"
        return label
    }()
    
    private lazy var extraLabel: UILabel = {
        let label = UILabel()
        label.text = "До 30.04.2023"
        label.textColor = AppColor.grey02.uiColor
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "300 000.00 T"
        label.textColor = AppColor.green01.uiColor
        return label
    }()
    
    private lazy var amountExtraLabel: UILabel = {
        let label = UILabel()
        label.text = "Ставка 16%"
        label.textColor = AppColor.grey02.uiColor
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountsInfoTableViewCell {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [infoView].forEach {
            contentView.addSubview($0)
        }
        [iconImageView, mainLabel, extraLabel, amountLabel, amountExtraLabel].forEach {
            infoView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        infoView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.size.equalTo(48)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
        }
        
        extraLabel.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(10)
            make.leading.equalTo(iconImageView.snp.trailing).offset(10)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
        
        amountExtraLabel.snp.makeConstraints { make in
            make.top.equalTo(amountLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    
    func configure(roundTop: Bool, roundBottom: Bool) {
        contentView.backgroundColor = AppColor.grey01.uiColor
        
        if roundTop {
            infoView.layer.cornerRadius = 12
            infoView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        if roundBottom {
            infoView.layer.cornerRadius = 12
            infoView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
}
