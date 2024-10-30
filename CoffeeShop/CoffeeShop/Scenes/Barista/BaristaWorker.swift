//
//  BaristaWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class BaristaWorker: BaristaWorkingLogic {
    func fetch(_ completion: Barista.Completion?) {
        guard let completion = completion else { return }
        let items: [Employee] = [
                    .init(
                       name: "Серёга",
                       imageUrl: "baristaPhoto1",
                       level: .middle,
                       isAvailable: true
                    ),
                    .init(
                        name: "Василий",
                        imageUrl: "baristaPhoto",
                        level: .high,
                        isAvailable: false
                    ),
                    .init(
                        name: "Олеся",
                        imageUrl: "baristaPhoto2",
                        level: .high,
                        isAvailable: true
                    )
                ].sorted { i1, i2 in
                    !i2.isAvailable
                }
        let model: Barista.Model = .init(
            items: items
        )
        completion(model)
    }

    func apply(barista: Employee, _ completion: Barista.EmptyCompletion?) {
        guard let item = SharedOrder.shared.currentOrderItem else {
            return
        }
        SharedOrder.shared.currentOrderItem = .init(
            name: item.name,
            count: item.count,
            estimatedDate: item.estimatedDate,
            date: item.date,
            location: item.location,
            doubleRistretto: item.doubleRistretto,
            takeAway: item.takeAway,
            volume: item.volume,
            barista: barista,
            coffeeType: item.coffeeType,
            coffeeVariety: item.coffeeVariety,
            roasting: item.roasting,
            grinding: item.grinding,
            milk: item.milk,
            syrup: item.syrup,
            additives: item.additives,
            ice: item.ice,
            price: item.price
        )
        completion?()
    }
}
