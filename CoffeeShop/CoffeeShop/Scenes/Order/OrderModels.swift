//
//  OrderModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Order {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model?
            var error: Error?
        }

        struct ViewModel {
            var model: Order.ViewModel
            var error: String?
        }
    }

    enum CurrentOrder {
        struct Request {}

        struct Response {
            var model: Model?
            var error: Error?
        }

        struct ViewModel {
            var model: Order.ViewModel
            var error: String?
        }
    }

    enum History {
        struct Request {}

        struct Response {
            var model: Model?
            var error: Error?
        }

        struct ViewModel {
            var model: Order.ViewModel
            var error: String?
        }
    }

    enum Buy {
        struct Request {
            let index: Int
        }

        struct Response {
            var model: Model?
            var error: Error?
        }

        struct ViewModel {
            var model: Order.ViewModel
            var error: String?
        }
    }

    struct Model {
        let currentOrder: [OrderItem]
        let history: [OrderItem]
    }

    struct ViewModel {
        struct Item {
            let name: String?
            let date: String?
            let location: String?
            let price: String?
        }

        let currentOrder: [Item]
        let history: [Item]
    }

    typealias FetchCompletion = (Result<Model, Error>) -> Void
    typealias BuyCompletion = (Result<Model, Error>) -> Void
}
