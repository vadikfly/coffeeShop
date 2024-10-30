//
//  AdditivesBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class AdditivesBuilder {
    static func build() -> UIViewController {
        let viewController = AdditivesViewController()
        let presenter = AdditivesPresenter(view: viewController)
        let interactor = AdditivesInteractor(
            presenter: presenter,
            worker: AdditivesWorker()
        )
        let router = AdditivesRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
