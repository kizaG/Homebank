//
//  AccountsTableViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 22.05.2024.
//

import UIKit
import SnapKit

final class AccountsTableViewCell: UITableViewCell {
    
    static let identifier = "AccountsTableViewCell"
    
    private lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AppImage.eb_deposit.rawValue)
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [cellImageView].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
