//
//  CoffeeCountryCell.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.10.2021.
//

import UIKit

class CoffeeCountryCell: View, SimpleContentCell {

    struct Model {
        var text: String?
        var type: Int?
        var textColor: Label.Color?
        var isSelected: Bool?
    }

    var viewModel: Model? {
        didSet {

            if viewModel?.type == 0 {
                cell.viewModel = .init(
                    iconName: "chevron.right",
                    iconColor: .systemGray3,
                    iconSize: 17,
                    iconWeight: .light,
                    text: viewModel?.text,
                    textColor: viewModel?.textColor ?? .black)

            } else if viewModel?.type == 1 {
                if viewModel?.isSelected == true {
                    cell.viewModel = .init(
                        iconName: "checkmark",
                        iconColor: .systemBlue,
                        iconSize: 17,
                        iconWeight: .light,
                        text: viewModel?.text,
                        textColor: viewModel?.textColor ?? .blue)
                } else {
                    cell.viewModel = .init(
                        text: viewModel?.text,
                        textColor: viewModel?.textColor ?? .black)
                }
            } else {
                cell.viewModel = .init(
                    text: viewModel?.text,
                    textColor: viewModel?.textColor ?? .black)
            }
        }
    }

    enum Action {
    }

    var actionHandler: (Action) -> Void = { _ in }

    private var cell: LongButtonView = {
        let view = LongButtonView(constantTop: 12, constantSeparator: 11, separatorColor: UIColor(red: 0.776, green: 0.776, blue: 0.784, alpha: 0.6), constantIconRight: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textSize = 17
        view.isUserInteractionEnabled = false
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(cell)
    }

    override func setupLayout() {
        super.setupLayout()
        cell.pinToSuperview()
        cell.heightAnchor ~= 44
    }
}
