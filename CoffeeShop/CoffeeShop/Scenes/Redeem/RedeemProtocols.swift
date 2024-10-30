//
//  RedeemProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol RedeemBusinessLogic: AnyObject {
    func request(_ request: Redeem.Fetch.Request)
    func request(_ request: Redeem.Close.Request)
    func request(_ request: Redeem.Buy.Request)
}

protocol RedeemPresentationLogic: AnyObject {
    func present(_ response: Redeem.Fetch.Response)
    func present(_ response: Redeem.Close.Response)
    func present(_ response: Redeem.Buy.Response)
}

protocol RedeemDisplayLogic: AnyObject {
    func display(_ viewModel: Redeem.Fetch.ViewModel)
    func display(_ viewModel: Redeem.Close.ViewModel)
    func display(_ viewModel: Redeem.Buy.ViewModel)
}

protocol RedeemRoutingLogic: AnyObject {
    func close()
    func buy()
}

protocol RedeemDataStore: AnyObject {}

protocol RedeemWorkingLogic: AnyObject {
    func fetch(_ completion: Redeem.FetchCompletion?)
    func apply(index: Int, _ completion: Redeem.Completion?)
}
