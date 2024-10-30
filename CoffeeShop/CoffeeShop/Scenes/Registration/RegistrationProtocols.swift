//
//  RegistrationProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol RegistrationBusinessLogic: AnyObject {
    func request(_ request: Registration.Fetch.Request)
    func request(_ request: Registration.EnterUserName.Request)
    func request(_ request: Registration.EnterPhoneNumber.Request)
    func request(_ request: Registration.EnterEMail.Request)
    func request(_ request: Registration.EnterPassword.Request)

    func request(_ request: Registration.Back.Request)
    func request(_ request: Registration.Next.Request)
    func request(_ request: Registration.Login.Request)
    func request(_ request: Registration.ShowHidePassword.Request)
}

protocol RegistrationPresentationLogic: AnyObject {
    func present(_ response: Registration.Fetch.Response)
    func present(_ response: Registration.EnterUserName.Response)
    func present(_ response: Registration.EnterPhoneNumber.Response)
    func present(_ response: Registration.EnterEMail.Response)
    func present(_ response: Registration.EnterPassword.Response)

    func present(_ response: Registration.Back.Response)
    func present(_ response: Registration.Next.Response)
    func present(_ response: Registration.Login.Response)
    func present(_ response: Registration.ShowHidePassword.Response)
}

protocol RegistrationDisplayLogic: AnyObject {
    func display(_ viewModel: Registration.Fetch.ViewModel)
    func display(_ viewModel: Registration.EnterUserName.ViewModel)
    func display(_ viewModel: Registration.EnterPhoneNumber.ViewModel)
    func display(_ viewModel: Registration.EnterEMail.ViewModel)
    func display(_ viewModel: Registration.EnterPassword.ViewModel)

    func display(_ viewModel: Registration.Back.ViewModel)
    func display(_ viewModel: Registration.Next.ViewModel)
    func display(_ viewModel: Registration.Login.ViewModel)
    func display(_ viewModel: Registration.ShowHidePassword.ViewModel)

}

protocol RegistrationRoutingLogic: AnyObject { 
    func back()
    func next()
    func login()
}

protocol RegistrationDataStore: AnyObject {}

protocol RegistrationWorkingLogic: AnyObject {
    func fetch(_ completion: Registration.FetchCompletion?)
}
