//
//  BaristaViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class BaristaViewController: UIViewController {
    var interactor: BaristaBusinessLogic?
    var router: BaristaRoutingLogic?

    private let rootView = BaristaView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(Barista.Close.Request())
            case .buy:
                self.interactor?.request(Barista.Buy.Request())
            case .selectBarista(let index):
                self.interactor?.request(Barista.SelectBarista.Request(index:index))
            }
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Barista.Fetch.Request())
    }

}

extension BaristaViewController: BaristaDisplayLogic {

    func display(_ viewModel: Barista.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Barista.Close.ViewModel) {
        router?.close()
    }
    
    func display(_ viewModel: Barista.Buy.ViewModel) {
        router?.buy()
    }
    
    func display(_ viewModel: Barista.SelectBarista.ViewModel) {
        router?.select()
    }
}
