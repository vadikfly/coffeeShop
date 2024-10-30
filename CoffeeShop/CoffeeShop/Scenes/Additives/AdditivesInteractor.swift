//
//  AdditivesInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class AdditivesInteractor {
    private let presenter: AdditivesPresentationLogic
    private let worker: AdditivesWorkingLogic
    
    private var model: Additives.Model?
    private var selected: Set<Int> = []

    init(presenter: AdditivesPresentationLogic, worker: AdditivesWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension AdditivesInteractor: AdditivesBusinessLogic {

    func request(_ request: Additives.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.selected = model.selected
                self.presenter.present(Additives.Fetch.Response(model: model))
            }
        }
    }

    func request(_ request: Additives.Close.Request) {
        worker.close(selected: selected) {
            DispatchQueue.main.async {
                self.presenter.present(Additives.Close.Response())
            }
        }
    }

    func request(_ request: Additives.Buy.Request) {
        self.presenter.present(Additives.Buy.Response())
    }

    func request(_ request: Additives.SelectAdditives.Request) {
        if selected.contains(request.index) {
            selected.remove(request.index)
        }
        else {
            selected.insert(request.index)
        }
        guard let model = model else { return }
        self.presenter.present(Additives.SelectAdditives.Response(model: .init(items: model.items, selected: selected)))
    }
    
    func request(_ request: Additives.ApplyAdditives.Request) {
        worker.apply(selected: selected) {
            DispatchQueue.main.async {
                self.presenter.present(Additives.ApplyAdditives.Response())
            }
        }
    }
}

extension AdditivesInteractor: AdditivesDataStore {
}
