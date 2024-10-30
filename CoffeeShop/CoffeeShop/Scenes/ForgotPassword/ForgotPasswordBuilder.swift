//
//  ForgotPasswordBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class ForgotPasswordBuilder {
    static func build() -> UIViewController {
        let viewController = ForgotPasswordViewController()
        let presenter = ForgotPasswordPresenter(view: viewController)
        let interactor = ForgotPasswordInteractor(
            presenter: presenter,
            worker: ForgotPasswordWorker()
        )
        let router = ForgotPasswordRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
