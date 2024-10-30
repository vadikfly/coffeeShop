//
//  CoffeeTypeWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class CoffeeTypeWorker: CoffeeTypeWorkingLogic {
    var selectedCountry: Int = 0

    init(_ selectedCountry: Int) {
        self.selectedCountry = selectedCountry
    }

    let items = CoffeeCountry.load()

    func fetch(_ completion: CoffeeType.Completion?) {
        guard let completion = completion else { return }
        let model: CoffeeType.Model = .init(
            items: items?[selectedCountry].varieties ?? .init()
        )
        completion(model)
    }
    func apply(variety: Int, _ completion: CoffeeType.EmptyCompletion?) {
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
            barista: item.barista,
            coffeeType: item.coffeeType,
            coffeeVariety: [items?[selectedCountry].name, items?[selectedCountry].varieties[variety]],
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
