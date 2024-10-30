//
//  OrderConfirmedView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

class OrderConfirmedView: View {

    var viewModel: OrderConfirmed.RootViewModel = .init(
        name: "",
        orderTime: "",
        orderAdress: ""
    ) {
        didSet {
            nameLabel.viewModel = .init(
                text: "\(viewModel.name), Ваш заказ успешно размещен.",
                textAlignment: .center,textColor: .gray)

            orderTimeAdressLabel.viewModel = .init(
                text: "Заказ будет готов сегодня \n к \(viewModel.orderTime) по адресу \n\(viewModel.orderAdress)",
                textAlignment: .center, textColor: .darkBlue)
        }
    }

    enum Action {
        case close
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .back:
                self.actionHandler(.close)
            case .buy:
                break
            }
        }
        view.cartImageHidden = true
        return view
    }()

    private let orderImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "takeAway")
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()

    private let titleLabel: Label = {
        let view = Label(size: 22, weight: .regular)
        view.viewModel = .init(text: "Заказано", textAlignment: .center, textColor: .darkBlue)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let nameLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let orderTimeAdressLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let qrTitleLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.viewModel = .init(text: "Предъявите Ваш персональный QR-код \n в кофейне для получения заказа.", textAlignment: .center, textColor: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(orderImage)
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(nameLabel)
        addSubview(orderTimeAdressLabel)
        addSubview(qrTitleLabel)
    }

    override func setupLayout() {
        super.setupLayout()

        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor

        orderImage.topAnchor ~= topAnchor + 170
        orderImage.leftAnchor ~= leftAnchor + 99
        orderImage.rightAnchor ~= rightAnchor - 99

        titleLabel.topAnchor ~= orderImage.bottomAnchor + 34
        titleLabel.centerXAnchor ~= centerXAnchor
        titleLabel.leftAnchor ~= leftAnchor + 10

        nameLabel.topAnchor ~= titleLabel.bottomAnchor + 17
        nameLabel.leftAnchor ~= titleLabel.leftAnchor + 20
        nameLabel.rightAnchor ~= titleLabel.rightAnchor - 20

        orderTimeAdressLabel.topAnchor ~= nameLabel.bottomAnchor + 23
        orderTimeAdressLabel.leftAnchor ~= nameLabel.leftAnchor + 30
        orderTimeAdressLabel.rightAnchor ~= nameLabel.rightAnchor - 30

        qrTitleLabel.topAnchor ~= orderTimeAdressLabel.bottomAnchor + 22
        qrTitleLabel.leftAnchor ~= leftAnchor + 20
        qrTitleLabel.rightAnchor ~= rightAnchor - 20
    }
}
