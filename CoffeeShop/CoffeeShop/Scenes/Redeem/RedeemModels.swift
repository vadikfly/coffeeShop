//
//  RedeemModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Redeem {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: Redeem.RootViewModel
        }
    }

    enum Close {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    enum Buy {
        struct Request {
            var index: Int
        }

        struct Response {
            var canGo: Bool
        }

        struct ViewModel {
            var canGo: Bool
        }
    }

    struct Model {
        struct Item {
            var name: Coffee
            var valid: Date
            var points: Int
        }
        var items: [Item]
    }

    struct RootViewModel {
        struct ItemViewModel {
            var image: String
            var name: String
            var valid: String
            var points: String
        }
        var itemsViewModel: [ItemViewModel]
    }
    typealias FetchCompletion = (Model) -> Void
    typealias Completion = (Bool) -> Void
}
