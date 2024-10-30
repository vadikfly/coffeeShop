//
//  AuthModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Auth {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model?
            var error: Error?
            var canContinue: Bool
        }
        
        struct ViewModel {
            var model: Auth.ViewModel
            var error: String?
        }
    }
    
    enum Back {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    enum EnterAdress {
        struct Request {
            var adress: String
        }

        struct Response {
            var fields: AllField
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Auth.ViewModel
        }
    }
    
    enum EnterPassword {
        struct Request {
            var password: String
        }

        struct Response {
            var fields: AllField
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Auth.ViewModel
        }
    }
    
    enum ShowPassword {
        struct Request {}

        struct Response {
            var fields: AllField
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Auth.ViewModel
        }
    }
    
    enum ForgotPassword {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    enum Next {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    enum Registration {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    struct AllField {
        var adress: String
        var password: String
    }
    
    struct Model {
        var adress: String?
        var password: String?
        var showPassword: Bool
    }
    
    struct ViewModel {
        var adress: String?
        var password: String?
        var showPassword: Bool
        var isNextEnable: Bool
    }
    
    typealias FetchCompletion = (Result<Model, Error>) -> Void
}
