//
//  OrderConfirmedWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderConfirmedWorker: OrderConfirmedWorkingLogic {
    func fetch(_ completion: OrderConfirmed.Completion?) {
        guard let completion = completion else { return }
        let model: OrderConfirmed.Model = .init(
            name: "Алеша Хардкожа",
            orderTime: "4:20",
            orderAdress: "г. Минск, ул. Тимирязева, 67.")
        completion(model)
    }
}
