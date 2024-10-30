//
//  OrderConfirmedViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderConfirmedViewController: UIViewController {
    var interactor: OrderConfirmedBusinessLogic?
    var router: OrderConfirmedRoutingLogic?

    private lazy var rootView = OrderConfirmedView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(OrderConfirmed.Close.Request())
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(OrderConfirmed.Fetch.Request())
    }
}

extension OrderConfirmedViewController: OrderConfirmedDisplayLogic {

    func display(_ viewModel: OrderConfirmed.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: OrderConfirmed.Close.ViewModel) {
        router?.close()
    }
}
