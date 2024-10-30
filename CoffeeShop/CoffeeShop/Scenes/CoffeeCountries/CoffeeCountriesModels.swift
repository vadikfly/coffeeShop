//
//  CoffeeCountriesModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum CoffeeCountries {

    enum Fetch {
        struct Request {}

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: CoffeeCountries.RootViewModel
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

    enum SelectCountry {
        struct Request {
            var index: Int
        }

        struct Response {
            var model: Model
        }

        struct ViewModel {
            var root: CoffeeCountries.RootViewModel
        }
    }

    struct Model {
        var items: Countries
        var selectedCountry: Int?
    }

    struct RootViewModel {
        struct Country {
            let id: String
            let name: String
        }
        var countryNameItems: [Country]
        var selectedCountry: Int?
    }

    typealias Completion = (Model) -> Void
    typealias EmptyCompletion = () -> Void
}



