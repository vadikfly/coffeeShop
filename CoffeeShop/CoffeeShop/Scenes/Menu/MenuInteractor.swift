//
//  MenuInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class MenuInteractor {
    private let presenter: MenuPresentationLogic
    private let worker: MenuWorkingLogic
    
    private var model: Menu.Model?
    private var items: [Coffee] {
        return model?.items ?? []
    }
    private var selectedCoffee: Coffee?

    init(presenter: MenuPresentationLogic, worker: MenuWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension MenuInteractor: MenuBusinessLogic {
    func request(_ request: Menu.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Menu.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: Menu.Select.Request) {
        selectedCoffee = items[request.index]
        presenter.present(Menu.Select.Response())
    }
    
    func request(_ request: Menu.Profile.Request) {
        presenter.present(Menu.Profile.Response())
    }
    
    func request(_ request: Menu.Cart.Request) {
        presenter.present(Menu.Cart.Response())
    }
    
}

extension MenuInteractor: MenuDataStore {
    var coffee: Coffee? {
        return selectedCoffee
    }
}
