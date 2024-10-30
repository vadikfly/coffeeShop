//
//  CoffeeCountriesPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class CoffeeCountriesPresenter {
    weak var view: CoffeeCountriesDisplayLogic?

    init(view: CoffeeCountriesDisplayLogic) {
        self.view = view
    }
}

extension CoffeeCountriesPresenter: CoffeeCountriesPresentationLogic {

    func present(_ response: CoffeeCountries.Fetch.Response) {
        view?.display(
            CoffeeCountries.Fetch.ViewModel(
                root: response.model.viewModel()
            )
        )
    }

    func present(_ response: CoffeeCountries.SelectCountry.Response) {
        view?.display(
            CoffeeCountries.SelectCountry.ViewModel(
                root: response.model.viewModel()
            )
        )
    }
    func present(_ response: CoffeeCountries.Close.Response) {
        view?.display(CoffeeCountries.Close.ViewModel())
    }
    func present(_ response: CoffeeCountries.Buy.Response) {
        view?.display(CoffeeCountries.Buy.ViewModel())
    }
}

private extension CoffeeCountries.Model {
    func viewModel() -> CoffeeCountries.RootViewModel {
        .init(
            countryNameItems: items.map { item in
                return .init(id: item.id, name: item.name)
            },
            selectedCountry: selectedCountry
        )
    }
}
