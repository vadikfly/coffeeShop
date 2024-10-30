//
//  OrderWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderWorker: OrderWorkingLogic {
    var model: Order.Model = {
        let model = Order.Model(
            currentOrder: [],
            history: [
//                .init(name: "Americano", estimatedDate: nil, date: Date().addingTimeInterval(-60*60), location: "г. Минск, ул. Тимирязева, 67", price: 30000),
//                .init(name: "Latte", estimatedDate: nil, date: Date().addingTimeInterval(-60*60), location: "г. Минск, ул. Тимирязева, 67", price: 60000)
            ]
        )
        return model
    }()

    func fetch(_ completion: Order.FetchCompletion?) {
        completion?(.success(self.model))
    }

    func buy(item: OrderItem, _ completion: Order.FetchCompletion?) {
        var currentOrder = model.currentOrder
        currentOrder.append(item)
        self.model = .init(currentOrder: currentOrder, history: self.model.history)
        completion?(.success(self.model))
    }
}
