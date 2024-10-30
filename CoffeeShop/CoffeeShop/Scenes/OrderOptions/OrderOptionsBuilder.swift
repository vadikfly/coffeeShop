//
//  OrderOptionsBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderOptionsBuilder {
    static func build(coffee: Coffee) -> UIViewController {
        let viewController = OrderOptionsViewController()
        let presenter = OrderOptionsPresenter(view: viewController)
        let interactor = OrderOptionsInteractor(
            presenter: presenter,
            worker: OrderOptionsWorker(coffee: coffee)
        )
        let router = OrderOptionsRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
