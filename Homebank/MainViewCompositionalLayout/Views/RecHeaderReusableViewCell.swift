//
//  RecHeaderReusableViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 21.05.2024.
//

import UIKit
import SnapKit

final class RecHeaderReusableViewCell: UICollectionReusableView {
    static let identifier = "RecHeaderReusableViewCell"

    private lazy var recLabel: UILabel = {
        let label = UILabel()
        label.text = "Вас могут заинтересовать"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(recLabel)
    }

    private func setupConstraints() {
        recLabel.snp.makeConstraints { make in
            make.leading.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
    }
}
