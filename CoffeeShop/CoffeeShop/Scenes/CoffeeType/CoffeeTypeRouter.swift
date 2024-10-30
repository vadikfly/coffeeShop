//
//  CoffeeTypeRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeTypeRouter {
    weak var viewController: CoffeeTypeViewController?
    var dataStore: CoffeeTypeDataStore?

    init(viewController: CoffeeTypeViewController, dataStore: CoffeeTypeDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension CoffeeTypeRouter: CoffeeTypeRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func buy() {
        viewController?.navigationController?.pushViewController(MyOrderBuilder.build(), animated: true)
    }

    func select() {
        viewController?.navigationController?.pushViewController(DesignerBuilder.build(), animated: true)
    }
}
