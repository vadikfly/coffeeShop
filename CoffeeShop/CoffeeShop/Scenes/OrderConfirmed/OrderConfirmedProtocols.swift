//
//  OrderConfirmedProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol OrderConfirmedBusinessLogic: AnyObject {
    func request(_ request: OrderConfirmed.Fetch.Request)
    func request(_ request: OrderConfirmed.Close.Request)
}

protocol OrderConfirmedPresentationLogic: AnyObject {
    func present(_ response: OrderConfirmed.Fetch.Response)
    func present(_ response: OrderConfirmed.Close.Response)
}

protocol OrderConfirmedDisplayLogic: AnyObject {
    func display(_ viewModel: OrderConfirmed.Fetch.ViewModel)
    func display(_ viewModel: OrderConfirmed.Close.ViewModel)
}

protocol OrderConfirmedRoutingLogic: AnyObject {
    func close()
}

protocol OrderConfirmedDataStore: AnyObject {}

protocol OrderConfirmedWorkingLogic: AnyObject {
    func fetch(_ completion: OrderConfirmed.Completion?)
}
