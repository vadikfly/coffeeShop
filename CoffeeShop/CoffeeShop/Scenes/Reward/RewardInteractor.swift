//
//  RewardInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RewardInteractor {
    private let presenter: RewardPresentationLogic
    private let worker: RewardWorkingLogic
    
    private var didPayButtonPress: Bool = false

    init(presenter: RewardPresentationLogic, worker: RewardWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension RewardInteractor: RewardBusinessLogic {
    func request(_ request: Reward.Fetch.Request) {
        worker.fetch { model in
            self.presenter.present(Reward.Fetch.Response(model: model))
        }
    }
    
    func request(_ request: Reward.PayByPoints.Request) {
        didPayButtonPress = true
        presenter.present(Reward.PayByPoints.Response())
    }
}

extension RewardInteractor: RewardDataStore {}
