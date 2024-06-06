//
//  AccountsTableGraphViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 06.06.2024.
//

import UIKit
import SnapKit

final class AccountsTableGraphViewCell: UITableViewCell {
    
    static let identifier = "AccountsTableGraphViewCell"
    
    // MARK: - UI
    
    private lazy var graphView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Мои финансы"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var graphImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppImage.eb_credit.rawValue)
        imageView.backgroundColor = AppColor.green01.uiColor
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 8
        imageView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
        return imageView
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        backgroundColor = AppColor.grey01.uiColor
        contentView.backgroundColor = AppColor.white.uiColor
        backgroundView?.backgroundColor = AppColor.grey01.uiColor
        
        contentView.layer.cornerRadius = 20
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountsTableGraphViewCell {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        [graphView].forEach {
            contentView.addSubview($0)
        }
        [headerLabel, graphImageView].forEach {
            graphView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        graphView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        graphImageView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(200)
        }
    }
}
