//
//  OrderBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderBuilder {
    static func build() -> UIViewController {
        let viewController = OrderViewController()
        let presenter = OrderPresenter(view: viewController)
        let interactor = OrderInteractor(
            presenter: presenter,
            worker: OrderWorker()
        )
        let router = OrderRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
