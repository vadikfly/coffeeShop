//
//  OrderItem.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 20.09.2021.
//

import Foundation

struct OrderItem {
    let name: Coffee
    let count: Int
    let estimatedDate: Date?
    let date: Date?
    let location: String?
    let doubleRistretto: Bool
    let takeAway: Bool
    let volume: Int
    let barista: Employee?
    let coffeeType: Float
    let coffeeVariety: [String?]
    let roasting: Int
    let grinding: Int
    let milk: Milk
    let syrup: Syrup
    let additives: Set<Int>
    let ice: Int?
    let price: Int
    
    static func defaultItem(coffee: Coffee, price: Int) -> OrderItem {
        return .init(
            name: coffee,
            count: 1,
            estimatedDate: nil,
            date: nil,
            location: nil,
            doubleRistretto: false,
            takeAway: true,
            volume: 1,
            barista: nil,
            coffeeType: 0.5,
            coffeeVariety: [],
            roasting: 1,
            grinding: 0,
            milk: .no,
            syrup: .no,
            additives: [],
            ice: nil,
            price: price
        )
    }
}

enum Coffee: Int, CaseIterable {
    case americano
    case latte
    case raf
    case capucino
    case flatwhite
    case espresso
}

enum Milk: Int, CaseIterable {
    case no
    case cow
    case lactoseFree
    case fatFree
    case vegetable
}

enum Syrup: Int, CaseIterable {
    case no
    case amaretto
    case coconut
    case vanilla
    case caramel
}

enum AdditivesList: Int, CaseIterable {
    case ceylon
    case gratedСhocolate
    case liquidChocolate
    case marshmallow
    case whippedCream
    case cream
    case muscatNut
    case iceCream
}


