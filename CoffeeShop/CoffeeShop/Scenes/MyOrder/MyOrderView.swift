//
//  MyOrderView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MyOrderView: View {
    
    var viewModel: MyOrder.RootViewModel = .init(
        items: [],
        totalPrice: ""
    ) {
        didSet {
            tableView.items = viewModel.items.map { item in
                return .init(
                    name: item.name,
                    image: item.image,
                    options: item.options,
                    count: item.count,
                    price: item.price
                )
            }
            footerView.price = viewModel.totalPrice
        }
    }
    
    enum Action {
        case close
        case next
        case delete(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.close)
                }
            ),
            for: .touchUpInside
        )
        view.configuration = UIButton.Configuration.plain()
        view.configurationUpdateHandler = { button in
            if button.isHighlighted {
                button.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 0.8)
                var config = button.configuration
                config?.image = UIImage(
                    named: "arrowLeft"
                )
                button.configuration = config
            }
            else {
                button.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
                var config = button.configuration
                config?.image = UIImage(
                    named: "arrowLeft"
                )
                button.configuration = config
            }
        }
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 20, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Мой заказ", textColor: .darkBlue)
        view.heightAnchor ~= 24
        return view
    }()
    
    private lazy var tableView: SimpleTableView<OrderItemCell> = {
        let view = SimpleTableView<OrderItemCell>()
        view.actionHandler = { action in
            switch action {
            case .select(let index):
                self.actionHandler(.delete(index))
            }
            
        }
        return view
    }()
    
    private lazy var footerView: MyOrderFooterView = {
        let view = MyOrderFooterView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        backgroundColor = .white
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(tableView)
        addSubview(footerView)
    }

    override func setupLayout() {
        super.setupLayout()
        
        backButton.topAnchor ~= safeAreaLayoutGuide.topAnchor + 5
        backButton.leftAnchor ~= safeAreaLayoutGuide.leftAnchor + 13
        
        titleLabel.topAnchor ~= backButton.bottomAnchor + 17
        titleLabel.leftAnchor ~= leftAnchor + 24
        
        tableView.topAnchor ~= titleLabel.bottomAnchor + 14
        tableView.leftAnchor ~= leftAnchor
        tableView.rightAnchor ~= rightAnchor
        tableView.bottomAnchor ~= footerView.topAnchor - 10
        
        footerView.leftAnchor ~= leftAnchor
        footerView.rightAnchor ~= rightAnchor
        footerView.bottomAnchor <= bottomAnchor - 10
        let bottom = footerView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
