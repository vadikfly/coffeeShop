//
//  ForgotPasswordProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol ForgotPasswordBusinessLogic: AnyObject {
    func request(_ request: ForgotPassword.Fetch.Request)
    func request(_ request: ForgotPassword.Next.Request)
    func request(_ request: ForgotPassword.Back.Request)
    func request(_ request: ForgotPassword.EnterEMail.Request)

}

protocol ForgotPasswordPresentationLogic: AnyObject {
    func present(_ response: ForgotPassword.Fetch.Response)
    func present(_ response: ForgotPassword.Next.Response)
    func present(_ response: ForgotPassword.Back.Response)
    func present(_ response: ForgotPassword.EnterEMail.Response)
}

protocol ForgotPasswordDisplayLogic: AnyObject {
    func display(_ viewModel: ForgotPassword.Fetch.ViewModel)
    func display(_ viewModel: ForgotPassword.Next.ViewModel)
    func display(_ viewModel: ForgotPassword.Back.ViewModel)
    func display(_ viewModel: ForgotPassword.EnterEMail.ViewModel)

}

protocol ForgotPasswordRoutingLogic: AnyObject {
    func next()
    func back()
}

protocol ForgotPasswordDataStore: AnyObject {
}

protocol ForgotPasswordWorkingLogic: AnyObject {
    func saveEmailText(text: String, _ completion: ForgotPassword.EnterTextCompletion?)
    func fetch(_ completion: ForgotPassword.FetchCompletion?)
}
