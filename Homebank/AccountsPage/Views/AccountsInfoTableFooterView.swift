//
//  AccountsInfoTableFooterView.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 04.06.2024.
//

import UIKit
import SnapKit

final class AccountsInfoTableFooterView: UITableViewHeaderFooterView {
    
    static let identifier = "AccountsInfoTableFooterViewCell"
    
    // MARK: - UI
    
    private lazy var payButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColor.green01.uiColor
        button.layer.cornerRadius = 12
        button.setTitle("Оплатить кредиты", for: .normal)
        return button
    }()
    
    // MARK: - Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AccountsInfoTableFooterView {
    
    private func setupViews() {
        addSubview(payButton)
    }
    
    private func setupConstraints() {
        payButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(48)
        }
    }
}
