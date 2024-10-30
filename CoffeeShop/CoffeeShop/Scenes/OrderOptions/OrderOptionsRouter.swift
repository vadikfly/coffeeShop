//
//  OrderOptionsRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderOptionsRouter {
    weak var viewController: OrderOptionsViewController?
    var dataStore: OrderOptionsDataStore?

    init(viewController: OrderOptionsViewController, dataStore: OrderOptionsDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension OrderOptionsRouter: OrderOptionsRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func cart() {
        viewController?.navigationController?.pushViewController(MyOrderBuilder.build(), animated: true)
    }
    
    func constructor() {
        viewController?.navigationController?.pushViewController(DesignerBuilder.build(), animated: true)
    }
    
    func next() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
