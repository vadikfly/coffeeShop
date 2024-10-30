//
//  Order.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 24.10.2021.
//

import Foundation

class SharedOrder {
    static var shared = SharedOrder()

    var currentOrderItem: OrderItem?
    
    var currentOrder: [OrderItem] = []

    private init() {}
}
