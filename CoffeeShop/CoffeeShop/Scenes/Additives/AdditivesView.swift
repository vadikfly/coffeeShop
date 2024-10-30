//
//  AdditivesView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class AdditivesView: View {

    var viewModel: Additives.RootViewModel = .init(additivesItems: []) {
        didSet {
            tableView.items = viewModel.additivesItems.map { additives in
                return .init(
                    text: additives.name,
                    type: 1,
                    isSelected: additives.isSelected
                )
            }
        }
    }

    enum Action {
        case close
        case buy
        case additives(Int)
        case apply
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
        view.viewModel = .init(text: "Выберите добавку", textAlignment: .left, textColor: .darkBlue)
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()

    private lazy var tableView: SimpleTableView<CoffeeCountryCell> = {
        let view = SimpleTableView<CoffeeCountryCell>()
        view.actionHandler = { action in
            switch action {
            case .select(let index):
                print("selected \(index)")
                self.actionHandler(.additives(index))
            }
        }
        return view
    }()

    private lazy var addButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Добавить", textSize: 14, textColor: .white, cornerRadius: 23, colorButton: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1), highlightedColor: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.95))
        view.actionHandler = {
            self.actionHandler(.apply)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(tableView)
        addSubview(addButton)
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

        addButton.heightAnchor ~= 46
        addButton.rightAnchor ~= rightAnchor - 60
        addButton.leftAnchor ~= leftAnchor + 60
        addButton.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor - 20
    }
}
