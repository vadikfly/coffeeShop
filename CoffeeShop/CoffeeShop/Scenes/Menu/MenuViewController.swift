//
//  MenuViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MenuViewController: UIViewController {
    var interactor: MenuBusinessLogic?
    var router: MenuRoutingLogic?

    private let rootView = MenuView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .profile:
                self.interactor?.request(Menu.Profile.Request())
            case .buy:
                self.interactor?.request(Menu.Cart.Request())
            case .select(let index):
                self.interactor?.request(Menu.Select.Request(index: index))
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Menu.Fetch.Request())
    }
}

extension MenuViewController: MenuDisplayLogic {
    func display(_ viewModel: Menu.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Menu.Select.ViewModel) {
        router?.select()
    }
    
    func display(_ viewModel: Menu.Profile.ViewModel) {
        router?.profile()
    }
    
    func display(_ viewModel: Menu.Cart.ViewModel) {
        router?.cart()
    }
}
