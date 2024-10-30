//
//  OrderPaymentRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderPaymentRouter {
    weak var viewController: OrderPaymentViewController?
    var dataStore: OrderPaymentDataStore?

    init(viewController: OrderPaymentViewController, dataStore: OrderPaymentDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension OrderPaymentRouter: OrderPaymentRoutingLogic {
    func next() {
        //
    }
}
