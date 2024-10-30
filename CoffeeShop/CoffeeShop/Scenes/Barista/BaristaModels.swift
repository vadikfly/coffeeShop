//
//  BaristaModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Barista {
    
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: Barista.RootViewModel
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
    
    enum SelectBarista {
        struct Request {
            var index: Int
        }
        
        struct Response {
        }
        
        struct ViewModel {}
    }
    
    
    
    struct Model {
        var items: [Employee]
    }
    
    struct RootViewModel {
        struct Item {
            var baristaPhoto: String?
            var baristaName: String?
            var baristaSkill: String?
            var status: Bool?
        }
        var items: [Item]
    }
    
    typealias Completion = (Model) -> Void
    typealias EmptyCompletion = () -> Void
}
