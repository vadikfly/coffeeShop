//
//  InputItems.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 06.09.2021.
//

import UIKit

class InputItems: ItemsProvider {
    var count: Int = 1

    func item(at index: Int) -> UIView {
        let view = UIView()
        let button: UIView
        switch index {
        case 0:
            button = createAuthInput()
        default:
            button = createAuthInput()
        }
        view.addSubview(button)
        button.pinToSuperviewCenter()
        button.topAnchor ~= view.topAnchor + 20
        return view
    }

    func createAuthInput() -> UIView {
        let view = UserInfoInputContentView()
        view.viewModel = .init(iconImage: "Lock", placeholderText: "Enter text", eyeIconHidden: true)
        return view
    }
}
