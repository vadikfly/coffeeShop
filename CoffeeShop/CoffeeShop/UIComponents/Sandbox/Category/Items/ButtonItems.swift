//
//  ButtonItems.swift
//  UIComponents
//
//  Created by Vadim Mukhin on 04.09.2021.
//

import UIKit

class ButtonItems: ItemsProvider {
    var count: Int = 3

    func item(at index: Int) -> UIView {
        let view = UIView()
        let button: UIView
        switch index {
        case 0:
            button = createIconButton()
        case 1:
            button = createTextButton()
        default:
            button = createSimpleButton()
        }
        view.addSubview(button)
        button.pinToSuperviewCenter()
        button.topAnchor ~= view.topAnchor + 20
        return view
    }

    func createSimpleButton() -> UIView {
        let button = UIButton()
        button.setTitle("Title", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.addAction(
            .init(handler: { _ in
                print("button touched")
            }),
            for: .touchUpInside
        )
        return button
    }

    func createIconButton() -> UIView {
        let button = IconButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.viewModel = .init(
            systemName: "arrow.left",
            pointSize: 24,
            sizeButton: 60,
            colorButton: .darkGray,
            colorIcon: .white
        )
        button.actionHandler = {
            print("icon button")
        }
        return button
    }

    func createTextButton() -> UIView {
        let button = TextButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.viewModel = .init(text: "Hello")
        button.actionHandler = {
            print("text button")
        }
        return button
    }
}
