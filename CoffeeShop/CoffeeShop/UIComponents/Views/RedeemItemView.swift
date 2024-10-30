//
//  RedeemItemView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//

import UIKit

class RedeemItemView: View, SimpleContentCell {

    enum Action {
        case buy
    }

    struct Model {
        var image: String
        var name: String
        var valid: String
        var points: String
        var actionHandler: (Action) -> Void = { _ in }
    }

    var viewModel: Model? = .init(
        image: "",
        name: "",
        valid: "",
        points: ""
    ) {
        didSet {
            coffeeImage.image = UIImage(named: viewModel?.image ?? "")
            titleLabel.viewModel = .init(text: viewModel?.name, textAlignment: .left, textColor: .darkBlue)
            subTitleLabel.viewModel = .init(text: viewModel?.valid, textAlignment: .left, textColor: .gray)
            buyButton.viewModel.text =  viewModel?.points ?? ""
        }
    }

    private let coffeeImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()

    private var titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()

    private var subTitleLabel: Label = {
        let view = Label(size: 10, weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()

    private lazy var buyButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textSize: 10, cornerRadius: 16, colorButton: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1), highlightedColor: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.95))
        view.actionHandler = {
            self.viewModel?.actionHandler(.buy)
        }
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(coffeeImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(buyButton)
    }

    override func setupLayout() {
        super.setupLayout()
        coffeeImage.heightAnchor ~= 60
        coffeeImage.widthAnchor ~= 82
        coffeeImage.topAnchor ~= topAnchor
        coffeeImage.leftAnchor ~= leftAnchor
        coffeeImage.bottomAnchor ~= bottomAnchor - 32

        titleLabel.topAnchor ~= coffeeImage.topAnchor + 3
        titleLabel.leftAnchor ~= coffeeImage.rightAnchor + 18
        titleLabel.rightAnchor ~= buyButton.leftAnchor

        subTitleLabel.topAnchor ~= titleLabel.bottomAnchor + 6
        subTitleLabel.leftAnchor ~= titleLabel.leftAnchor
        subTitleLabel.rightAnchor ~= buyButton.leftAnchor - 5

        buyButton.centerYAnchor ~= coffeeImage.centerYAnchor
        buyButton.rightAnchor ~= rightAnchor
        buyButton.heightAnchor ~= 32
        buyButton.widthAnchor ~= 76
    }
}
