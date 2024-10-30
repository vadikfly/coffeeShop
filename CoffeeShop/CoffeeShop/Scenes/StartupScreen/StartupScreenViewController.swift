//
//  StartupScreenViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class StartupScreenViewController: UIViewController {
    var interactor: StartupScreenBusinessLogic?
    var router: StartupScreenRoutingLogic?

    private lazy var rootView = StartupScreenView()

    override func loadView() {
        super.loadView()
        view = rootView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.request(StartupScreen.Fetch.Request())
    }
}

extension StartupScreenViewController: StartupScreenDisplayLogic {
    func display(_ viewModel: StartupScreen.Fetch.ViewModel) {
        switch viewModel.route {
        case .onboarding:
            router?.showWelcome()
        case .login:
            router?.showLogin()
        case .menu:
            router?.showTabs()
        }
    }
}
