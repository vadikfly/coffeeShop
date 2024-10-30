//
//  TabbarBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class TabbarBuilder {
    static func build() -> UIViewController {
        let viewController = TabbarViewController()
        let presenter = TabbarPresenter(view: viewController)
        let interactor = TabbarInteractor(
            presenter: presenter,
            worker: TabbarWorker()
        )
        let router = TabbarRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
