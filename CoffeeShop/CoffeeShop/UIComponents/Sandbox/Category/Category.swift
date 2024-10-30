//
//  Category.swift
//  UIComponents
//
//  Created by Vadim Mukhin on 04.09.2021.
//

import Foundation
import UIKit

enum Category: String, CaseIterable {
    case labels
    case buttons
    case inputs
    case views
    case cells
}

extension Category {
    var provider: ItemsProvider {
        switch self {
        case .labels:
            return LabelItems()
        case .buttons:
            return ButtonItems()
        case .views:
            return ViewItems()
        case .cells:
            return EmptyProvider()
        case .inputs:
            return InputItems()
        }
    }
}

protocol ItemsProvider {
    var count: Int { get }
    func item(at index: Int) -> UIView
}

class EmptyProvider: ItemsProvider {
    var count: Int = 0

    func item(at index: Int) -> UIView {
        fatalError()
    }
}
