//
//  RedeemWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RedeemWorker: RedeemWorkingLogic {

    var totalPoints = 2700

    var items: [Redeem.Model.Item] = [
        .init(
              name: .americano,
              valid: Date.now,
              points: 1300),
        .init(
              name: .capucino,
              valid: Date.now,
              points: 1310),
        .init(
              name: .flatwhite,
              valid: Date.now,
              points: 1320)
    ]

    func fetch(_ completion: Redeem.FetchCompletion?) {
        guard let completion = completion else { return }
        let model: Redeem.Model = .init(
            items: items
        )
        completion(model)
    }

    func apply(index: Int, _ completion: Redeem.Completion?) {
        guard let completion = completion else { return }
        if totalPoints >= items[index].points {
            SharedOrder.shared.currentOrder.append(OrderItem.defaultItem(coffee: items[index].name, price: 0))
            totalPoints -= items[index].points
            print(totalPoints)
            completion(false)
        } else {
            completion(true)
        }
    }
}
