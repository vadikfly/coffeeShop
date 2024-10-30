//
//  TabbarProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol TabbarBusinessLogic: AnyObject {
    func request(_ request: Tabbar.Something.Request)
}

protocol TabbarPresentationLogic: AnyObject {
    func present(_ response: Tabbar.Something.Response)
}

protocol TabbarDisplayLogic: AnyObject {
    func display(_ viewModel: Tabbar.Something.ViewModel)
}

protocol TabbarRoutingLogic: AnyObject {
    func show()
}

protocol TabbarDataStore: AnyObject {}

protocol TabbarWorkingLogic: AnyObject {}
