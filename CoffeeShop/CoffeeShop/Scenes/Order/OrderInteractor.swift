//
//  OrderInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderInteractor {
    private let presenter: OrderPresentationLogic
    private let worker: OrderWorkingLogic

    private var model: Order.Model?

    init(presenter: OrderPresentationLogic, worker: OrderWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension OrderInteractor: OrderBusinessLogic {
    func request(_ request: Order.Fetch.Request) {
        worker.fetch { result in
            switch result {
            case .success(let model):
                self.model = model
                self.presenter.present(Order.Fetch.Response(model: model))
            case .failure(let error):
                self.presenter.present(Order.Fetch.Response(error: error))
            }
        }
    }

    func request(_ request: Order.CurrentOrder.Request) {
        guard let model = self.model else { return }
        presenter.present(Order.CurrentOrder.Response(model: model))
    }

    func request(_ request: Order.History.Request) {
        guard let model = self.model else { return }
        presenter.present(Order.History.Response(model: model))
    }

    func request(_ request: Order.Buy.Request) {
        guard let item = model?.history[request.index] else { return }
        worker.buy(item: item) { result in
            switch result {
            case .success(let model):
                self.model = model
                self.presenter.present(Order.Buy.Response(model: model))
            case .failure(let error):
                self.presenter.present(Order.Buy.Response(error: error))
            }
        }
    }
}

extension OrderInteractor: OrderDataStore {}
