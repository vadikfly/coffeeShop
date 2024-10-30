//
//  DesignerModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Designer {
    
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: Designer.RootViewModel
        }
    }
    
    enum Close {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Buy {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum ChooseBarista {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum CoffeTypeValue {
        struct Request {
            var value: Float
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var root: Designer.RootViewModel
        }
    }
    
    enum СoffeeVariety {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Roasting {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var root: Designer.RootViewModel
        }
    }
    
    enum Grinding {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var root: Designer.RootViewModel
        }
    }
    
    enum ChooseMilk { //показать алерт
        struct Request {}
        
        struct Response {
            var milks: [Milk]
        }
        
        struct ViewModel {
            var milks: [String]
        }
    }
    
    enum ApplyMilk { //применить выбранное молоко
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var current: Designer.RootViewModel
        }
    }
    
    enum ChooseSyrup {
        struct Request {}
        
        struct Response {
            var syrups: [Syrup]
        }
        
        struct ViewModel {
            var syrupsView: [String]
        }
    }
    
    enum ApplySyrup {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var current: Designer.RootViewModel
        }
    }
    
    enum Additives {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Ice {
        struct Request {
            var index: Int
        }
        
        struct Response {
            var model: OrderItem
        }
        
        struct ViewModel {
            var root: Designer.RootViewModel
        }
    }
    
    enum Next {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    struct Model {
        var orderItem: OrderItem
    }

    struct RootViewModel {
        var price: String
        var coffeeTypeValue: Float?
        var roastingIndex: Int?
        var grindingIndex: Int?
        var iceIndex: Int?
        var chooseMilkText: String?
        var chooseSyrupText: String?
        var baristaName: String?
        var countryName: String?
        var additives: String?
    }

    typealias Completion = (Model) -> Void
    typealias CurrentCompletion = (OrderItem) -> Void
    
}
