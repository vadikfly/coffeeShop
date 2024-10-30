//
//  OrderProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol OrderBusinessLogic: AnyObject {
    func request(_ request: Order.Fetch.Request)
    func request(_ request: Order.CurrentOrder.Request)
    func request(_ request: Order.History.Request)
    func request(_ request: Order.Buy.Request)
}

protocol OrderPresentationLogic: AnyObject {
    func present(_ response: Order.Fetch.Response)
    func present(_ response: Order.CurrentOrder.Response)
    func present(_ response: Order.History.Response)
    func present(_ response: Order.Buy.Response)
}

protocol OrderDisplayLogic: AnyObject {
    func display(_ viewModel: Order.Fetch.ViewModel)
    func display(_ viewModel: Order.CurrentOrder.ViewModel)
    func display(_ viewModel: Order.History.ViewModel)
    func display(_ viewModel: Order.Buy.ViewModel)
}

protocol OrderRoutingLogic: AnyObject {
    func show()
}

protocol OrderDataStore: AnyObject {}

protocol OrderWorkingLogic: AnyObject {
    func fetch(_ completion: Order.FetchCompletion?)
    /// Re-order method
    func buy(item: OrderItem, _ completion: Order.FetchCompletion?)
}
