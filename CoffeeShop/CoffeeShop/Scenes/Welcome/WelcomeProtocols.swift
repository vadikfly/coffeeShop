//
//  WelcomeProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol WelcomeBusinessLogic: AnyObject {
    func request(_ request: Welcome.Fetch.Request)
    func request(_ request: Welcome.Continue.Request)
}

protocol WelcomePresentationLogic: AnyObject {
    func present(_ response: Welcome.Fetch.Response)
    func present(_ response: Welcome.Continue.Response)
}

protocol WelcomeDisplayLogic: AnyObject {
    func display(_ viewModel: Welcome.Fetch.ViewModel)
    func display(_ viewModel: Welcome.Continue.ViewModel)
}

protocol WelcomeRoutingLogic: AnyObject {
    func showAuth()
}

protocol WelcomeDataStore: AnyObject {}

protocol WelcomeWorkingLogic: AnyObject {}
