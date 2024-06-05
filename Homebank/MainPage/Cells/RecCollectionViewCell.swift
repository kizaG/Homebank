//
//  RecCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 20.05.2024.
//

import UIKit
import SnapKit

final class RecCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RecCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
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

extension RecCollectionViewCell {
    
    // MARK: - Setup Views
    
    private func setupViews() {
        addSubview(infoImageView)
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        infoImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func configureCell(imageName: String) {
        infoImageView.image = UIImage(named: imageName)
    }
}

