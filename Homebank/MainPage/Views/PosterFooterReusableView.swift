//
//  PosterFooterReusableView.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 15.05.2024.
//

import UIKit
import SnapKit

final class PosterFooterReusableView: UICollectionReusableView {
    static let identifier = "PosterFooterReusableView"

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: .zero)
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = AppColor.grey02.uiColor
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        return pageControl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(pageControl)
        pageControl.numberOfPages = 4
        pageControl.currentPageIndicatorTintColor = AppColor.grey02.uiColor
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
    }

    private func setupConstraints() {
        pageControl.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
