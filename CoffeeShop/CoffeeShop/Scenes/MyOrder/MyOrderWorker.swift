//
//  MyOrderWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class MyOrderWorker: MyOrderWorkingLogic {
    func totalPrice() -> Int {
        return SharedOrder.shared.currentOrder.reduce(0) { $0 + $1.price }
    }
    
    func fetch(_ completion: MyOrder.FetchCompletion?) {
        let model = MyOrder.Model(
            items: SharedOrder.shared.currentOrder,
            totalPrice: totalPrice()
        )
        completion?(model)
    }
    
    func delete(_ index: Int, _ completion: MyOrder.DeleteCompletion?) {
        SharedOrder.shared.currentOrder.remove(at: index)
        let model = MyOrder.Model(
            items: SharedOrder.shared.currentOrder,
            totalPrice: totalPrice()
        )
        completion?(model)
    }
}
