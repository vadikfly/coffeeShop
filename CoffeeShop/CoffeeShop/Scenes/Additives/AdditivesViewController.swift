//
//  AdditivesViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class AdditivesViewController: UIViewController {
    var interactor: AdditivesBusinessLogic?
    var router: AdditivesRoutingLogic?

    private lazy var rootView = AdditivesView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(Additives.Close.Request())
            case .buy:
                self.interactor?.request(Additives.Buy.Request())
            case .additives(let index):
                self.interactor?.request(Additives.SelectAdditives.Request(index: index))
            case .apply:
                self.interactor?.request(Additives.ApplyAdditives.Request())
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Additives.Fetch.Request())
    }
}

extension AdditivesViewController: AdditivesDisplayLogic {

    func display(_ viewModel: Additives.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: Additives.Close.ViewModel) {
        router?.close()
    }

    func display(_ viewModel: Additives.Buy.ViewModel) {
        router?.buy()
    }

    func display(_ viewModel: Additives.SelectAdditives.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Additives.ApplyAdditives.ViewModel) {
        router?.close()
    }
}
