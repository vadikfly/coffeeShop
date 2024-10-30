//
//  ViewItems.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 04.09.2021.
//

import UIKit

class ViewItems: ItemsProvider {
    var count: Int = 2

    func item(at index: Int) -> UIView {
        let view = UIView()
        let button: UIView
        switch index {
        case 0:
            button = createVerticalSeparator()
        default:
            button = createHorizonSeparator()
        }
        view.addSubview(button)
        button.pinToSuperviewCenter()
        button.topAnchor ~= view.topAnchor + 20
        return view
    }

    func createVerticalSeparator() -> UIView {
        let view = SeparatorView(width: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor ~= 100
        return view
    }

    func createHorizonSeparator() -> UIView {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor ~= 200
        return view
    }
}
