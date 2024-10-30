//
//  BaristaBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class BaristaBuilder {
    static func build() -> UIViewController {
        let viewController = BaristaViewController()
        let presenter = BaristaPresenter(view: viewController)
        let interactor = BaristaInteractor(
            presenter: presenter,
            worker: BaristaWorker()
        )
        let router = BaristaRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
