//
//  StartupScreenProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved..
//

import Foundation

protocol StartupScreenBusinessLogic: AnyObject {
    func request(_ request: StartupScreen.Fetch.Request)
}

protocol StartupScreenPresentationLogic: AnyObject {
    func present(_ response: StartupScreen.Fetch.Response)
}

protocol StartupScreenDisplayLogic: AnyObject {
    func display(_ viewModel: StartupScreen.Fetch.ViewModel)
}

protocol StartupScreenRoutingLogic: AnyObject {
    func showTabs()
    func showWelcome()
    func showLogin()
}

protocol StartupScreenDataStore: AnyObject {}

protocol StartupScreenWorkingLogic: AnyObject {
    func fetch(_ completion: StartupScreen.FetchCompletion?)
}
