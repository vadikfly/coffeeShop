//
//  WelcomeRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class WelcomeRouter {
    weak var viewController: WelcomeViewController?
    var dataStore: WelcomeDataStore?

    init(viewController: WelcomeViewController, dataStore: WelcomeDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension WelcomeRouter: WelcomeRoutingLogic {
    func showAuth() {
        viewController?.navigationController?.pushViewController(TabbarBuilder.build(), animated: true)
    }
}
