//
//  TabbarViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class TabbarViewController: UIViewController {
    var interactor: TabbarBusinessLogic?
    var router: TabbarRoutingLogic?

    private let rootView = TabbarView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { index in
            self.children.enumerated().forEach { viewIndex, viewController in
                viewController.view.isHidden = index != viewIndex
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        add(MenuBuilder.build(), to: rootView)
        add(RewardBuilder.build(), to: rootView)
        add(OrderBuilder.build(), to: rootView)
        

        for child in self.children {
            child.additionalSafeAreaInsets = .init(top: 0, left: 0, bottom: 80, right: 0)
        }
    }
}

extension TabbarViewController: TabbarDisplayLogic {
    func display(_ viewModel: Tabbar.Something.ViewModel) {

    }
}

@nonobjc extension UIViewController {
    func add(_ child: UIViewController, to view: UIView) {
        addChild(child)

        child.view.frame = view.frame
        child.view.translatesAutoresizingMaskIntoConstraints = false

        view.insertSubview(child.view, at: 0)

        child.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        child.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
