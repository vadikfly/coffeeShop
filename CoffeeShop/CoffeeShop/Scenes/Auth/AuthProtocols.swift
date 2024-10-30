//
//  AuthProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol AuthBusinessLogic: AnyObject {
    func request(_ request: Auth.Fetch.Request)
    func request(_ request: Auth.Back.Request)
    func request(_ request: Auth.EnterAdress.Request)
    func request(_ request: Auth.EnterPassword.Request)
    func request(_ request: Auth.ShowPassword.Request)
    func request(_ request: Auth.ForgotPassword.Request)
    func request(_ request: Auth.Next.Request)
    func request(_ request: Auth.Registration.Request)
}

protocol AuthPresentationLogic: AnyObject {
    func present(_ response: Auth.Fetch.Response)
    func present(_ response: Auth.Back.Response)
    func present(_ response: Auth.EnterAdress.Response)
    func present(_ response: Auth.EnterPassword.Response)
    func present(_ response: Auth.ShowPassword.Response)
    func present(_ response: Auth.ForgotPassword.Response)
    func present(_ response: Auth.Next.Response)
    func present(_ response: Auth.Registration.Response)
}

protocol AuthDisplayLogic: AnyObject {
    func display(_ viewModel: Auth.Fetch.ViewModel)
    func display(_ viewModel: Auth.Back.ViewModel)
    func display(_ viewModel: Auth.EnterAdress.ViewModel)
    func display(_ viewModel: Auth.EnterPassword.ViewModel)
    func display(_ viewModel: Auth.ShowPassword.ViewModel)
    func display(_ viewModel: Auth.ForgotPassword.ViewModel)
    func display(_ viewModel: Auth.Next.ViewModel)
    func display(_ viewModel: Auth.Registration.ViewModel)
}

protocol AuthRoutingLogic: AnyObject {
    func back()
    func next()
    func forgotPassword()
    func registration()
}

protocol AuthDataStore: AnyObject {}

protocol AuthWorkingLogic: AnyObject {
    func fetch(_ completion: Auth.FetchCompletion?)
    func login(username: String, password: String)
}
