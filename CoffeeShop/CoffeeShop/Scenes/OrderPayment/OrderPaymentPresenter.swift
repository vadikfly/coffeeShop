//
//  OrderPaymentPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class OrderPaymentPresenter {
    weak var view: OrderPaymentDisplayLogic?

    init(view: OrderPaymentDisplayLogic) {
        self.view = view
    }
}

extension OrderPaymentPresenter: OrderPaymentPresentationLogic {
    func present(_ response: OrderPayment.Fetch.Response) {
        view?.display(
            OrderPayment.Fetch.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: OrderPayment.Select.Response) {
        view?.display(
            OrderPayment.Select.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: OrderPayment.Next.Response) {
        view?.display(OrderPayment.Next.ViewModel())
    }
}

private extension OrderPayment.Model {
    func rootViewModel() -> OrderPayment.RootViewModel {
        .init(
            items: items.map { item in
                    .init(
                        name: item.name,
                        methods: item.methods.string(),
                        system: item.system.map { item in
                            item.string()
                        },
                        isEnabled: item.isEnabled
                    )
                },
            totalPrice: String(format: "BYN %.2f", Double(totalPrice)/100.0)
        )
    }
}

extension OrderPayment.paymentMethods {
    func string() -> String {
        switch self {
        case .online:
            return "Оплата онлайн"
        case .card:
            return "Банковская карта"
        }
    }
}

extension OrderPayment.paymentSystem {
    func string() -> String {
        switch self {
        case .assist:
            return "assistlogo"
        case .visa:
            return "visalogo"
        case .mastercard:
            return "mastercardlogo"
        }
    }
}
