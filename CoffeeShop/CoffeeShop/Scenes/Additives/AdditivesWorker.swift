//
//  AdditivesWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class AdditivesWorker: AdditivesWorkingLogic {
    
    var items: [AdditivesList] = [
        .ceylon,
        .gratedСhocolate,
        .liquidChocolate,
        .marshmallow,
        .whippedCream,
        .cream,
        .muscatNut,
        .iceCream
    ]

    func fetch(_ completion: Additives.Completion?) {

        guard let selected = SharedOrder.shared.currentOrderItem?.additives else { return }
        
        guard let completion = completion else { return }
        let model: Additives.Model = .init(
            items: items,
            selected: selected
        )
        completion(model)
    }

    func apply(selected: Set<Int>, _ completion: Additives.SaveCompletion?) {
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
            coffeeVariety: item.coffeeVariety,
            roasting: item.roasting,
            grinding: item.grinding,
            milk: item.milk,
            syrup: item.syrup,
            additives: selected,
            ice: item.ice,
            price: item.price
        )
        completion?()
    }
    
    func close(selected: Set<Int>, _ completion: Additives.SaveCompletion?) {
        guard let item = SharedOrder.shared.currentOrderItem else {
            return
        }
        if selected.isEmpty {
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
                coffeeVariety: item.coffeeVariety,
                roasting: item.roasting,
                grinding: item.grinding,
                milk: item.milk,
                syrup: item.syrup,
                additives: [],
                ice: item.ice,
                price: item.price
            )
        }
        completion?()
    }
}
