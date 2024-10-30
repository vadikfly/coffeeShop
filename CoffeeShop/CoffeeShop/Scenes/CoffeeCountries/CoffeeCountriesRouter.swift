//
//  CoffeeCountriesRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeCountriesRouter {
    weak var viewController: CoffeeCountriesViewController?
    var dataStore: CoffeeCountriesDataStore?

    init(viewController: CoffeeCountriesViewController, dataStore: CoffeeCountriesDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension CoffeeCountriesRouter: CoffeeCountriesRoutingLogic {

    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    func buy() {

    }
    func select() {
        let selectedCountry = dataStore?.selectedContryItem ?? 0
        viewController?.navigationController?.pushViewController(CoffeeTypeBuilder.build(selectedCountry: selectedCountry), animated: true)
    }
}
