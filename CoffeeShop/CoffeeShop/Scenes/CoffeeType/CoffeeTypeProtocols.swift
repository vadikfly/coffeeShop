//
//  CoffeeTypeProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol CoffeeTypeBusinessLogic: AnyObject {
    func request(_ request: CoffeeType.Fetch.Request)
    func request(_ request: CoffeeType.Close.Request)
    func request(_ request: CoffeeType.Buy.Request)
    func request(_ request: CoffeeType.SelectVariety.Request)
}

protocol CoffeeTypePresentationLogic: AnyObject {
    func present(_ response: CoffeeType.Fetch.Response)
    func present(_ response: CoffeeType.Close.Response)
    func present(_ response: CoffeeType.Buy.Response)
    func present(_ response: CoffeeType.SelectVariety.Response)
}

protocol CoffeeTypeDisplayLogic: AnyObject {
    func display(_ viewModel: CoffeeType.Fetch.ViewModel)
    func display(_ viewModel: CoffeeType.Close.ViewModel)
    func display(_ viewModel: CoffeeType.Buy.ViewModel)
    func display(_ viewModel: CoffeeType.SelectVariety.ViewModel)
}

protocol CoffeeTypeRoutingLogic: AnyObject {
    func close()
    func buy()
    func select()
}

protocol CoffeeTypeDataStore: AnyObject {
    var selectedVarietyItem: Int? { get }
}

protocol CoffeeTypeWorkingLogic: AnyObject {
    func fetch(_ completion: CoffeeType.Completion?)
    func apply(variety: Int, _ completion: CoffeeType.EmptyCompletion?)

}
