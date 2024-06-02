//
//  AccountsInfoTableHeaderView.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 30.05.2024.
//

import UIKit
import SnapKit

final class AccountsInfoTableHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "AccountsInfoTableHeaderView"
    
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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension AccountsInfoTableHeaderView {
    
    private func setupViews() {
        [headerLabel, headerExtraLabel].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
        }
        
        headerExtraLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func configure(headerTitle: String, headerExtraTitle: String) {
        self.headerLabel.text = headerTitle
        self.headerExtraLabel.text = headerExtraTitle
    }
}
