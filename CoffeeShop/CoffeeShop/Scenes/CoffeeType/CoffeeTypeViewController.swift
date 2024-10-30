//
//  CoffeeTypeViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class CoffeeTypeViewController: UIViewController {
    var interactor: CoffeeTypeBusinessLogic?
    var router: CoffeeTypeRoutingLogic?

    private let rootView = CoffeeTypeView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(CoffeeType.Close.Request())
            case .buy:
                self.interactor?.request(CoffeeType.Buy.Request())
            case .selectVariety(let index):
                self.interactor?.request(CoffeeType.SelectVariety.Request(index: index))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(CoffeeType.Fetch.Request())
    }
}

extension CoffeeTypeViewController: CoffeeTypeDisplayLogic {

    func display(_ viewModel: CoffeeType.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: CoffeeType.Close.ViewModel) {
        router?.close()
    }

    func display(_ viewModel: CoffeeType.Buy.ViewModel) {
        router?.buy()
    }

    func display(_ viewModel: CoffeeType.SelectVariety.ViewModel) {
        router?.select()
    }

}
