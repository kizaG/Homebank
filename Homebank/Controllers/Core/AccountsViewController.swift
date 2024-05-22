//
//  AccountsViewController.swift
//  Homebank
//
//  Created by Gazinho Dos Santos on 10.05.2024.
//

import UIKit
import SnapKit

struct AccountsElementKind {
    static let background = "background-element-kind"
    static let sectionFooter = "section-footer-element-kind"
}

final class AccountsViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var buttonsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_history.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(historyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.navbar_bell.uiImage, for: .normal)
        button.tintColor = AppColor.grey02.uiColor
        button.addTarget(self, action: #selector(notificationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = AppColor.grey01.uiColor
        collectionView.bounces = false
        collectionView.register(CardCollectionViewCell.self,
                                forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        collectionView.register(ButtonCollectionViewCell.self,
                                forCellWithReuseIdentifier: ButtonCollectionViewCell.identifier)
        return collectionView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AccountsTableViewCell.self, forCellReuseIdentifier: AccountsTableViewCell.identifier)
        return tableView
    }()
    
    private let sections = AccountsMockData.shared.pageData
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColor.grey01.uiColor
        setupViews()
        setupConstraints()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
        title = "Счета"
        let titleAttributes = [
            NSAttributedString.Key.font: UIFont(name: "ArialMT", size: 30) ?? UIFont.boldSystemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ]
        navigationController?.navigationBar.titleTextAttributes = titleAttributes
    }
    
    // MARK: - Action
    
    @objc
    func historyButtonTapped() {
        print("history button tapped")
    }
    
    @objc
    func notificationButtonTapped() {
        print("notification button tapped")
    }
}

extension AccountsViewController {
    
    // MARK: - Setup Views
    
    func setupViews() {
        
        [collectionView, tableView].forEach {
            view.addSubview($0)
        }
        [buttonsView].forEach {
            navigationController?.navigationBar.addSubview($0)
        }
        [historyButton, notificationButton].forEach {
            buttonsView.addSubview($0)
        }
    }
    
    // MARK: - Setup Constraints
    
    func setupConstraints() {
        
        buttonsView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-20)
        }
        
        historyButton.snp.makeConstraints { make in
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
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
//            make.bottom.equalToSuperview().offset(-5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view.frame.height/3*2)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Create Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {
                return nil
            }
            let section = self.sections[sectionIndex]
            switch section {
            case .cards(_):
                return self.createCardSection()
            case .buttons(_):
                return self.createButtonSection()
            }
        }
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        layout.register(BackgroundDecorationView.self, forDecorationViewOfKind: MainElementKind.background01)
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
    
    private func createCardSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.7),
                                                                         heightDimension: .fractionalHeight(0.23)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 10)
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 20)
        return section
    }
    
    private func createButtonSection() -> NSCollectionLayoutSection {
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
}

extension AccountsViewController: UICollectionViewDelegate,
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
            
        case .cards(let card):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: card[indexPath.row].image)
            return cell
            
        case .buttons(let button):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonCollectionViewCell.identifier, for: indexPath) as? ButtonCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: button[indexPath.row].image,
                               title: button[indexPath.row].title,
                               extraText: button[indexPath.row].extraText)
            return cell
        }
    }
}

extension AccountsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AccountsTableViewCell.identifier, for: indexPath) as? AccountsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
