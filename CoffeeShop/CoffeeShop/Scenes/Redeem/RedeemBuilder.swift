//
//  RedeemBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RedeemBuilder {
    static func build() -> UIViewController {
        let viewController = RedeemViewController()
        let presenter = RedeemPresenter(view: viewController)
        let interactor = RedeemInteractor(
            presenter: presenter,
            worker: RedeemWorker()
        )
        let router = RedeemRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
