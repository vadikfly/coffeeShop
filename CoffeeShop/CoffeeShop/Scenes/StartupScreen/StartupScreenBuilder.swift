//
//  StartupScreenBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class StartupScreenBuilder {
    static func build() -> UIViewController {
        let viewController = StartupScreenViewController()
        let presenter = StartupScreenPresenter(view: viewController)
        let interactor = StartupScreenInteractor(
            presenter: presenter,
            worker: StartupScreenWorker()
        )
        let router = StartupScreenRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
