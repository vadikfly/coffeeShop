//
//  RewardPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class RewardPresenter {
    weak var view: RewardDisplayLogic?

    init(view: RewardDisplayLogic) {
        self.view = view
    }
}

extension RewardPresenter: RewardPresentationLogic {
    func present(_ response: Reward.Fetch.Response) {
        view?.display(
            Reward.Fetch.ViewModel(
                fetchViewModel: .init(
                    totalCupCount: response.model.totalCupCount,
                    currentCupCount: response.model.currentCupCount,
                    countText: "\(response.model.currentCupCount) / \(response.model.totalCupCount)",
                    bonusPoints: "\(response.model.bonusPoints)"
                )
            )
        )
    }
    
    func present(_ response: Reward.PayByPoints.Response) {
        view?.display(Reward.PayByPoints.ViewModel())
    }
}
