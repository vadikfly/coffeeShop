//
//  RedeemInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RedeemInteractor {
    private let presenter: RedeemPresentationLogic
    private let worker: RedeemWorkingLogic
    private var model: Redeem.Model?

    init(presenter: RedeemPresentationLogic, worker: RedeemWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension RedeemInteractor: RedeemBusinessLogic {

    func request(_ request: Redeem.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Redeem.Fetch.Response(model: model))
            }
        }
    }

    func request(_ request: Redeem.Close.Request) {
        self.presenter.present(Redeem.Close.Response())
    }

    func request(_ request: Redeem.Buy.Request) {
        worker.apply(index: request.index) { [weak self] value in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.presenter.present(Redeem.Buy.Response(canGo: value))
            }
        }
    }
}

extension RedeemInteractor: RedeemDataStore {}
