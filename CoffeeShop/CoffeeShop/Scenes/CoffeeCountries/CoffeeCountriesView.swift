//
//  CoffeeCountriesView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeCountriesView: View {

    typealias DataSource = UICollectionViewDiffableDataSource<Int, CoffeeCountries.RootViewModel.Country>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, CoffeeCountries.RootViewModel.Country>

    var viewModel: CoffeeCountries.RootViewModel = .init(countryNameItems: []) {
        didSet {
            var snapshot = Snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(viewModel.countryNameItems)
            dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    enum Action {
        case close
        case buy
        case selectCountry(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Конструктор заказа")
        view.actionHandler = { action in
            switch action {
            case .back:
                self.actionHandler(.close)
            case .buy:
                self.actionHandler(.buy)
            }
        }
        return view
    }()

    private var titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Выберите страну и сорт кофе", textAlignment: .left, textColor: .darkBlue)
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()

    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = collectionDelegate
        return view
    }()

    private lazy var dataSource: DataSource = {
        let cellRegistration = UICollectionView.CellRegistration<CoffeeCountriesCollectionViewCell, CoffeeCountries.RootViewModel.Country> { cell, indexPath, viewModel in
            print("заполни ячейку \(indexPath.item)")
            cell.CoffeeCountriesitemView.viewModel = .init(
                text: viewModel.name,
                type: 0,
                textColor: indexPath.row == self.viewModel.selectedCountry ? .blue : .black
            )
        }

        let dataSource = DataSource(
            collectionView: collectionView
        ) { [unowned self] collectionView, indexPath, item -> UICollectionViewCell? in
            print("дай мне ячейку для \(indexPath.item)")
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        return dataSource
    }()

    private lazy var collectionDelegate: CoffeeCountriesCollectionViewDelegate = {
        let delegate = CoffeeCountriesCollectionViewDelegate()
        delegate.actionHandler = { index in
            self.actionHandler(.selectCountry(index))
        }
        return delegate
    }()

    private let layout = UICollectionViewCompositionalLayout.list(using: .init(appearance: .plain))

    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(collectionView)
    }

    override func setupLayout() {
        super.setupLayout()
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor

        titleLabel.topAnchor ~= headerView.bottomAnchor + 24
        titleLabel.leftAnchor ~= leftAnchor + 16

        collectionView.topAnchor ~= titleLabel.bottomAnchor + 24
        collectionView.leftAnchor ~= leftAnchor + 16
        collectionView.rightAnchor ~= rightAnchor
        collectionView.bottomAnchor ~= bottomAnchor
    }
}

private class CoffeeCountriesCollectionViewDelegate: UIViewController, UICollectionViewDelegate {

    var actionHandler: (Int) -> Void = { _ in }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionHandler(indexPath.row)
    }
}

class CoffeeCountriesCollectionViewCell: UICollectionViewCell {

    lazy var CoffeeCountriesitemView: CoffeeCountryCell = {
        let view = CoffeeCountryCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(view)
        view.pinToSuperview()
        return view
    }()
}

extension CoffeeCountries.RootViewModel.Country: Hashable {
    static func == (lhs: CoffeeCountries.RootViewModel.Country, rhs: CoffeeCountries.RootViewModel.Country) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
