//
//  CoffeeTypeInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class CoffeeTypeInteractor {
    private let presenter: CoffeeTypePresentationLogic
    private let worker: CoffeeTypeWorkingLogic
    private var model: CoffeeType.Model?
    private var selectedVariety: Int?

    init(presenter: CoffeeTypePresentationLogic, worker: CoffeeTypeWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension CoffeeTypeInteractor: CoffeeTypeBusinessLogic {

    func request(_ request: CoffeeType.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(CoffeeType.Fetch.Response(model: model))
            }
        }
    }
    func request(_ request: CoffeeType.Close.Request) {
        self.presenter.present(CoffeeType.Close.Response())
    }

    func request(_ request: CoffeeType.Buy.Request) {
        self.presenter.present(CoffeeType.Buy.Response())
    }
    func request(_ request: CoffeeType.SelectVariety.Request) {
        selectedVariety = request.index
        worker.apply(variety: request.index) { [weak self] in
            guard let self = self else { return }
            self.presenter.present(CoffeeType.SelectVariety.Response())
        }
    }
}
extension CoffeeTypeInteractor: CoffeeTypeDataStore {
    var selectedVarietyItem: Int? {
        selectedVariety
    }
}
