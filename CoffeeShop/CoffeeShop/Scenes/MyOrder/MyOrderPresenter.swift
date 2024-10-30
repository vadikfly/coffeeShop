//
//  MyOrderPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class MyOrderPresenter {
    weak var view: MyOrderDisplayLogic?

    init(view: MyOrderDisplayLogic) {
        self.view = view
    }
}

extension MyOrderPresenter: MyOrderPresentationLogic {
    func present(_ response: MyOrder.Fetch.Response) {
        view?.display(
            MyOrder.Fetch.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: MyOrder.Close.Response) {
        view?.display(MyOrder.Close.ViewModel())
    }
    
    func present(_ response: MyOrder.Next.Response) {
        view?.display(MyOrder.Next.ViewModel())
    }
    
    func present(_ response: MyOrder.Delete.Response) {
        view?.display(
            MyOrder.Delete.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
}

private extension MyOrder.Model {
    func rootViewModel() -> MyOrder.RootViewModel {
        .init(
            items: items.map { item in
                    .init(
                        name: item.name.string(),
                        image: item.name.image(),
                        options: "\(item.ristrettoCoffee()) | \(item.volumeCoffee())",
                        count: "x \(item.count)",
                        price: String(format: "BYN\n%.2f", Double(item.price)/100.0)
                    )
                },
            totalPrice: String(format: "BYN %.2f", Double(totalPrice)/100.0)
        )
    }
}

extension OrderItem {
    func volumeCoffee() -> String {
        switch volume {
        case 0:
            return "Маленький"
        case 1:
            return "Средний"
        case 2:
            return "Большой"
        default:
            return ""
        }
    }
    
    func ristrettoCoffee() -> String {
        switch doubleRistretto {
        case true:
            return "Двойной"
        case false:
            return "Одинарный"
        }
    }
}
