//
//  MenuBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MenuBuilder {
    static func build() -> UIViewController {
        let viewController = MenuViewController()
        let presenter = MenuPresenter(view: viewController)
        let interactor = MenuInteractor(
            presenter: presenter,
            worker: MenuWorker()
        )
        let router = MenuRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
