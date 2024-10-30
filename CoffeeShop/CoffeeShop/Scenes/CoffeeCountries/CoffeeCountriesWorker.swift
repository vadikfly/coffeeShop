//
//  CoffeeCountriesWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class CoffeeCountriesWorker: CoffeeCountriesWorkingLogic {

    var selectIndex: Int?

    func fetch(_ completion: CoffeeCountries.Completion?) {
        guard let completion = completion else { return }
        guard let items = CoffeeCountry.load() else { return }

        if !(SharedOrder.shared.currentOrderItem?.coffeeVariety.isEmpty ?? true) {
            selectIndex = items.firstIndex(where: { $0.name == SharedOrder.shared.currentOrderItem?.coffeeVariety[0] })
        }

        let model: CoffeeCountries.Model = .init(
            items: items,
            selectedCountry: selectIndex
        )
        completion(model)
    }

    func apply(country: Int, _ completion: CoffeeCountries.EmptyCompletion?) {
        completion?()
    }
}
