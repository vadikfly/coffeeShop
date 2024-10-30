//
//  BaristaProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol BaristaBusinessLogic: AnyObject {
    func request(_ request: Barista.Fetch.Request)
    func request(_ request: Barista.Close.Request)
    func request(_ request: Barista.Buy.Request)
    func request(_ request: Barista.SelectBarista.Request)
}

protocol BaristaPresentationLogic: AnyObject {
    func present(_ response: Barista.Fetch.Response)
    func present(_ response: Barista.Close.Response)
    func present(_ response: Barista.Buy.Response)
    func present(_ response: Barista.SelectBarista.Response)
}

protocol BaristaDisplayLogic: AnyObject {
    func display(_ viewModel: Barista.Fetch.ViewModel)
    func display(_ viewModel: Barista.Close.ViewModel)
    func display(_ viewModel: Barista.Buy.ViewModel)
    func display(_ viewModel: Barista.SelectBarista.ViewModel)
}

protocol BaristaRoutingLogic: AnyObject {
    func close()
    func buy()
    func select()
}

protocol BaristaDataStore: AnyObject {
    var selectedItem: Employee? { get }
}

protocol BaristaWorkingLogic: AnyObject {
    func fetch(_ completion: Barista.Completion?)
    func apply(barista: Employee, _ completion: Barista.EmptyCompletion?)
}
