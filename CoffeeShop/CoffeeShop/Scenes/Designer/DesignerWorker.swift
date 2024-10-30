//
//  DesignerWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class DesignerWorker: DesignerWorkingLogic {

    private var item: OrderItem {
        get {
            guard let item = SharedOrder.shared.currentOrderItem else {
                let new: OrderItem = OrderItem.defaultItem(coffee: .americano, price: 300)
                SharedOrder.shared.currentOrderItem = new
                return new
            }
            return item
        }
        set {
            SharedOrder.shared.currentOrderItem = newValue
        }
    }
    
    func fetch(_ completion: Designer.Completion?) {
        guard let completion = completion else { return }
        let model: Designer.Model = .init(
            orderItem: item
        )
        completion(model)
    }
    
    func сoffeTypeValue(_ coffeeTypeValue: Float, _ completion: Designer.CurrentCompletion?) {
        guard let completion = completion else { return }
        item = .init(
            name: item.name,
            count: item.count,
            estimatedDate: item.estimatedDate,
            date: item.date,
            location: item.location,
            doubleRistretto: item.doubleRistretto,
            takeAway: item.takeAway,
            volume: item.volume,
            barista: item.barista,
            coffeeType: coffeeTypeValue,
            coffeeVariety: item.coffeeVariety,
            roasting: item.roasting,
            grinding: item.grinding,
            milk: item.milk,
            syrup: item.syrup,
            additives: item.additives,
            ice: item.ice,
            price: item.price
        )
        completion(item)
    }
    
    func roasting(_ roasting: Int, _ completion: Designer.CurrentCompletion?) {
        guard let completion = completion else { return }
        item = .init(
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
            roasting: roasting,
            grinding: item.grinding,
            milk: item.milk,
            syrup: item.syrup,
            additives: item.additives,
            ice: item.ice,
            price: item.price
        )
        completion(item)
    }
    
    func grinding(_ grinding: Int, _ completion: Designer.CurrentCompletion?) {
        guard let completion = completion else { return }
        item = .init(
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
            grinding: grinding,
            milk: item.milk,
            syrup: item.syrup,
            additives: item.additives,
            ice: item.ice,
            price: item.price
        )
        completion(item)
    }
    
    func ice(_ ice: Int, _ completion: Designer.CurrentCompletion?) {
        guard let completion = completion else { return }
        item = .init(
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
            additives: item.additives,
            ice: ice,
            price: item.price
        )
        completion(item)
    }
    
    func milk(_ milk: Milk, _ completion: Designer.CurrentCompletion?) {
        guard let completion = completion else { return }
        item = .init(
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
            milk: milk,
            syrup: item.syrup,
            additives: item.additives,
            ice: item.ice,
            price: item.price
        )
        completion(item)
    }
    
    func syrup(_ syrup: Syrup, _ completion: Designer.CurrentCompletion?) {
        guard let completion = completion else { return }
        item = .init(
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
            syrup: syrup,
            additives: item.additives,
            ice: item.ice,
            price: item.price
        )
        completion(item)
    }
}
