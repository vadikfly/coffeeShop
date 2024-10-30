//
//  MyOrderViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class MyOrderViewController: UIViewController {
    var interactor: MyOrderBusinessLogic?
    var router: MyOrderRoutingLogic?

    private lazy var rootView = MyOrderView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(MyOrder.Close.Request())
            case .next:
                self.interactor?.request(MyOrder.Next.Request())
            case .delete(let index):
                self.interactor?.request(MyOrder.Delete.Request(index: index))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(MyOrder.Fetch.Request())
    }
}

extension MyOrderViewController: MyOrderDisplayLogic {
    func display(_ viewModel: MyOrder.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: MyOrder.Close.ViewModel) {
        router?.close()
    }
    
    func display(_ viewModel: MyOrder.Next.ViewModel) {
        router?.next()
    }
    
    func display(_ viewModel: MyOrder.Delete.ViewModel) {
        rootView.viewModel = viewModel.root
    }
}
