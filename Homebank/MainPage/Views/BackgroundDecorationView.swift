//
//  BackgroundDecorationView.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 15.05.2024.
//

import UIKit

final class BackgroundDecorationView: UICollectionReusableView {
    
    static let identifier = "BackgroundDecorationView"

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = AppColor.white.uiColor
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
