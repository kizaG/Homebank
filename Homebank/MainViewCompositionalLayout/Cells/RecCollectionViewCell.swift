//
//  RecCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 20.05.2024.
//

import UIKit
import SnapKit

class RecCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
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

extension RecCollectionViewCell {
    func setupViews() {
        addSubview(infoImageView)
    }
    
    func setupConstraints() {
        infoImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(imageName: String) {
        infoImageView.image = UIImage(named: imageName)
    }
}

