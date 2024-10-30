//
//  OrderOptionsModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum OrderOptions {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: OrderOptions.RootViewModel
        }
    }
    
    enum Close {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Cart {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum PlusCount {
        struct Request {}
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum MinusCount {
        struct Request {}
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum OneRistretto {
        struct Request {}
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum TwoRistretto {
        struct Request {}
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum Place {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum Volume {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum CookSwitch {
        struct Request {
            var value: Bool
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum CookTime {
        struct Request {
            var value: Date
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var viewModel: OrderOptions.CurrentValuesViewModel
        }
    }
    
    enum Constructor {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Next {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    struct InitialConfigModel {
        let minCount: Int
        let maxCount: Int
        let cookMinuteInterval: Int
        let cookTimeAdd: Double
    }
    
    struct Model {
        var initialConfig: InitialConfigModel
        var orderItem: OrderItem
    }
    
    struct InitialConfigViewModel {
        var coffeeName: String
        var coffeeImage: String
        var cookMinuteInterval: Int
    }
    
    struct CurrentValuesViewModel {
        var countText: String
        var doubleRistretto: Bool
        var takeAway: Bool
        var volumeSelectedIndex: Int
        var cookTimeEnabled: Bool
        var cookTime: Date?
        var price: String
    }
    
    struct RootViewModel {
        var config: InitialConfigViewModel
        var current: CurrentValuesViewModel
    }
    
    typealias Completion = () -> Void
    typealias FetchCompletion = (Model) -> Void
    typealias CurrentCompletion = (OrderItem) -> Void

}
