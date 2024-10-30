//
//  TabbarRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class TabbarRouter {
    weak var viewController: TabbarViewController?
    var dataStore: TabbarDataStore?

    init(viewController: TabbarViewController, dataStore: TabbarDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension TabbarRouter: TabbarRoutingLogic {
    func show() {

    }
}
