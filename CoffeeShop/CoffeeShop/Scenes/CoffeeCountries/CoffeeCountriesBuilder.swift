//
//  CoffeeCountriesBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeCountriesBuilder {
    static func build() -> UIViewController {
        let viewController = CoffeeCountriesViewController()
        let presenter = CoffeeCountriesPresenter(view: viewController)
        let interactor = CoffeeCountriesInteractor(
            presenter: presenter,
            worker: CoffeeCountriesWorker()
        )
        let router = CoffeeCountriesRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
