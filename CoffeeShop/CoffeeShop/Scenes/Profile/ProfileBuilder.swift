//
//  ProfileBuilder.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class ProfileBuilder {
    static func build() -> UIViewController {
        let viewController = ProfileViewController()
        let presenter = ProfilePresenter(view: viewController)
        let interactor = ProfileInteractor(
            presenter: presenter,
            worker: ProfileWorker()
        )
        let router = ProfileRouter(
            viewController: viewController,
            dataStore: interactor
        )
        viewController.interactor = interactor
        viewController.router = router
        return viewController
    }
}
