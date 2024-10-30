//
//  OrderPaymentModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum OrderPayment {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum Select {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum Next {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum paymentMethods {
        case online
        case card
    }

    enum paymentSystem {
        case assist
        case visa
        case mastercard
    }
    
    struct Model {
        struct Payment {
            let name: String
            let methods: paymentMethods
            let system: [paymentSystem]
            var isEnabled: Bool
        }
        var items: [OrderPayment.Model.Payment]
        var totalPrice: Int
    }
    
    struct RootViewModel {
        struct Payment {
            let name: String
            let methods: String
            let system: [String]
            let isEnabled: Bool
        }
        var items: [OrderPayment.RootViewModel.Payment]
        var totalPrice: String
    }
    
    typealias Completion = (Model) -> Void
}
