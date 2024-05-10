//
//  ViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {

    // MARK: - UI
    
    private lazy var avatarIcon: UIImageView = {
        let avatarIcon = UIImageView()
        avatarIcon.image = AppImage.avatar.uiImage
        return avatarIcon
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColor.greyBackground.uiColor
    }
    
    
}

