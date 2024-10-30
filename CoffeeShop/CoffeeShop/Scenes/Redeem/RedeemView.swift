//
//  RedeemView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

class RedeemView: View {

    var viewModel: Redeem.RootViewModel = .init(itemsViewModel: []) {
        didSet {
            tableView.items = viewModel.itemsViewModel.enumerated().map { index, item in
                return .init(
                    image: item.image,
                    name:  item.name,
                    valid: item.valid,
                    points: item.points,
                    actionHandler: { action in
                        switch action {
                        case .buy:
                            self.actionHandler(.buy(index))
                        }
                    }
                )
            }
        }
    }

    enum Action {
        case close
        case buy(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Оплатить баллами")
        view.actionHandler = { action in
            switch action {
            case .back:
                self.actionHandler(.close)
            case .buy:
                break
            }
        }
        view.cartImageHidden = true
        return view
    }()

    private lazy var tableView: SimpleTableView<RedeemItemView> = {
        let view = SimpleTableView<RedeemItemView>()
        return view
    }()

    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(tableView)
    }

    override func setupLayout() {
        super.setupLayout()
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor

        tableView.topAnchor ~= headerView.bottomAnchor + 37
        tableView.leftAnchor ~= leftAnchor + 22
        tableView.rightAnchor ~= rightAnchor - 27
        tableView.bottomAnchor ~= bottomAnchor
    }
}
