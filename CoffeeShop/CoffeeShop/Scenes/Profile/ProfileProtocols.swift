//
//  ProfileProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol ProfileBusinessLogic: AnyObject {
    func request(_ request: Profile.Fetch.Request)
    func request(_ request: Profile.Close.Request)
    func request(_ request: Profile.EditingName.Request)
    func request(_ request: Profile.EditingPhone.Request)
    func request(_ request: Profile.EditingEmail.Request)
    func request(_ request: Profile.EditingAddress.Request)
    func request(_ request: Profile.EditingEnd.Request)
    func request(_ request: Profile.TextName.Request)
    func request(_ request: Profile.TextPhone.Request)
    func request(_ request: Profile.TextEmail.Request)
    func request(_ request: Profile.ApplyAddress.Request)
}

protocol ProfilePresentationLogic: AnyObject {
    func present(_ response: Profile.Fetch.Response)
    func present(_ response: Profile.Close.Response)
    func present(_ response: Profile.EditingName.Response)
    func present(_ response: Profile.EditingPhone.Response)
    func present(_ response: Profile.EditingEmail.Response)
    func present(_ response: Profile.EditingAddress.Response)
    func present(_ response: Profile.EditingEnd.Response)
    func present(_ response: Profile.TextName.Response)
    func present(_ response: Profile.TextPhone.Response)
    func present(_ response: Profile.TextEmail.Response)
    func present(_ response: Profile.ApplyAddress.Response)

}

protocol ProfileDisplayLogic: AnyObject {
    func display(_ viewModel: Profile.Fetch.ViewModel)
    func display(_ viewModel: Profile.Close.ViewModel)
    func display(_ viewModel: Profile.EditingName.ViewModel)
    func display(_ viewModel: Profile.EditingPhone.ViewModel)
    func display(_ viewModel: Profile.EditingEmail.ViewModel)
    func display(_ viewModel: Profile.EditingAddress.ViewModel)
    func display(_ viewModel: Profile.EditingEnd.ViewModel)
    func display(_ viewModel: Profile.TextName.ViewModel)
    func display(_ viewModel: Profile.TextPhone.ViewModel)
    func display(_ viewModel: Profile.TextEmail.ViewModel)
    func display(_ viewModel: Profile.ApplyAddress.ViewModel)

}

protocol ProfileRoutingLogic: AnyObject {
    func close()
}

protocol ProfileDataStore: AnyObject {}

protocol ProfileWorkingLogic: AnyObject {
    func fetch(_ completion: Profile.Completion?)
    func name(_ name: String, _ completion: Profile.Completion?)
    func phone(_ phone: String, _ completion: Profile.Completion?)
    func email(_ email: String, _ completion: Profile.Completion?)
    func address(_ index: Int, _ completion: Profile.Completion?)
}
