//
//  ProfileRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class ProfileRouter {
    weak var viewController: ProfileViewController?
    var dataStore: ProfileDataStore?

    init(viewController: ProfileViewController, dataStore: ProfileDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension ProfileRouter: ProfileRoutingLogic {
    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}
