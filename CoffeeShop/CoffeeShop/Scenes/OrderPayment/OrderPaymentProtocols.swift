//
//  OrderPaymentProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol OrderPaymentBusinessLogic: AnyObject {
    func request(_ request: OrderPayment.Fetch.Request)
    func request(_ request: OrderPayment.Select.Request)
    func request(_ request: OrderPayment.Next.Request)


}

protocol OrderPaymentPresentationLogic: AnyObject {
    func present(_ response: OrderPayment.Fetch.Response)
    func present(_ response: OrderPayment.Select.Response)
    func present(_ response: OrderPayment.Next.Response)


}

protocol OrderPaymentDisplayLogic: AnyObject {
    func display(_ viewModel: OrderPayment.Fetch.ViewModel)
    func display(_ viewModel: OrderPayment.Select.ViewModel)
    func display(_ viewModel: OrderPayment.Next.ViewModel)
}

protocol OrderPaymentRoutingLogic: AnyObject {
    func next()
}

protocol OrderPaymentDataStore: AnyObject {}

protocol OrderPaymentWorkingLogic: AnyObject {
    func fetch(_ completion: OrderPayment.Completion?)
    func select( _ index: Int, _ completion: OrderPayment.Completion?)
}
