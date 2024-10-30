//
//  AdditivesProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol AdditivesBusinessLogic: AnyObject {
    func request(_ request: Additives.Fetch.Request)
    func request(_ request: Additives.Close.Request)
    func request(_ request: Additives.Buy.Request)
    func request(_ request: Additives.SelectAdditives.Request)
    func request(_ request: Additives.ApplyAdditives.Request)
}

protocol AdditivesPresentationLogic: AnyObject {
    func present(_ response: Additives.Fetch.Response)
    func present(_ response: Additives.Close.Response)
    func present(_ response: Additives.Buy.Response)
    func present(_ response: Additives.SelectAdditives.Response)
    func present(_ response: Additives.ApplyAdditives.Response)
}

protocol AdditivesDisplayLogic: AnyObject {
    func display(_ viewModel: Additives.Fetch.ViewModel)
    func display(_ viewModel: Additives.Close.ViewModel)
    func display(_ viewModel: Additives.Buy.ViewModel)
    func display(_ viewModel: Additives.SelectAdditives.ViewModel)
    func display(_ viewModel: Additives.ApplyAdditives.ViewModel)
}

protocol AdditivesRoutingLogic: AnyObject {
    func close()
    func buy()
}

protocol AdditivesDataStore: AnyObject {
}

protocol AdditivesWorkingLogic: AnyObject {
    func fetch(_ completion: Additives.Completion?)
    func apply(selected: Set<Int>, _ completion: Additives.SaveCompletion?) 
    func close(selected: Set<Int>, _ completion: Additives.SaveCompletion?)
}
