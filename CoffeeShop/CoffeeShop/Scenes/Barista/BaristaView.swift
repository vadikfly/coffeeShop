//
//  BaristaView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

class BaristaView: View {
    
    var viewModel: Barista.RootViewModel = .init(items: []) {
        didSet {
            tableView.items = viewModel.items.map { item in
                return .init(
                    baristaPhoto: item.baristaPhoto,
                    baristaName: item.baristaName,
                    baristaSkill: item.baristaSkill,
                    status: item.status
                )
            }
        }
    }
    
    enum Action {
        case close
        case buy
        case selectBarista(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Конструктор заказа")
        view.actionHandler = { action in
            switch action {
            case .back:
                self.actionHandler(.close)
            case .buy:
                self.actionHandler(.buy)
            }
        }
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Выберите бариста", textAlignment: .left, textColor: .darkBlue)
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()
    
    private lazy var tableView: SimpleTableView<BaristaCellView> = {
        let view = SimpleTableView<BaristaCellView>()
        view.actionHandler = { action in
            switch action {
            case .select(let index):
                print("selected \(index)")
                self.actionHandler(.selectBarista(index)) 
            }
        }
        view.items = [
            .init(
               baristaPhoto: "baristaPhoto1",
               baristaName: "Анатолий",
               baristaSkill: "Бариста",
               status: true
            ),
            .init(
                baristaPhoto: "baristaPhoto",
                baristaName: "Василий",
                baristaSkill: "Топ-бариста",
                status: false
            ),
            .init(
                baristaPhoto: "baristaPhoto2",
                baristaName: "Олеся",
                baristaSkill: "Топ-бариста",
                status: true
            )
        ]
        return view
    }()
        
        
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor
        
        titleLabel.topAnchor ~= headerView.bottomAnchor + 28
        titleLabel.leftAnchor ~= leftAnchor + 29
        
        tableView.topAnchor ~= titleLabel.bottomAnchor + 9
        tableView.leftAnchor ~= leftAnchor
        tableView.rightAnchor ~= rightAnchor 
        tableView.bottomAnchor ~= bottomAnchor
    }
}
