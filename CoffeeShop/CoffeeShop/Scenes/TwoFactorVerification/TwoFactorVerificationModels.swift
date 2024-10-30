//
//  TwoFactorVerificationModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum TwoFactorVerification {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Model?
            var error: Error?
            var canContinue: Bool
        }
        
        struct ViewModel {
            var model: TwoFactorVerification.ViewModel
            var error: String?
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
    
    enum EnterPassword {
        struct Request {
            var password: String
        }

        struct Response {
            var password: String
            var canContinue: Bool
        }

        struct ViewModel {
            var model: TwoFactorVerification.ViewModel
        }
    }
    
    struct Model {
        var password: String?
    }
    
    struct ViewModel {
        var password: String?
        var isNextEnable: Bool
    }
    
    typealias FetchCompletion = (Result<Model, Error>) -> Void
}
