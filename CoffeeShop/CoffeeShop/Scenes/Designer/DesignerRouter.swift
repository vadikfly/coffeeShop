//
//  DesignerRouter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class DesignerRouter {
    weak var viewController: DesignerViewController?
    var dataStore: DesignerDataStore?

    init(viewController: DesignerViewController, dataStore: DesignerDataStore) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
}

extension DesignerRouter: DesignerRoutingLogic {

    func close() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func buy() {
    }
    
    func chooseBarista() {
        viewController?.navigationController?.pushViewController(BaristaBuilder.build(), animated: true)
    }
    
    func coffeeVariety() {
        viewController?.navigationController?.pushViewController(CoffeeCountriesBuilder.build(), animated: true)
    }
    
    func chooseMilk() {
    }
    
    func chooseSyrup() {
    }
    
    func additives() {
        viewController?.navigationController?.pushViewController(AdditivesBuilder.build(), animated: true)
    }
    
    func next() {
    }
}
