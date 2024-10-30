//
//  RedeemViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RedeemViewController: UIViewController {
    var interactor: RedeemBusinessLogic?
    var router: RedeemRoutingLogic?

    private lazy var rootView = RedeemView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(Redeem.Close.Request())
            case .buy(let index):
                self.interactor?.request(Redeem.Buy.Request(index: index))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Redeem.Fetch.Request())
    }

    func alert() {
        let alertController = UIAlertController(title: "", message: "Недостаточно баллов", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}

extension RedeemViewController: RedeemDisplayLogic {

    func display(_ viewModel: Redeem.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }

    func display(_ viewModel: Redeem.Close.ViewModel) {
        router?.close()
    }

    func display(_ viewModel: Redeem.Buy.ViewModel) {
        if !viewModel.canGo {
            router?.buy()
        }
        else {
            alert()
        }
    }
}
