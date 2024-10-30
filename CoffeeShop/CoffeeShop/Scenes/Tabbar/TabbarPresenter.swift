//
//  TabbarPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class TabbarPresenter {
    weak var view: TabbarDisplayLogic?

    init(view: TabbarDisplayLogic) {
        self.view = view
    }
}

extension TabbarPresenter: TabbarPresentationLogic {
    func present(_ response: Tabbar.Something.Response) {
        view?.display(Tabbar.Something.ViewModel())
    }
}
