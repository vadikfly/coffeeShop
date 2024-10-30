//
//  OrderPaymentView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderPaymentView: View {
    
    var viewModel: OrderPayment.RootViewModel = .init(items: [], totalPrice: "") {
        didSet {
            tableView.items = viewModel.items.map { item in
                return .init(
                    title: item.methods,
                    subTitle: item.name,
                    image: item.system,
                    selected: item.isEnabled
                )
            }
            footerView.price = viewModel.totalPrice
        }
    }
    
    enum Action {
        case next
        case select(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private lazy var transparencyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.114, green: 0.137, blue: 0.208, alpha: 0.51)
        return view
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 20, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Оплата заказа", textColor: .darkBlue)
        view.heightAnchor ~= 24
        return view
    }()
    
    private lazy var backgroundImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        view.layer.cornerRadius = 12
        return view
    }()
    
    private var imageCart: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Cart")
        image.tintColor = .black
        image.setContentHuggingPriority(.required, for: .horizontal)
        image.setContentCompressionResistancePriority(.required, for: .horizontal)
        return image
    }()
    
    private var nameLabel: Label = {
        let view = Label(size: 12, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Алексей", textColor: .darkBlue)
        return view
    }()
    
    private var adressLabel: Label = {
        let view = Label(size: 10, weight: .light)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "кофейня Magic Coffee\nг. Минск, ул. Тимирязева, 67", textColor: .darkBlue)
        return view
    }()
    
    private lazy var tableView: SimpleTableView<OrderPaymentCell> = {
        let view = SimpleTableView<OrderPaymentCell>()
        view.actionHandler = { action in
            switch action {
            case .select(let index):
                self.actionHandler(.select(index))
            }
        }
        return view
    }()
    
    private lazy var footerView: MyOrderFooterView = {
        let view = MyOrderFooterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = "Card"
        view.title = "Оплатить сейчас"
        view.actionHandler = { action in
            switch action {
            case .next:
                self.actionHandler(.next)
            }
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(transparencyView)
        addSubview(backgroundView)
        
        addSubview(titleLabel)
        addSubview(backgroundImageView)
        backgroundImageView.addSubview(imageCart)
        addSubview(nameLabel)
        addSubview(adressLabel)
        addSubview(tableView)
        addSubview(footerView)
    }

    override func setupLayout() {
        super.setupLayout()
        
        transparencyView.topAnchor ~= topAnchor
        transparencyView.leftAnchor ~= leftAnchor
        transparencyView.rightAnchor ~= rightAnchor
        transparencyView.bottomAnchor ~= backgroundView.topAnchor + 20
        transparencyView.heightAnchor ~= 150
        
        backgroundView.leftAnchor ~= leftAnchor
        backgroundView.rightAnchor ~= rightAnchor
        backgroundView.bottomAnchor ~= bottomAnchor
        
        titleLabel.leftAnchor ~= backgroundView.leftAnchor + 33
        titleLabel.topAnchor ~= backgroundView.topAnchor + 35

        backgroundImageView.topAnchor ~= titleLabel.bottomAnchor + 79
        backgroundImageView.leftAnchor ~= backgroundView.leftAnchor + 33
        
        imageCart.pinToSuperview(left: 11.5, top: 11.5, right: 11.5, bottom: 11.5)
        
        nameLabel.topAnchor ~= backgroundImageView.topAnchor
        nameLabel.leftAnchor ~= backgroundImageView.rightAnchor + 24
        nameLabel.rightAnchor ~= backgroundView.rightAnchor - 33
        
        adressLabel.leftAnchor ~= nameLabel.leftAnchor
        adressLabel.rightAnchor ~= backgroundView.rightAnchor - 33
        adressLabel.bottomAnchor ~= backgroundImageView.bottomAnchor
        
        tableView.topAnchor ~= backgroundImageView.bottomAnchor + 36
        tableView.leftAnchor ~= backgroundView.leftAnchor
        tableView.rightAnchor ~= backgroundView.rightAnchor
        tableView.bottomAnchor ~= footerView.topAnchor - 10
        
        footerView.leftAnchor ~= leftAnchor
        footerView.rightAnchor ~= rightAnchor
        footerView.bottomAnchor <= bottomAnchor - 10
        let bottom = footerView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
