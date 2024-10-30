//
//  MyOrderInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class MyOrderInteractor {
    private let presenter: MyOrderPresentationLogic
    private let worker: MyOrderWorkingLogic
    
    private var model: MyOrder.Model?

    init(presenter: MyOrderPresentationLogic, worker: MyOrderWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension MyOrderInteractor: MyOrderBusinessLogic {
    func request(_ request: MyOrder.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(MyOrder.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: MyOrder.Close.Request) {
        presenter.present(MyOrder.Close.Response())
    }
    
    func request(_ request: MyOrder.Next.Request) {
        presenter.present(MyOrder.Next.Response())
    }
    
    func request(_ request: MyOrder.Delete.Request) {
        worker.delete(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(MyOrder.Delete.Response(model: model))
            }
        }
    }
}

extension MyOrderInteractor: MyOrderDataStore {}
