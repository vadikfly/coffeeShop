//
//  TabbarView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class TabbarView: View {
    var actionHandler: (Int) -> Void = { _ in }

    lazy var tabBarView: TabBarView = {
        let view = TabBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            actions: [
                UIImage(named: "MenuIcon")!,
                UIImage(named: "RewardIcon")!,
                UIImage(named: "OrderIcon")!
            ],
            selectedIndex: 0
        )
        view.actionHandler = { index in
            self.actionHandler(index)
            print(index)
        }
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(tabBarView)
        backgroundColor = .blue
    }

    override func setupLayout() {
        super.setupLayout()

        tabBarView.leftAnchor ~= leftAnchor + 25
        tabBarView.centerXAnchor ~= centerXAnchor
        tabBarView.bottomAnchor <= bottomAnchor - 10
        let bottom = tabBarView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
