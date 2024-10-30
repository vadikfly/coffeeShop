//
//  TabbarInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class TabbarInteractor {
    private let presenter: TabbarPresentationLogic
    private let worker: TabbarWorkingLogic

    init(presenter: TabbarPresentationLogic, worker: TabbarWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension TabbarInteractor: TabbarBusinessLogic {
    func request(_ request: Tabbar.Something.Request) {

    }
}

extension TabbarInteractor: TabbarDataStore {}
