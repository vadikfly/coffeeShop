//
//  LabelItems.swift
//  UIComponents
//
//  Created by Vadim Mukhin on 07.09.2021.
//

import UIKit

class LabelItems: ItemsProvider {
    var count: Int = 1

    func item(at index: Int) -> UIView {
        let view = UIView()
        let button: UIView
        switch index {
        case 0:
            button = createLabel()
        default:
            button = createLabel()
        }
        view.addSubview(button)
        button.pinToSuperviewCenter()
        button.topAnchor ~= view.topAnchor + 20
        return view
    }

    func createLabel() -> UIView {
        let view = Label(size: 20, weight: .medium)
        view.viewModel = .init(text: "Hello", textAlignment: .center, textColor: .black)
        return view
    }
}
