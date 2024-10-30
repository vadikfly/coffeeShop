//
//  RewardWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RewardWorker: RewardWorkingLogic {
    func fetch(_ completion: Reward.FetchCompletion?) {
        completion?(.init(totalCupCount: 8, currentCupCount: 6, bonusPoints: 23))
    }
}
