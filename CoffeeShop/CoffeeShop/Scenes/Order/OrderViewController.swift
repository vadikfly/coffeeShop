//
//  OrderViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderViewController: UIViewController {
    var interactor: OrderBusinessLogic?
    var router: OrderRoutingLogic?

    private let rootView = OrderView()

    override func loadView() {
        super.loadView()
        view = rootView

        rootView.actionHandler = { action in
            switch action {
            case .current:
                self.interactor?.request(Order.CurrentOrder.Request())
            case .history:
                self.interactor?.request(Order.History.Request())
            case let .buy(index):
                self.interactor?.request(Order.Buy.Request(index: index))
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.request(Order.Fetch.Request())
    }
}

extension OrderViewController: OrderDisplayLogic {
    func display(_ viewModel: Order.Fetch.ViewModel) {
        rootView.viewModel = viewModel.model.viewModel()
    }

    func display(_ viewModel: Order.CurrentOrder.ViewModel) {
        rootView.viewModel = viewModel.model.viewModel()
    }

    func display(_ viewModel: Order.History.ViewModel) {
        rootView.viewModel = viewModel.model.viewModel()
    }

    func display(_ viewModel: Order.Buy.ViewModel) {
        rootView.viewModel = viewModel.model.viewModel()
    }
}

private extension Order.ViewModel {
    func viewModel() -> OrderView.Model {
        .init(
            currentItems: currentOrder.map({ item in
                return item.item()
            }),
            historyItems: history.map({ item in
                return item.historyItem()
            })
        )
    }
}

private extension Order.ViewModel.Item {
    func item() -> CurrentCell.Model {
        .init(dateOrder: self.date, coffee: self.name, adress: self.location, price: self.price)
    }

    func historyItem() -> HistoryCell.Model {
        .init(dateOrder: self.date, coffee: self.name, adress: self.location, price: self.price)
    }
}
