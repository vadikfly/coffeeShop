//
//  OrderOptionsProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol OrderOptionsBusinessLogic: AnyObject {
    func request(_ request: OrderOptions.Fetch.Request)
    func request(_ request: OrderOptions.Close.Request)
    func request(_ request: OrderOptions.Cart.Request)
    func request(_ request: OrderOptions.PlusCount.Request)
    func request(_ request: OrderOptions.MinusCount.Request)
    func request(_ request: OrderOptions.OneRistretto.Request)
    func request(_ request: OrderOptions.TwoRistretto.Request)
    func request(_ request: OrderOptions.Place.Request)
    func request(_ request: OrderOptions.Volume.Request)
    func request(_ request: OrderOptions.CookSwitch.Request)
    func request(_ request: OrderOptions.CookTime.Request)
    func request(_ request: OrderOptions.Constructor.Request)
    func request(_ request: OrderOptions.Next.Request)
}

protocol OrderOptionsPresentationLogic: AnyObject {
    func present(_ response: OrderOptions.Fetch.Response)
    func present(_ response: OrderOptions.Close.Response)
    func present(_ response: OrderOptions.Cart.Response)
    func present(_ response: OrderOptions.PlusCount.Response)
    func present(_ response: OrderOptions.MinusCount.Response)
    func present(_ response: OrderOptions.OneRistretto.Response)
    func present(_ response: OrderOptions.TwoRistretto.Response)
    func present(_ response: OrderOptions.Place.Response)
    func present(_ response: OrderOptions.Volume.Response)
    func present(_ response: OrderOptions.CookSwitch.Response)
    func present(_ response: OrderOptions.CookTime.Response)
    func present(_ response: OrderOptions.Constructor.Response)
    func present(_ response: OrderOptions.Next.Response)
}

protocol OrderOptionsDisplayLogic: AnyObject {
    func display(_ viewModel: OrderOptions.Fetch.ViewModel)
    func display(_ viewModel: OrderOptions.Close.ViewModel)
    func display(_ viewModel: OrderOptions.Cart.ViewModel)
    func display(_ viewModel: OrderOptions.PlusCount.ViewModel)
    func display(_ viewModel: OrderOptions.MinusCount.ViewModel)
    func display(_ viewModel: OrderOptions.OneRistretto.ViewModel)
    func display(_ viewModel: OrderOptions.TwoRistretto.ViewModel)
    func display(_ viewModel: OrderOptions.Place.ViewModel)
    func display(_ viewModel: OrderOptions.Volume.ViewModel)
    func display(_ viewModel: OrderOptions.CookSwitch.ViewModel)
    func display(_ viewModel: OrderOptions.CookTime.ViewModel)
    func display(_ viewModel: OrderOptions.Constructor.ViewModel)
    func display(_ viewModel: OrderOptions.Next.ViewModel)
}

protocol OrderOptionsRoutingLogic: AnyObject {
    func close()
    func cart()
    func constructor()
    func next()
}

protocol OrderOptionsDataStore: AnyObject {}

protocol OrderOptionsWorkingLogic: AnyObject {
    func fetch(_ completion: OrderOptions.FetchCompletion?)
    func count(_ sign: Bool,_ completion: OrderOptions.CurrentCompletion?)
    func ristretto(_ doubleRistretto: Bool, _ completion: OrderOptions.CurrentCompletion?)
    func place(_ place: Int, _ completion: OrderOptions.CurrentCompletion?)
    func volume(_ volume: Int, _ completion: OrderOptions.CurrentCompletion?)
    func switchEnabled(_ enabled: Bool, _ completion: OrderOptions.CurrentCompletion?)
    func time(_ time: Date, _ completion: OrderOptions.CurrentCompletion?)
    func close(_ completion: OrderOptions.Completion?)
    func apply(_ completion: OrderOptions.Completion?)
}
