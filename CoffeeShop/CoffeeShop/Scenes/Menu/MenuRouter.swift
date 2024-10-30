//
//  MenuRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MenuRouter {
    weak var viewController: MenuViewController?
    var dataStore: MenuDataStore?

    init(viewController: MenuViewController, dataStore: MenuDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension MenuRouter: MenuRoutingLogic {
    func profile() {
        viewController?.navigationController?.pushViewController(ProfileBuilder.build(), animated: true)
    }
    
    func cart() {
        viewController?.navigationController?.pushViewController(MyOrderBuilder.build(), animated: true)
    }
    
    func select() {
        let selectedCoffee = dataStore?.coffee ?? .americano
        viewController?.navigationController?.pushViewController(OrderOptionsBuilder.build(coffee: selectedCoffee), animated: true)
    }
}
