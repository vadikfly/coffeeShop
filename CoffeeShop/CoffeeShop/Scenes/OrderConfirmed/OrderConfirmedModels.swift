//
//  OrderConfirmedModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum OrderConfirmed {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: RootViewModel
        }
    }

    enum Close {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model {
        var name: String
        var orderTime: String
        var orderAdress: String
    }

    struct RootViewModel {
        var name: String
        var orderTime: String
        var orderAdress: String
    }
    
    typealias Completion = (Model) -> Void
}
