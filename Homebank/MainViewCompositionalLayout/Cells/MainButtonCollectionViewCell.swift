//
//  ButtonCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import UIKit
import SnapKit

class MainButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private lazy var buttonView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var buttonTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var buttonExtraText: UILabel = {
        let label = UILabel()
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

extension MainButtonCollectionViewCell {
    func setupViews() {
        addSubview(buttonView)
        [buttonImageView, buttonTitle, buttonExtraText].forEach {
            buttonView.addSubview($0)
        }
    }
    
    func setupConstraints() {
        buttonView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        buttonImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        buttonTitle.snp.makeConstraints { make in
            make.top.equalTo(buttonImageView.snp.bottom).offset(2)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(imageName: String, title: String, extraText: String) {
        buttonImageView.image = UIImage(named: imageName)
        buttonTitle.text = title
        buttonExtraText.text = extraText
    }
}
