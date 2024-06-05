//
//  CardCollectionViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 17.05.2024.
//

import UIKit
import SnapKit

final class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardCollectionViewCell"
    
    // MARK: - UI
    
    private lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
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

extension CardCollectionViewCell {
    
    private func setupViews() {
        addSubview(infoImageView)
    }
    
    private func setupConstraints() {
        infoImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configureCell(imageName: String, contentMode: ContentMode) {
        infoImageView.image = UIImage(named: imageName)
        infoImageView.contentMode = contentMode
    }
}
