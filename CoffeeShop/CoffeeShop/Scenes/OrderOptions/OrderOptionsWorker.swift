//
//  OrderOptionsWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderOptionsWorker: OrderOptionsWorkingLogic {
    
    private var initialConfig: OrderOptions.InitialConfigModel = .init(
        minCount: 1,
        maxCount: 10,
        cookMinuteInterval: 10,
        cookTimeAdd: 1800
    )

    var coffee: Coffee

    private var orderItem: OrderItem {
        get {
            guard let item = SharedOrder.shared.currentOrderItem else {
                let new: OrderItem = OrderItem.defaultItem(coffee: coffee, price: 300)
                SharedOrder.shared.currentOrderItem = new
                return new
            }
            return item
        }
        set {
            SharedOrder.shared.currentOrderItem = newValue
        }
    }

    private func refreshPrice() {
        let price = Int(Float(3.0 * ((orderItem.doubleRistretto) ? 1.2 : 1) * (orderItem.volume == 0 ? 0.8 : 1 ) * (orderItem.volume == 2 ? 1.2 : 1 ) * Float(orderItem.count)) * 100)
        orderItem = .init(
            name: orderItem.name,
            count: orderItem.count,
            estimatedDate: orderItem.estimatedDate,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: orderItem.doubleRistretto,
            takeAway: orderItem.takeAway,
            volume: orderItem.volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: price
        )
    }
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func fetch(_ completion: OrderOptions.FetchCompletion?) {
        guard let completion = completion else { return }
        if orderItem.estimatedDate != nil {
            orderItem = .init(
                name: orderItem.name,
                count: orderItem.count,
                estimatedDate: Date() + initialConfig.cookTimeAdd,
                date: orderItem.date,
                location: orderItem.location,
                doubleRistretto: orderItem.doubleRistretto,
                takeAway: orderItem.takeAway,
                volume: orderItem.volume,
                barista: orderItem.barista,
                coffeeType: orderItem.coffeeType,
                coffeeVariety: orderItem.coffeeVariety,
                roasting: orderItem.roasting,
                grinding: orderItem.grinding,
                milk: orderItem.milk,
                syrup: orderItem.syrup,
                additives: orderItem.additives,
                ice: orderItem.ice,
                price: orderItem.price
            )
        }
        let model = OrderOptions.Model(
            initialConfig: initialConfig,
            orderItem: orderItem
        )
        completion(model)
    }
    
    func count(_ sign: Bool, _ completion: OrderOptions.CurrentCompletion?) {
        guard let completion = completion else { return }
        var count: Int = orderItem.count
        if sign {
            if count >= initialConfig.minCount && count < initialConfig.maxCount {
                count += 1
            }
        }
        else {
            if count > initialConfig.minCount  && count <= initialConfig.maxCount {
                count -= 1
            }
        }
        orderItem = .init(
            name: orderItem.name,
            count: count,
            estimatedDate: orderItem.estimatedDate,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: orderItem.doubleRistretto,
            takeAway: orderItem.takeAway,
            volume: orderItem.volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: orderItem.price
        )
        refreshPrice()
        completion(orderItem)
    }
    
    func ristretto(_ doubleRistretto: Bool, _ completion: OrderOptions.CurrentCompletion?) {
        guard let completion = completion else { return }
        orderItem = .init(
            name: orderItem.name,
            count: orderItem.count,
            estimatedDate: orderItem.estimatedDate,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: doubleRistretto,
            takeAway: orderItem.takeAway,
            volume: orderItem.volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: orderItem.price
        )
        refreshPrice()
        completion(orderItem)
    }
    
    func place(_ place: Int, _ completion: OrderOptions.CurrentCompletion?) {
        guard let completion = completion else { return }
        orderItem = .init(
            name: orderItem.name,
            count: orderItem.count,
            estimatedDate: orderItem.estimatedDate,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: orderItem.doubleRistretto,
            takeAway: place != 0,
            volume: orderItem.volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: orderItem.price
        )
        completion(orderItem)
    }
    
    func volume(_ volume: Int, _ completion: OrderOptions.CurrentCompletion?) {
        guard let completion = completion else { return }

        orderItem = .init(
            name: orderItem.name,
            count: orderItem.count,
            estimatedDate: orderItem.estimatedDate,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: orderItem.doubleRistretto,
            takeAway: orderItem.takeAway,
            volume: volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: orderItem.price
        )
        refreshPrice()
        completion(orderItem)
    }
    
    func switchEnabled(_ enabled: Bool, _ completion: OrderOptions.CurrentCompletion?) {
        guard let completion = completion else { return }

        orderItem = .init(
            name: orderItem.name,
            count: orderItem.count,
            estimatedDate: enabled ? Date() + initialConfig.cookTimeAdd : nil,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: orderItem.doubleRistretto,
            takeAway: orderItem.takeAway,
            volume: orderItem.volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: orderItem.price
        )
        completion(orderItem)
    }
    
    func time(_ time: Date, _ completion: OrderOptions.CurrentCompletion?) {
        guard let completion = completion else { return }
        orderItem = .init(
            name: orderItem.name,
            count: orderItem.count,
            estimatedDate: time,
            date: orderItem.date,
            location: orderItem.location,
            doubleRistretto: orderItem.doubleRistretto,
            takeAway: orderItem.takeAway,
            volume: orderItem.volume,
            barista: orderItem.barista,
            coffeeType: orderItem.coffeeType,
            coffeeVariety: orderItem.coffeeVariety,
            roasting: orderItem.roasting,
            grinding: orderItem.grinding,
            milk: orderItem.milk,
            syrup: orderItem.syrup,
            additives: orderItem.additives,
            ice: orderItem.ice,
            price: orderItem.price
        )
        completion(orderItem)
    }
    
    func close( _ completion: OrderOptions.Completion?) {
        guard let completion = completion else { return }
        SharedOrder.shared.currentOrderItem = nil
        completion()
    }
    
    func apply( _ completion: OrderOptions.Completion?) {
        guard let completion = completion else { return }
        SharedOrder.shared.currentOrder.append(orderItem)
        SharedOrder.shared.currentOrderItem = nil
        completion()
    }
}
