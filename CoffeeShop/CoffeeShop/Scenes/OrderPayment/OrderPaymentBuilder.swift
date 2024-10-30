//
//  OrderPaymentBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderPaymentBuilder {
    static func build() -> UIViewController {
        let viewController = OrderPaymentViewController()
        let presenter = OrderPaymentPresenter(view: viewController)
        let interactor = OrderPaymentInteractor(
            presenter: presenter,
            worker: OrderPaymentWorker()
        )
        let router = OrderPaymentRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
