//
//  MainViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

struct MainElementKind {
    static let background01 = "background01-element-kind"
    static let background02 = "background02-element-kind"
    static let sectionFooter = "section-footer-element-kind"
    static let recHeader = "rec-header-element-kind"
}

final class MainViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var avatarView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var avatarIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.avatar.uiImage
        return imageView
    }()
    
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Привет Нурдана!"
        label.textColor = AppColor.black.uiColor
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Вт. 20 апреля"
        label.textColor = AppColor.grey02.uiColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return label
    }()
    
    private lazy var bonusLabel: UILabel = {
        let label = UILabel()
        label.text = "597.01 b"
        label.textColor = AppColor.green01.uiColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        return label
    }()
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var messageButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_message.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_bell.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let searchController = UISearchController()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = AppColor.grey01.uiColor
        collectionView.bounces = false
        collectionView.register(InfoCollectionViewCell.self,
                                forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
        collectionView.register(MainButtonCollectionViewCell.self,
                                forCellWithReuseIdentifier: MainButtonCollectionViewCell.identifier)
        collectionView.register(PosterCollectionViewCell.self,
                                forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        collectionView.register(PosterFooterReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PosterFooterReusableView.identifier)
        collectionView.register(ExtraButtonCollectionViewCell.self,
                                forCellWithReuseIdentifier: ExtraButtonCollectionViewCell.identifier)
        collectionView.register(RecCollectionViewCell.self, forCellWithReuseIdentifier: RecCollectionViewCell.identifier)
        collectionView.register(RecHeaderReusableViewCell.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecHeaderReusableViewCell.identifier)
        return collectionView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = AppColor.grey01.uiColor
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: AppColor.black.uiColor.withAlphaComponent(0.5)
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Поиск по Халык банк", attributes: placeholderAttributes)
        searchBar.setScopeBarButtonTitleTextAttributes([.foregroundColor: UIColor.red], for: .normal)
        searchBar.searchTextField.textColor = AppColor.black.uiColor
        searchBar.searchTextField.leftView?.tintColor = AppColor.black.uiColor.withAlphaComponent(0.5)
        searchBar.searchTextField.rightView?.tintColor = AppColor.black.uiColor.withAlphaComponent(0.5)
        return searchBar
    }()
    
    private let sections = MainMockData.shared.pageData
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColor.grey01.uiColor
        setupViews()
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }
    
    // MARK: - Action
    
    @objc
    func messageButtonTapped() {
        print("message button tapped")
    }
    
    @objc
    func notificationButtonTapped() {
        print("notification button tapped")
    }
}

extension MainViewController {
    
    // MARK: - Setup Views
    
    func setupViews() {
        
        [searchBar, collectionView].forEach {
            view.addSubview($0)
        }
        [avatarView, buttonsView].forEach {
            navigationController?.navigationBar.addSubview($0)
        }
        [avatarIcon, greetingLabel, dateLabel, bonusLabel].forEach {
            avatarView.addSubview($0)
        }
        [messageButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
    }
    
    // MARK: - Setup Connstraints
    
    func setupConstraints() {
        
        avatarView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(200)
        }
        
        avatarIcon.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.size.equalTo(44)
        }
        
        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(avatarIcon.snp.trailing).offset(10)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.leading.equalTo(avatarIcon.snp.trailing).offset(10)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.leading.equalTo(dateLabel.snp.trailing).offset(8)
        }
        
        buttonsView.snp.makeConstraints { make in
            make.centerY.equalTo(avatarIcon.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        messageButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalTo(notificationButton.snp.leading).offset(-16)
            make.size.equalTo(28)
        }
        
        notificationButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.size.equalTo(28)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(94)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(12)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Create Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {
                return nil
            }
            let section = self.sections[sectionIndex]
            switch section {
            case .infos(_):
                return self.createInfoSection()
            case .mainButtons(_):
                return self.createMainButtonSection()
            case .posters(_):
                return self.createPosterSection()
            case .extraButtons(_):
                return self.createExtraButtonSection()
            case .recs(_):
                return self.createRecSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        layout.register(BackgroundDecorationView.self, forDecorationViewOfKind: MainElementKind.background01)
        layout.register(BackgroundDecorationRecView.self, forDecorationViewOfKind: MainElementKind.background02)
        return layout
    }
    
    private func createLayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        return section
    }
    
    private func createInfoSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.42),
                                                                         heightDimension: .fractionalHeight(0.13)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    private func createMainButtonSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.2),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.1)),
                                                       subitems: [item])
        group.interItemSpacing = .flexible(1)
        
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 20)
        section.contentInsets = .init(top: 20, leading: 20, bottom: 50, trailing: 20)
        return section
    }
    
    private func createPosterSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.13)),
                                                       subitems: [item])
        
        let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(20))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottomLeading)
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10)
        section.contentInsets = .init(top: -40, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [footer]
        return section
    }
    
    private func createExtraButtonSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.48),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.1)),
                                                       subitems: [item])
        group.interItemSpacing = .flexible(1)
        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(
            elementKind: MainElementKind.background01)
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 0)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 8, trailing: 0)
        section.decorationItems = [sectionBackgroundDecoration]
        return section
    }
    
    private func createRecSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.42),
                                                                         heightDimension: .fractionalHeight(0.13)),
                                                       subitems: [item])
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(100))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading)
        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(
            elementKind: MainElementKind.background02)
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10)
        section.contentInsets = .init(top: 20, leading: 20, bottom: 0, trailing: 20)
        section.decorationItems = [sectionBackgroundDecoration]
        section.boundarySupplementaryItems = [header]
        return section
    }
}

extension MainViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .infos(let info):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.identifier, for: indexPath) as? InfoCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: info[indexPath.row].image)
            return cell
            
        case .mainButtons(let mainButton):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainButtonCollectionViewCell.identifier, for: indexPath) as? MainButtonCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: mainButton[indexPath.row].image,
                               title: mainButton[indexPath.row].title,
                               extraText: mainButton[indexPath.row].extraText)
            return cell
            
        case .posters(let poster):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: poster[indexPath.row].image)
            return cell
            
        case .extraButtons(let extraButton):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExtraButtonCollectionViewCell.identifier, for: indexPath) as? ExtraButtonCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: extraButton[indexPath.row].image,
                               title: extraButton[indexPath.row].title,
                               backgroundColor: extraButton[indexPath.row].backgroundColor)
            return cell
            
        case .recs(let rec):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecCollectionViewCell.identifier, for: indexPath) as? RecCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: rec[indexPath.row].image)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            if indexPath.section == 2 {
                guard let footer = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: PosterFooterReusableView.identifier,
                    for: indexPath) as? PosterFooterReusableView
                else { fatalError() }
                return footer
            }
        case UICollectionView.elementKindSectionHeader:
            if indexPath.section == 4 {
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: RecHeaderReusableViewCell.identifier,
                    for: indexPath) as? RecHeaderReusableViewCell
                else { fatalError() }
                return header
            }
        default:
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: PosterFooterReusableView.identifier,
                for: indexPath) as? PosterFooterReusableView
            else { fatalError() }
            return footer
        }
        return UICollectionReusableView()
    }
}
