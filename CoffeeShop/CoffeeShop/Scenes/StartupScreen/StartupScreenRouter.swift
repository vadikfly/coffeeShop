//
//  StartupScreenRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class StartupScreenRouter {
    weak var viewController: StartupScreenViewController?
    var dataStore: StartupScreenDataStore?

    init(viewController: StartupScreenViewController, dataStore: StartupScreenDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension StartupScreenRouter: StartupScreenRoutingLogic {
    func showTabs() {
        let tabs = TabbarBuilder.build()
        viewController?.navigationController?.viewControllers = [tabs]
    }

    func showWelcome() {
        let welcome = WelcomeBuilder.build()
        viewController?.navigationController?.viewControllers = [welcome]
    }

    func showLogin() {
        viewController?.navigationController?.viewControllers = [AuthBuilder.build()]
    }
}
