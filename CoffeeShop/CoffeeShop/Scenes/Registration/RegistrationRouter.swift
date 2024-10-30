//
//  RegistrationRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RegistrationRouter {
    weak var viewController: RegistrationViewController?
    var dataStore: RegistrationDataStore?

    init(viewController: RegistrationViewController, dataStore: RegistrationDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension RegistrationRouter: RegistrationRoutingLogic {
    func login() {
        viewController?.navigationController?.pushViewController(AuthBuilder.build(), animated: true)
    }
    
    func next() {
        print("перейди на меню")
        viewController?.navigationController?.pushViewController(ForgotPasswordBuilder.build(), animated: true)
    }
    
    func back() {
        print("перейди назад")
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func show() {

    }
}
