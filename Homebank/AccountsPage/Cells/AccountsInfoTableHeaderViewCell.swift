//
//  AccountsInfoTableHeaderViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 30.05.2024.
//

import UIKit
import SnapKit

final class AccountsInfoTableHeaderViewCell: UITableViewCell {
    
    static let identifier = "AccountsInfoTableHeaderViewCell"
    
    // MARK: - UI
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var headerExtraLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.grey02.uiColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension AccountsInfoTableHeaderViewCell {
    
    private func setupViews() {
        [headerLabel, headerExtraLabel].forEach {
            contentView.addSubview($0)
        }
        
    }
    
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(20)
        }
        
        headerExtraLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configure(headerTitle: String, headerExtraTitle: String) {
        contentView.backgroundColor = AppColor.grey01.uiColor
        self.headerLabel.text = headerTitle
        self.headerExtraLabel.text = headerExtraTitle
    }
}
