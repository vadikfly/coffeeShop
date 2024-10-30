//
//  TwoFactorVerificationProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol TwoFactorVerificationBusinessLogic: AnyObject {
    func request(_ request: TwoFactorVerification.Fetch.Request)
    func request(_ request: TwoFactorVerification.Close.Request)
    func request(_ request: TwoFactorVerification.Next.Request)
    func request(_ request: TwoFactorVerification.EnterPassword.Request)

}

protocol TwoFactorVerificationPresentationLogic: AnyObject {
    func present(_ response: TwoFactorVerification.Fetch.Response)
    func present(_ response: TwoFactorVerification.Close.Response)
    func present(_ response: TwoFactorVerification.Next.Response)
    func present(_ response: TwoFactorVerification.EnterPassword.Response)

}

protocol TwoFactorVerificationDisplayLogic: AnyObject {
    func display(_ viewModel: TwoFactorVerification.Fetch.ViewModel)
    func display(_ viewModel: TwoFactorVerification.Close.ViewModel)
    func display(_ viewModel: TwoFactorVerification.Next.ViewModel)
    func display(_ viewModel: TwoFactorVerification.EnterPassword.ViewModel)

}

protocol TwoFactorVerificationRoutingLogic: AnyObject {
    func close()
    func next()
}

protocol TwoFactorVerificationDataStore: AnyObject {}

protocol TwoFactorVerificationWorkingLogic: AnyObject {
    func fetch(_ completion: TwoFactorVerification.FetchCompletion?)
}
