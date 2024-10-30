//
//  MyOrderProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol MyOrderBusinessLogic: AnyObject {
    func request(_ request: MyOrder.Fetch.Request)
    func request(_ request: MyOrder.Close.Request)
    func request(_ request: MyOrder.Next.Request)
    func request(_ request: MyOrder.Delete.Request)
}

protocol MyOrderPresentationLogic: AnyObject {
    func present(_ response: MyOrder.Fetch.Response)
    func present(_ response: MyOrder.Close.Response)
    func present(_ response: MyOrder.Next.Response)
    func present(_ response: MyOrder.Delete.Response)
}

protocol MyOrderDisplayLogic: AnyObject {
    func display(_ viewModel: MyOrder.Fetch.ViewModel)
    func display(_ viewModel: MyOrder.Close.ViewModel)
    func display(_ viewModel: MyOrder.Next.ViewModel)
    func display(_ viewModel: MyOrder.Delete.ViewModel)
}

protocol MyOrderRoutingLogic: AnyObject {
    func close()
    func next()
}

protocol MyOrderDataStore: AnyObject {}

protocol MyOrderWorkingLogic: AnyObject {
    func fetch(_ completion: MyOrder.FetchCompletion?)
    func delete( _ index: Int, _ completion: MyOrder.DeleteCompletion?)
}
