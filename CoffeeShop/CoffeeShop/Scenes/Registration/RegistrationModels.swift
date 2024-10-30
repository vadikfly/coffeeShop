//
//  RegistrationModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Registration {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model?
            var error: Error?
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Registration.ViewModel
            var error: String?
        }
    }
    
    enum Back {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }
    
    enum EnterUserName {
        struct Request {
            var userName: String
        }

        struct Response {
            var fields: AllFields
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Registration.ViewModel
        }
    }
    
    enum EnterPhoneNumber {
        struct Request {
            var phoneText: String
        }

        struct Response {
            var fields: AllFields
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Registration.ViewModel
        }
    }
    
    enum EnterEMail {
        struct Request {
            var emailText: String
        }

        struct Response {
            var fields: AllFields
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Registration.ViewModel
        }
    }
    
    enum EnterPassword {
        struct Request {
            var passwordText: String
        }

        struct Response {
            var fields: AllFields
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Registration.ViewModel
        }
    }
    
    enum ShowHidePassword {
        struct Request {}

        struct Response {
            var fields: AllFields
            var showPassword: Bool
            var canContinue: Bool
        }

        struct ViewModel {
            var model: Registration.ViewModel
        }
    }
    
    enum Next {
        struct Request {}

        struct Response {
        }

        struct ViewModel {
        }
    }
    
    enum Login {
        struct Request {}

        struct Response {
        }

        struct ViewModel {
        }
    }
    
    struct Model {
        var username: String?
        var phone: String?
        var email: String?
        var password: String?
        var showPassword: Bool
    }

    struct AllFields {
        var userName: String
        var phone: String
        var email: String
        var password: String
    }
    
    struct ViewModel {
        var name: String?
        var phone: String?
        var email: String?
        var password: String?
        var showPassword: Bool

        var isNextEnable: Bool
    }
    
    typealias FetchCompletion = (Result<Model, Error>) -> Void
}
