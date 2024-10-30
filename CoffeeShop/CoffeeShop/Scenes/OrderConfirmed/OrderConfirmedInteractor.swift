//
//  OrderConfirmedInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderConfirmedInteractor {
    private let presenter: OrderConfirmedPresentationLogic
    private let worker: OrderConfirmedWorkingLogic
    private var model: OrderConfirmed.Model?


    init(presenter: OrderConfirmedPresentationLogic, worker: OrderConfirmedWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension OrderConfirmedInteractor: OrderConfirmedBusinessLogic {

    func request(_ request: OrderConfirmed.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(OrderConfirmed.Fetch.Response(model: model))
            }
        }
    }
    func request(_ request: OrderConfirmed.Close.Request) {
        self.presenter.present(OrderConfirmed.Close.Response())
    }
}

extension OrderConfirmedInteractor: OrderConfirmedDataStore {}
