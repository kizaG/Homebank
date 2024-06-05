//
//  BackgroundDecorationRecView.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 20.05.2024.
//

import UIKit

final class BackgroundDecorationRecView: UICollectionReusableView {
    
    static let identifier = "BackgroundDecorationRecView"

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = AppColor.white.uiColor
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
