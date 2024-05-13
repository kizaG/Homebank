//
//  CustomNavigationBar.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 12.05.2024.
//

import UIKit

final class NavigationBarView: UINavigationBar {
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

