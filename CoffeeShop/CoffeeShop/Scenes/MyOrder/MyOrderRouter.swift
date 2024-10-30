//
//  MyOrderRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MyOrderRouter {
    weak var viewController: MyOrderViewController?
    var dataStore: MyOrderDataStore?

    init(viewController: MyOrderViewController, dataStore: MyOrderDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension MyOrderRouter: MyOrderRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func next() {
        viewController?.present(OrderPaymentBuilder.build(), animated: true)
    }
}
