//
//  OrderPaymentViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderPaymentViewController: UIViewController {
    var interactor: OrderPaymentBusinessLogic?
    var router: OrderPaymentRoutingLogic?

    private lazy var rootView = OrderPaymentView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .next:
                self.interactor?.request(OrderPayment.Next.Request())
            case .select(let index):
                self.interactor?.request(OrderPayment.Select.Request(index: index))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(OrderPayment.Fetch.Request())
    }
}

extension OrderPaymentViewController: OrderPaymentDisplayLogic {
    func display(_ viewModel: OrderPayment.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: OrderPayment.Select.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: OrderPayment.Next.ViewModel) {
        router?.next()
    }
}
