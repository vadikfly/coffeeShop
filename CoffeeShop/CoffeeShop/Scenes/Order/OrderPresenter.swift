//
//  OrderPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderPresenter {
    weak var view: OrderDisplayLogic?

    init(view: OrderDisplayLogic) {
        self.view = view
    }
}

extension OrderPresenter: OrderPresentationLogic {
    func present(_ response: Order.Fetch.Response) {
        view?.display(
            Order.Fetch.ViewModel(
                model: response.model?.viewModel() ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }

    func present(_ response: Order.CurrentOrder.Response) {
        view?.display(
            Order.CurrentOrder.ViewModel(
                model: response.model?.viewModel() ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }

    func present(_ response: Order.History.Response) {
        view?.display(
            Order.History.ViewModel(
                model: response.model?.viewModel() ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }

    func present(_ response: Order.Buy.Response) {
        view?.display(
            Order.Buy.ViewModel(
                model: response.model?.viewModel() ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }
}

private extension Order.Model {
    func viewModel() -> Order.ViewModel {
        .init(
            currentOrder: currentOrder.map({ item in
                return item.item()
            }),
            history: history.map({ item in
                return item.historyItem()
            })
        )
    }
}

private extension Order.ViewModel {
    static var empty: Self {
        return .init(currentOrder: [], history: [])
    }
}

private extension OrderItem {
    func item() -> Order.ViewModel.Item {
        return .init(name: self.name.string(), date: "Хардкод", location: self.location, price: "BYN \(self.price / 100)")
    }

    func historyItem() -> Order.ViewModel.Item {
        return .init(name: self.name.string(), date: "Хардкод 2", location: self.location, price: "BYN \(self.price / 100)")
    }
}
