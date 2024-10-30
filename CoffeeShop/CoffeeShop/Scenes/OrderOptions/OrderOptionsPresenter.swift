//
//  OrderOptionsPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//
import Foundation

final class OrderOptionsPresenter {
    weak var view: OrderOptionsDisplayLogic?

    init(view: OrderOptionsDisplayLogic) {
        self.view = view
    }
}

extension OrderOptionsPresenter: OrderOptionsPresentationLogic {
    func present(_ response: OrderOptions.Fetch.Response) {
        view?.display(
            OrderOptions.Fetch.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.Close.Response) {
        view?.display(OrderOptions.Close.ViewModel())
    }
    
    func present(_ response: OrderOptions.Cart.Response) {
        view?.display(OrderOptions.Cart.ViewModel())
    }
    
    func present(_ response: OrderOptions.PlusCount.Response) {
        view?.display(
            OrderOptions.PlusCount.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.MinusCount.Response) {
        view?.display(
            OrderOptions.MinusCount.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.OneRistretto.Response) {
        view?.display(
            OrderOptions.OneRistretto.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.TwoRistretto.Response) {
        view?.display(
            OrderOptions.TwoRistretto.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.Place.Response) {
        view?.display(
            OrderOptions.Place.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.Volume.Response) {
        view?.display(
            OrderOptions.Volume.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.CookSwitch.Response) {
        view?.display(
            OrderOptions.CookSwitch.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.CookTime.Response) {
        view?.display(
            OrderOptions.CookTime.ViewModel(
                viewModel: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: OrderOptions.Constructor.Response) {
        view?.display(OrderOptions.Constructor.ViewModel())
    }
    
    func present(_ response: OrderOptions.Next.Response) {
        view?.display(OrderOptions.Next.ViewModel())
    }
}

private extension OrderOptions.Model {
    func rootViewModel() -> OrderOptions.RootViewModel {
        .init(
            config: .init(
                coffeeName: orderItem.name.string(),
                coffeeImage: orderItem.name.image(),
                cookMinuteInterval: initialConfig.cookMinuteInterval
            ),
            current: .init(
                countText: "\(orderItem.count)",
                doubleRistretto: orderItem.doubleRistretto,
                takeAway: orderItem.takeAway,
                volumeSelectedIndex: orderItem.volume,
                cookTimeEnabled: orderItem.estimatedDate != nil,
                cookTime: orderItem.estimatedDate,
                price: String(format: "BYN %.2f", Double(orderItem.price)/100.0)
            )
        )
    }
}

private extension OrderItem {
    func currentViewModel() -> OrderOptions.CurrentValuesViewModel {
        .init(
            countText: "\(count)",
            doubleRistretto: doubleRistretto,
            takeAway: takeAway,
            volumeSelectedIndex: volume,
            cookTimeEnabled: estimatedDate != nil,
            cookTime: estimatedDate,
            price: String(format: "BYN %.2f", Double(price)/100.0)
        )
    }
}

extension Coffee {
    func string() -> String {
        switch self {
        case .americano:
            return "Американо"
        case .latte:
            return "Латте"
        case .raf:
            return "Раф"
        case .capucino:
            return "Капучино"
        case .flatwhite:
            return "Флэтуайт"
        case .espresso:
            return "Еспрессо"
        }
    }
    
    func image() -> String {
        switch self {
        case .americano:
            return "ConstructorAmericano"
        case .latte:
            return "ConstructorLatte"
        case .raf:
            return "ConstructorRaf"
        case .capucino:
            return "ConstructorCapucino"
        case .flatwhite:
            return "ConstructorFlatWhite"
        case .espresso:
            return "ConstructorEspresso"
        }
    }
}
