//
//  Employee.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 23.09.2021.
//

import Foundation

struct Employee {
    let name: String
    let imageUrl: String?
    let level: Level
    let isAvailable: Bool

    enum Level {
        case low
        case middle
        case high
    }
}

