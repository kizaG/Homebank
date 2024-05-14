//
//  PosterCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 14.05.2024.
//

import UIKit
import SnapKit

class PosterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private let infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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

// MARK: - Private

private extension PosterCollectionViewCell {
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