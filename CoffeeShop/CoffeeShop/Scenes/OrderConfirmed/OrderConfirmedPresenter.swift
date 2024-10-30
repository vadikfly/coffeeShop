//
//  OrderConfirmedPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class OrderConfirmedPresenter {
    weak var view: OrderConfirmedDisplayLogic?

    init(view: OrderConfirmedDisplayLogic) {
        self.view = view
    }
}

extension OrderConfirmedPresenter: OrderConfirmedPresentationLogic {

    func present(_ response: OrderConfirmed.Fetch.Response) {
        view?.display(
            OrderConfirmed.Fetch.ViewModel(
                root: response.model.viewModel())
        )
    }
    func present(_ response: OrderConfirmed.Close.Response) {
        view?.display(OrderConfirmed.Close.ViewModel())
    }
}

private extension OrderConfirmed.Model {
    func viewModel() -> OrderConfirmed.RootViewModel {
        .init(
            name: name,
            orderTime: orderTime,
            orderAdress: orderAdress)
    }
}
