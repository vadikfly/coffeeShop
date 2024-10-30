//
//  MyOrderModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum MyOrder {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: MyOrder.RootViewModel
        }
    }
    
    enum Close {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    enum Next {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    enum Delete {
        struct Request {
            var index: Int
        }

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: MyOrder.RootViewModel
        }
    }
    
    struct Model {
        var items: [OrderItem]
        var totalPrice: Int
    }
    
    struct RootViewModel {
        struct Item {
            var name: String
            var image: String
            var options: String
            var count: String
            var price: String
        }
        var items: [Item]
        var totalPrice: String
    }
    
    typealias FetchCompletion = (Model) -> Void
    typealias DeleteCompletion = (Model) -> Void
}
