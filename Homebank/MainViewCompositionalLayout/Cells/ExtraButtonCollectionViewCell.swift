//
//  ExtraButtonCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import UIKit
import SnapKit

class ExtraButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ExtraButtonCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.contentMode = .center
        return view
    }()
    
    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 8
        imageView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10)
        return imageView
    }()
    
    private lazy var buttonTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial-BoldMT", size: 12)
        label.textColor = AppColor.grey04.uiColor
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExtraButtonCollectionViewCell {
    
    // MARK: - Setup Views
    
    func setupViews() {
        addSubview(buttonView)
        [buttonImageView, buttonTitle].forEach {
            buttonView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        buttonView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        buttonImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(40)
        }
        
        buttonTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(buttonImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Configure Cell
    
    func configureCell(imageName: String, title: String, backgroundColor: String) {
        buttonImageView.image = UIImage(named: imageName)
        buttonTitle.text = title
        buttonImageView.backgroundColor = UIColor(named: backgroundColor)
    }
}
