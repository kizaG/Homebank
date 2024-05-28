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
        imageView.image = UIImage(named: AppImage.eb_credit.rawValue)
        imageView.backgroundColor = AppColor.green01.uiColor
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
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.text = "300 000.00 T"
        return label
    }()
    
    private lazy var amountExtraLabel: UILabel = {
        let label = UILabel()
        label.text = "Ставка 16%"
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
            make.edges.equalToSuperview()
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
}
