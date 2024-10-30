//
//  CoffeeTypeBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeTypeBuilder {
    static func build(selectedCountry: Int) -> UIViewController {
        let viewController = CoffeeTypeViewController()
        let presenter = CoffeeTypePresenter(view: viewController)
        let interactor = CoffeeTypeInteractor(
            presenter: presenter,
            worker: CoffeeTypeWorker(selectedCountry)
        )
        let router = CoffeeTypeRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
