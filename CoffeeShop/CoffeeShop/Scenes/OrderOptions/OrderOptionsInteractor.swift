//
//  OrderOptionsInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class OrderOptionsInteractor {
    private let presenter: OrderOptionsPresentationLogic
    private let worker: OrderOptionsWorkingLogic
    
    private var model: OrderOptions.Model?
    private var orderItem: OrderItem?

    init(presenter: OrderOptionsPresentationLogic, worker: OrderOptionsWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension OrderOptionsInteractor: OrderOptionsBusinessLogic {
    func request(_ request: OrderOptions.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(OrderOptions.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: OrderOptions.Close.Request) {
        worker.close {
            DispatchQueue.main.async {
                self.presenter.present(OrderOptions.Close.Response())
            }
        }
    }
    
    func request(_ request: OrderOptions.Cart.Request) {
        presenter.present(OrderOptions.Cart.Response())
    }
    
    func request(_ request: OrderOptions.PlusCount.Request) {
        worker.count(true) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.PlusCount.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.MinusCount.Request) {
        worker.count(false) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.MinusCount.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.OneRistretto.Request) {
        worker.ristretto(false) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.OneRistretto.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.TwoRistretto.Request) {
        worker.ristretto(true) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.TwoRistretto.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.Place.Request) {
        worker.place(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.Place.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.Volume.Request) {
        worker.volume(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.Volume.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.CookSwitch.Request) {
        worker.switchEnabled(request.value) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                //self.orderItem = model
                self.presenter.present(
                    OrderOptions.CookSwitch.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.CookTime.Request) {
        worker.time(request.value) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(
                    OrderOptions.CookTime.Response(model: model)
                )
            }
        }
    }
    
    func request(_ request: OrderOptions.Constructor.Request) {
        presenter.present(OrderOptions.Constructor.Response())
    }
    
    func request(_ request: OrderOptions.Next.Request) {
        worker.apply {
            DispatchQueue.main.async {
                self.presenter.present(OrderOptions.Next.Response())
            }
        }
    }
}

extension OrderOptionsInteractor: OrderOptionsDataStore {}
