//
//  MenuProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol MenuBusinessLogic: AnyObject {
    func request(_ request: Menu.Fetch.Request)
    func request(_ request: Menu.Select.Request)
    func request(_ request: Menu.Profile.Request)
    func request(_ request: Menu.Cart.Request)
}

protocol MenuPresentationLogic: AnyObject {
    func present(_ response: Menu.Fetch.Response)
    func present(_ response: Menu.Select.Response)
    func present(_ response: Menu.Profile.Response)
    func present(_ response: Menu.Cart.Response)
}

protocol MenuDisplayLogic: AnyObject {
    func display(_ viewModel: Menu.Fetch.ViewModel)
    func display(_ viewModel: Menu.Select.ViewModel)
    func display(_ viewModel: Menu.Profile.ViewModel)
    func display(_ viewModel: Menu.Cart.ViewModel)
}

protocol MenuRoutingLogic: AnyObject {
    func profile()
    func cart()
    func select()
}

protocol MenuDataStore: AnyObject {
    var coffee: Coffee? { get }
}

protocol MenuWorkingLogic: AnyObject {
    func fetch(_ completion: Menu.FetchCompletion?)
}
