//
//  CoffeeCountriesProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol CoffeeCountriesBusinessLogic: AnyObject {
    func request(_ request: CoffeeCountries.Fetch.Request)
    func request(_ request: CoffeeCountries.Close.Request)
    func request(_ request: CoffeeCountries.Buy.Request)
    func request(_ request: CoffeeCountries.SelectCountry.Request)

}

protocol CoffeeCountriesPresentationLogic: AnyObject {
    func present(_ response: CoffeeCountries.Fetch.Response)
    func present(_ response: CoffeeCountries.Close.Response)
    func present(_ response: CoffeeCountries.Buy.Response)
    func present(_ response: CoffeeCountries.SelectCountry.Response)

}

protocol CoffeeCountriesDisplayLogic: AnyObject {
    func display(_ viewModel: CoffeeCountries.Fetch.ViewModel)
    func display(_ viewModel: CoffeeCountries.Close.ViewModel)
    func display(_ viewModel: CoffeeCountries.Buy.ViewModel)
    func display(_ viewModel: CoffeeCountries.SelectCountry.ViewModel)

}

protocol CoffeeCountriesRoutingLogic: AnyObject {
    func close()
    func buy()
    func select()
}

protocol CoffeeCountriesDataStore: AnyObject {
    var selectedContryItem: Int? { get }
}

protocol CoffeeCountriesWorkingLogic: AnyObject {
    func fetch(_ completion: CoffeeCountries.Completion?)
    func apply(country: Int, _ completion: CoffeeCountries.EmptyCompletion?)
}
