//
//  ProfileModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Profile {
    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum Close {
        struct Request {}

        struct Response {}
        
        struct ViewModel {}
    }
    
    enum EditingName {
        struct Request {}

        struct Response {}
        
        struct ViewModel {
            var isEditing: FieldsEditing
        }
    }
    
    enum EditingPhone {
        struct Request {}

        struct Response {}
        
        struct ViewModel {
            var isEditing: FieldsEditing
        }
    }
    
    enum EditingEmail {
        struct Request {}

        struct Response {}
        
        struct ViewModel {
            var isEditing: FieldsEditing
        }
    }
    
    enum EditingAddress {
        struct Request {}

        struct Response {
            var address: [ProfileUser.CoffeShopAddress]
        }
        
        struct ViewModel {
            var address: [String]
        }
    }
    
    enum EditingEnd {
        struct Request {}

        struct Response {}
        
        struct ViewModel {
            var isEditing: FieldsEditing
        }
    }
    
    enum TextName {
        struct Request {
            var text: String
        }

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum TextPhone {
        struct Request {
            var text: String
        }

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum TextEmail {
        struct Request {
            var text: String
        }

        struct Response {
            var model: Model
        }
        
        struct ViewModel {
            var root: RootViewModel
        }
    }
    
    enum ApplyAddress {
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
    
    struct FieldsEditing {
        var name: Bool
        var phone: Bool
        var email: Bool
    }
    
    struct Model {
        var profile: ProfileUser
        var shopAddress: [ProfileUser.CoffeShopAddress]
    }
    
    struct RootViewModel {
        struct ProfileUserViewModel {
            var name: String
            var phoneNumber: String
            var email: String
            var adress: String
        }
        var profile: ProfileUserViewModel
        var shopAddress: [String]
    }
    
    typealias Completion = (Model) -> Void
}
