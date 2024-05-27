//
//  MainPageTableViewCell.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 23.05.2024.
//

import UIKit
import SnapKit

struct MainElementKind {
    static let background01 = "background01-element-kind"
    static let background02 = "background02-element-kind"
    static let sectionFooter = "section-footer-element-kind"
    static let recHeader = "rec-header-element-kind"
}

final class MainPageTableViewCell: UITableViewCell {
    
    static let identifier = "MainPageCollectionViewCell"
    
    // MARK: - UI
    
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
    
    private let sections = MainMockData.shared.pageData
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainPageTableViewCell {
    
    // MARK: - Setup Views
    
    func setupViews() {
        [collectionView].forEach {
            contentView.addSubview($0)
        }
    }
    
    // MARK: - Setup Connstraints
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
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
                                                                         heightDimension: .fractionalHeight(0.11)),
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
                                                                         heightDimension: .fractionalHeight(0.09)),
                                                       subitems: [item])
        group.interItemSpacing = .flexible(1)
        
        let section = createLayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 20)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 50, trailing: 20)
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
        section.contentInsets = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.decorationItems = [sectionBackgroundDecoration]
        section.boundarySupplementaryItems = [header]
        return section
    }
}


extension MainPageTableViewCell: UICollectionViewDelegate,
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
