//
//  AccountsInfoTableFooterViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 04.06.2024.
//

import UIKit
import SnapKit

final class AccountsInfoTableFooterViewCell: UITableViewCell {
    
    static let identifier = "AccountsInfoTableFooterViewCell"
    
    // MARK: - UI
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColor.green01.uiColor
        button.layer.cornerRadius = 12
        button.setTitle("Оплатить кредиты", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    @objc
    func payButtonTapped() {
        print("pay button tapped")
    }
}

extension AccountsInfoTableFooterViewCell {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        contentView.addSubview(payButton)
        contentView.backgroundColor = AppColor.grey01.uiColor
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        payButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
}
