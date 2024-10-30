//
//  OrderOptionsViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderOptionsViewController: UIViewController {
    var interactor: OrderOptionsBusinessLogic?
    var router: OrderOptionsRoutingLogic?

    private lazy var rootView = OrderOptionsView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(OrderOptions.Close.Request())
            case .cart:
                self.interactor?.request(OrderOptions.Cart.Request())
            case .plusCount:
                self.interactor?.request(OrderOptions.PlusCount.Request())
            case .minusCount:
                self.interactor?.request(OrderOptions.MinusCount.Request())
            case .oneRistretto:
                self.interactor?.request(OrderOptions.OneRistretto.Request())
            case .twoRistretto:
                self.interactor?.request(OrderOptions.TwoRistretto.Request())
            case .place(let index):
                self.interactor?.request(OrderOptions.Place.Request(index: index))
            case .volume(let index):
                self.interactor?.request(OrderOptions.Volume.Request(index: index))
            case .cookSwitch(let value):
                self.interactor?.request(OrderOptions.CookSwitch.Request(value: value))
            case .cookTime(let value):
                self.interactor?.request(OrderOptions.CookTime.Request(value: value))
            case .constructor:
                self.interactor?.request(OrderOptions.Constructor.Request())
            case .next:
                self.interactor?.request(OrderOptions.Next.Request())
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(OrderOptions.Fetch.Request())
    }
}

extension OrderOptionsViewController: OrderOptionsDisplayLogic {
    func display(_ viewModel: OrderOptions.Fetch.ViewModel) {
        rootView.initialViewModel = viewModel.root.config
        rootView.currentViewModel = viewModel.root.current
    }
    
    func display(_ viewModel: OrderOptions.Close.ViewModel) {
        router?.close()
    }
    
    func display(_ viewModel: OrderOptions.Cart.ViewModel) {
        router?.cart()
    }
    
    func display(_ viewModel: OrderOptions.PlusCount.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
        
    }
    
    func display(_ viewModel: OrderOptions.MinusCount.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
        
    }
    
    func display(_ viewModel: OrderOptions.OneRistretto.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
    }
    
    func display(_ viewModel: OrderOptions.TwoRistretto.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
    }
    
    func display(_ viewModel: OrderOptions.Place.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
    }
    
    func display(_ viewModel: OrderOptions.Volume.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
    }
    
    func display(_ viewModel: OrderOptions.CookSwitch.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
    }
    
    func display(_ viewModel: OrderOptions.CookTime.ViewModel) {
        rootView.currentViewModel = viewModel.viewModel
    }
    
    func display(_ viewModel: OrderOptions.Constructor.ViewModel) {
        router?.constructor()
    }
    
    func display(_ viewModel: OrderOptions.Next.ViewModel) {
        router?.next()
    }
}
