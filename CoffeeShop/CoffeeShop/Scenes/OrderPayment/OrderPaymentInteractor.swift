//
//  OrderPaymentInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderPaymentInteractor {
    private let presenter: OrderPaymentPresentationLogic
    private let worker: OrderPaymentWorkingLogic
    
    private var model: OrderPayment.Model?


    init(presenter: OrderPaymentPresentationLogic, worker: OrderPaymentWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension OrderPaymentInteractor: OrderPaymentBusinessLogic {
    func request(_ request: OrderPayment.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(OrderPayment.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: OrderPayment.Select.Request) {
        worker.select(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(OrderPayment.Select.Response(model: model))
            }
        }
    }
    
    func request(_ request: OrderPayment.Next.Request) {
        presenter.present(OrderPayment.Next.Response())
    }
}

extension OrderPaymentInteractor: OrderPaymentDataStore {}
