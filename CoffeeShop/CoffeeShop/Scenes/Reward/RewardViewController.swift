//
//  RewardViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RewardViewController: UIViewController {
    var interactor: RewardBusinessLogic?
    var router: RewardRoutingLogic?

    private lazy var rootView = RewardView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .payByPoints:
                self.interactor?.request(Reward.PayByPoints.Request())
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.request(Reward.Fetch.Request())
    }

}

extension RewardViewController: RewardDisplayLogic {
    func display(_ viewModel: Reward.Fetch.ViewModel) {
        rootView.viewModel = viewModel.fetchViewModel.convert()
    }


    func display(_ viewModel: Reward.PayByPoints.ViewModel) {
        router?.showOrderItems()
    }
}

private extension Reward.ViewModel {
    func convert() -> RewardView.Model {
        return .init(
            bonusPoints: bonusPoints,
            countText: countText,
            totalCount: totalCupCount,
            currentCount: currentCupCount,
            items: []
        )
    }
}
