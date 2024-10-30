//
//  RegistrationBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RegistrationBuilder {
    static func build() -> UIViewController {
        let viewController = RegistrationViewController()
        let presenter = RegistrationPresenter(view: viewController)
        let interactor = RegistrationInteractor(
            presenter: presenter,
            worker: RegistrationWorker()
        )
        let router = RegistrationRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
