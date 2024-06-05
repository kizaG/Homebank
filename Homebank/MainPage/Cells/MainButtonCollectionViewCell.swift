//
//  ButtonCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import UIKit
import SnapKit

final class MainButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainButtonCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 12
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var buttonTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ArialMT", size: 12)
        label.textColor = AppColor.grey04.uiColor
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var buttonExtraText: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainButtonCollectionViewCell {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        addSubview(buttonView)
        [buttonImageView, buttonTitle, buttonExtraText].forEach {
            buttonView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        buttonView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        buttonImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalTo(buttonView.snp.centerX)
            make.size.equalTo(36)
        }
        
        buttonTitle.snp.makeConstraints { make in
            make.centerX.equalTo(buttonImageView.snp.centerX)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func configureCell(imageName: String, title: String, extraText: String) {
        buttonImageView.image = UIImage(named: imageName)
        buttonTitle.text = title
        buttonExtraText.text = extraText
    }
}
