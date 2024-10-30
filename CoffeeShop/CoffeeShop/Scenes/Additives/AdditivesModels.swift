//
//  AdditivesModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Additives {

    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: Additives.RootViewModel
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

    enum SelectAdditives {
        struct Request {
            var index: Int
        }

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: Additives.RootViewModel
        }
    }
    
    enum ApplyAdditives {
        struct Request {}

        struct Response {}

        struct ViewModel {}
    }

    struct Model {
        var items: [AdditivesList]
        var selected: Set<Int>
    }

    struct RootViewModel {
        struct ItemViewModel {
            var name: String
            var isSelected: Bool
        }
        var additivesItems: [ItemViewModel]
    }

    typealias Completion = (Model) -> Void
    typealias SaveCompletion = () -> Void
}
