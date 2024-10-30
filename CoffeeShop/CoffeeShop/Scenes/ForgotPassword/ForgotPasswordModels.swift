//
//  ForgotPasswordModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum ForgotPassword {
    
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model?
            var error: Error?
            var canContinue: Bool
        }
        
        struct ViewModel {
            var model: ForgotPassword.ViewModel
            var error: String?
        }
    }
    
    enum Next {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum Back {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
    }
    
    enum EnterEMail {
        struct Request {
            var emailText: String
        }
        
        struct Response {
            var emailText: String
            var canContinue: Bool
            //var emailCheck: Bool
        }
        
        struct ViewModel {
            var model: ForgotPassword.ViewModel
        }
    }
    
    
    struct Model {
        var email: String?
    }
    
    struct ViewModel {
        var emailVievModel: String?
        var isNextEnable: Bool
    }
    
    typealias FetchCompletion = (Result<Model, Error>) -> Void
    typealias EnterTextCompletion = () -> Void 
}
