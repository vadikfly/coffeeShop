//
//  RedeemPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RedeemPresenter {
    weak var view: RedeemDisplayLogic?

    init(view: RedeemDisplayLogic) {
        self.view = view
    }
}

extension RedeemPresenter: RedeemPresentationLogic {
    func present(_ response: Redeem.Fetch.Response) {
        view?.display(
            Redeem.Fetch.ViewModel(
                root: response.model.viewModel()
            )
        )
    }

    func present(_ response: Redeem.Close.Response) {
        view?.display(Redeem.Close.ViewModel())
    }

    func present(_ response: Redeem.Buy.Response) {
        view?.display(Redeem.Buy.ViewModel(canGo: response.canGo))
    }
}

private extension Redeem.Model {
    func viewModel() -> Redeem.RootViewModel {
        .init(
            itemsViewModel: items.map { item in
                    .init(
                        image: item.name.image(),
                        name: item.name.string(),
                        valid: "Действительно до \(formattedDate(from: item.valid))",
                        points: "\(item.points) баллов"
                    )
            }
        )
    }
    private func formattedDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.string(from: date)
    }
}


