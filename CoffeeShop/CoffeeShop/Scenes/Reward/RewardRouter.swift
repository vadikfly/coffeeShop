//
//  RewardRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RewardRouter {
    weak var viewController: RewardViewController?
    var dataStore: RewardDataStore?

    init(viewController: RewardViewController, dataStore: RewardDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension RewardRouter: RewardRoutingLogic {
    func showOrderItems() {
        viewController?.navigationController?.pushViewController(RedeemBuilder.build(), animated: true)
    }
}
