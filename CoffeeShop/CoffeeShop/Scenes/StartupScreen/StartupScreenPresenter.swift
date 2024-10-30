//
//  StartupScreenPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class StartupScreenPresenter {
    weak var view: StartupScreenDisplayLogic?

    init(view: StartupScreenDisplayLogic) {
        self.view = view
    }
}

extension StartupScreenPresenter: StartupScreenPresentationLogic {
    func present(_ response: StartupScreen.Fetch.Response) {
        view?.display(StartupScreen.Fetch.ViewModel(route: response.model?.route() ?? .onboarding))
    }
}

private extension StartupScreen.Model {
    func route() -> StartupScreen.Route {
        if hasUser {
            return .menu
        }
        else if didLogin {
            return .login
        }
        else {
            return .onboarding
        }
    }
}
