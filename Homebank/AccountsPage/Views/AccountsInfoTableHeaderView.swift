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
        label.text = "Депозиты и бонусы"
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
        contentView.addSubview(headerLabel)
    }
    
    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
}
