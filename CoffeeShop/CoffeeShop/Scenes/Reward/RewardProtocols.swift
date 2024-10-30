//
//  RewardProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol RewardBusinessLogic: AnyObject {
    func request(_ request: Reward.Fetch.Request)
    func request(_ request: Reward.PayByPoints.Request)

}

protocol RewardPresentationLogic: AnyObject {
    func present(_ response: Reward.Fetch.Response)
    func present(_ response: Reward.PayByPoints.Response)

}

protocol RewardDisplayLogic: AnyObject {
    func display(_ viewModel: Reward.Fetch.ViewModel)
    func display(_ viewModel: Reward.PayByPoints.ViewModel)

}

protocol RewardRoutingLogic: AnyObject {
    func showOrderItems()
}

protocol RewardDataStore: AnyObject {}

protocol RewardWorkingLogic: AnyObject {
    func fetch(_ completion: Reward.FetchCompletion?)
}
