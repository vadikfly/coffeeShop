//
//  CoffeeCountriesView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeTypeView: View {

    var viewModel: CoffeeType.RootViewModel = .init(varietyNameItems: []) {
        didSet {
            tableView.items = viewModel.varietyNameItems.map { varietyName in
                return .init(
                    text: varietyName
                )
            }
        }
    }

    enum Action {
        case close
        case buy
        case selectVariety(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Выберите страну")
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
        view.viewModel = .init(text: "Выберите сорт кофе", textAlignment: .left, textColor: .darkBlue)
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()

    private lazy var tableView: SimpleTableView<CoffeeCountryCell> = {
        let view = SimpleTableView<CoffeeCountryCell>()
        view.actionHandler = { action in
            switch action {
            case .select(let index):
                print("selected \(index)")
                self.actionHandler(.selectVariety(index)) 
            }
        }
        return view
    }()


    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(tableView)

    }

    override func setupLayout() {
        super.setupLayout()
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor

        titleLabel.topAnchor ~= headerView.bottomAnchor + 24
        titleLabel.leftAnchor ~= leftAnchor + 16

        tableView.topAnchor ~= titleLabel.bottomAnchor + 24
        tableView.leftAnchor ~= leftAnchor + 16
        tableView.rightAnchor ~= rightAnchor
        tableView.bottomAnchor ~= bottomAnchor
    }
}

