//
//  MenuModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Menu {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: Menu.RootViewModel
        }
    }
    
    enum Select {
        struct Request {
            var index: Int
        }
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Profile {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Cart {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    struct Model {
        let name: String
        let items: [Coffee]
    }
    
    struct RootViewModel {
        struct Coffee: Hashable {
            var name: String
            var image: String
        }
        var name: String
        var items: [Coffee]
    }
    
    typealias FetchCompletion = (Model) -> Void
}


