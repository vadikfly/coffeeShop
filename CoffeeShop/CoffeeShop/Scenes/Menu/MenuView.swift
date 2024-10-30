//
//  MenuView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MenuView: View, UICollectionViewDelegate {
    
    enum Action {
        case profile
        case buy
        case select(Int)
    }
    
    enum Section: Hashable, CaseIterable {
        case image
    }
    
    enum Item: Hashable {
        case coffee(Menu.RootViewModel.Coffee)
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    var viewModel: Menu.RootViewModel = .init(
        name: "",
        items: []
    ) {
        didSet {
            nameLabel.viewModel = .init(text: viewModel.name, textAlignment: .left, textColor: .black)
            
            var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
            snapshot.appendSections(Section.allCases)
            let coffee: [Item] = viewModel.items.map { item in
                return .coffee(item)
            }
            snapshot.appendItems(coffee, toSection: .image)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
    
    private let welcomeLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.viewModel = .init(text: "Добро пожаловать!", textAlignment: .left, textColor: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let nameLabel: Label = {
        let view = Label(size: 18, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Profile26"), for: .normal)
        view.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.profile)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    private lazy var buyButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Buy"), for: .normal)
        view.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.buy)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()

    private lazy var collection: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        return view
    }()
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionHandler(.select(indexPath.row))
    }
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Item> = {
        let cellRegistration = UICollectionView.CellRegistration<CollectionViewCell, Item> { cell, indexPath, item in
            switch item {
            case .coffee(let coffee):
                return cell.itemView.viewModel = .init(image: coffee.image, text: coffee.name)
            }
        }
        
        let dataSource = UICollectionViewDiffableDataSource<Section, Item>(
            collectionView: collection
        ) { collectionView, indexPath, index -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: index)
        }
        return dataSource
    }()
    
    private let layout: UICollectionViewLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = .fixed(17)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 17
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 25)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        return view
    }()
    
    private let titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.viewModel = .init(text: "Выберите Ваш кофе", textAlignment: .left, textColor: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(welcomeLabel)
        addSubview(nameLabel)
        addSubview(profileButton)
        addSubview(buyButton)
        addSubview(backgroundView)
        addSubview(titleLabel)
        addSubview(collection)
    }

    override func setupLayout() {
        super.setupLayout()

        welcomeLabel.topAnchor ~= safeAreaLayoutGuide.topAnchor + 19
        welcomeLabel.leftAnchor ~= leftAnchor + 26
        welcomeLabel.rightAnchor ~= buyButton.leftAnchor - 10
        welcomeLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        nameLabel.topAnchor ~= welcomeLabel.bottomAnchor + 2
        nameLabel.leftAnchor ~= welcomeLabel.leftAnchor
        nameLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        profileButton.topAnchor ~= safeAreaLayoutGuide.topAnchor + 26
        profileButton.rightAnchor ~= rightAnchor - 33
        
        buyButton.topAnchor ~= safeAreaLayoutGuide.topAnchor + 26
        buyButton.rightAnchor ~= profileButton.leftAnchor - 20
        buyButton.leftAnchor ~= nameLabel.rightAnchor + 10
        
        backgroundView.topAnchor ~= safeAreaLayoutGuide.topAnchor + 76
        backgroundView.leftAnchor ~= leftAnchor
        backgroundView.rightAnchor ~= rightAnchor
        backgroundView.bottomAnchor ~= bottomAnchor
        
        titleLabel.topAnchor ~= backgroundView.topAnchor + 16
        titleLabel.leftAnchor ~= backgroundView.leftAnchor + 31
        titleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        collection.topAnchor ~= titleLabel.bottomAnchor + 24
        collection.bottomAnchor ~= bottomAnchor
        collection.leftAnchor ~= backgroundView.leftAnchor
        collection.rightAnchor ~= backgroundView.rightAnchor
    }
}

private class CollectionViewCell: UICollectionViewCell {
    
    lazy var itemView: ItemMenuView = {
        let view = ItemMenuView()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.pinToSuperview()
        return view
    }()
}
