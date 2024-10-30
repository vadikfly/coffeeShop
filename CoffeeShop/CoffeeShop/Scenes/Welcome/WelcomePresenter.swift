//
//  WelcomePresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class WelcomePresenter {
    weak var view: WelcomeDisplayLogic?

    init(view: WelcomeDisplayLogic) {
        self.view = view
    }
}

extension WelcomePresenter: WelcomePresentationLogic {
    func present(_ response: Welcome.Fetch.Response) {
        view?.display(Welcome.Fetch.ViewModel())
    }

    func present(_ response: Welcome.Continue.Response) {
        view?.display(Welcome.Continue.ViewModel())
    }
}
