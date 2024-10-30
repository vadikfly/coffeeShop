//
//  BaristaInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class BaristaInteractor {
    private let presenter: BaristaPresentationLogic
    private let worker: BaristaWorkingLogic
    private var model: Barista.Model?
    private var selectedBarista: Int?

    init(presenter: BaristaPresentationLogic, worker: BaristaWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension BaristaInteractor: BaristaBusinessLogic {


    func request(_ request: Barista.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Barista.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: Barista.Close.Request) {
        presenter.present(Barista.Close.Response())
    }
    
    func request(_ request: Barista.Buy.Request) {
        presenter.present(Barista.Buy.Response())
    }
    
    func request(_ request: Barista.SelectBarista.Request) {
        selectedBarista = request.index
        guard let barista = selectedItem else { return }
        if selectedItem?.isAvailable == true {
            worker.apply(barista: barista) { [weak self] in
                guard let self = self else { return }
                self.presenter.present(Barista.SelectBarista.Response())
            }
        }
    }
}

extension BaristaInteractor: BaristaDataStore {
    var selectedItem: Employee? {
        guard let index = selectedBarista, let items = model?.items, index < items.count else {
            return nil
        }
        return items[index] 
    }
}
