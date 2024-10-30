//
//  CoffeeCountriesViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeCountriesViewController: UIViewController {
    var interactor: CoffeeCountriesBusinessLogic?
    var router: CoffeeCountriesRoutingLogic?

    private let rootView = CoffeeCountriesView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(CoffeeCountries.Close.Request())
            case .buy:
                self.interactor?.request(CoffeeCountries.Buy.Request())
            case .selectCountry(let index):
                self.interactor?.request(CoffeeCountries.SelectCountry.Request(index: index))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(CoffeeCountries.Fetch.Request())
    }

}

extension CoffeeCountriesViewController: CoffeeCountriesDisplayLogic {

    func display(_ viewModel: CoffeeCountries.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: CoffeeCountries.Close.ViewModel) {
        router?.close()
    }
    func display(_ viewModel: CoffeeCountries.Buy.ViewModel) {
        router?.buy()
    }
    func display(_ viewModel: CoffeeCountries.SelectCountry.ViewModel) {
        rootView.viewModel = viewModel.root
        router?.select()
    }
}
