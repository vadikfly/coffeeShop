//
//  OrderPaymentWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderPaymentWorker: OrderPaymentWorkingLogic {
    func totalPrice() -> Int {
        return SharedOrder.shared.currentOrder.reduce(0) { $0 + $1.price }
    }
    
    var items: [OrderPayment.Model.Payment] = [
        .init(
            name: "Assist Belarus",
            methods: .online,
            system: [.assist],
            isEnabled: true
        ),
        .init(
            name: "2540 xxxx xxxx 2648",
            methods: .card,
            system: [.visa, .mastercard],
            isEnabled: false
        )
        ,
        .init(
            name: "Сбер онлайн",
            methods: .online,
            system: [.visa],
            isEnabled: false
        )
    ]
    
    func fetch(_ completion: OrderPayment.Completion?) {
        let model = OrderPayment.Model(
            items: items,
            totalPrice: totalPrice()
        )
        completion?(model)
    }
    
    func select(_ index: Int, _ completion: OrderPayment.Completion?) {
        for i in 0..<items.count {
            items[i].isEnabled = false
        }
        items[index].isEnabled = true
        
        let model = OrderPayment.Model(
            items: items,
            totalPrice: totalPrice()
        )
        completion?(model)
    }
}
