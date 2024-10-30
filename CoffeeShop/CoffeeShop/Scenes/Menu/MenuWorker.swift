//
//  MenuWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class MenuWorker: MenuWorkingLogic {
    
    private let items: [Coffee] = Coffee.allCases
        
    func fetch(_ completion: Menu.FetchCompletion?) {
        guard let completion = completion else { return }
        let model = Menu.Model(
            name: "Алексей",
            items: items
        )
        completion(model)
    }
}
