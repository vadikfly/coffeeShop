//
//  CoffeeCountriesInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class CoffeeCountriesInteractor {
    private let presenter: CoffeeCountriesPresentationLogic
    private let worker: CoffeeCountriesWorkingLogic
    private var model: CoffeeCountries.Model?
    private var selectedCountry: Int?


    init(presenter: CoffeeCountriesPresentationLogic, worker: CoffeeCountriesWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension CoffeeCountriesInteractor: CoffeeCountriesBusinessLogic {

    func request(_ request: CoffeeCountries.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(CoffeeCountries.Fetch.Response(model: model))
            }
        }
    }

    func request(_ request: CoffeeCountries.Close.Request) {
        presenter.present(CoffeeCountries.Close.Response())
    }

    func request(_ request: CoffeeCountries.Buy.Request) {
        presenter.present(CoffeeCountries.Buy.Response())
    }

    func request(_ request: CoffeeCountries.SelectCountry.Request) {
        selectedCountry = request.index
        worker.apply(country: request.index) { [weak self] in
            guard let self = self else { return }
            guard var model = self.model else { return }
            model.selectedCountry = self.selectedCountry
            self.presenter.present(CoffeeCountries.SelectCountry.Response(model: model))
        }
    }
}

extension CoffeeCountriesInteractor: CoffeeCountriesDataStore {
    var selectedContryItem: Int? {
        selectedCountry
    }
}

