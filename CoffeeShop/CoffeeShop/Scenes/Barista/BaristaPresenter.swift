//
//  BaristaPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 25.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class BaristaPresenter {
    weak var view: BaristaDisplayLogic?

    init(view: BaristaDisplayLogic) {
        self.view = view
    }
}

extension BaristaPresenter: BaristaPresentationLogic {

    func present(_ response: Barista.Fetch.Response) {
        view?.display(
            Barista.Fetch.ViewModel(
                root: response.model.viewModel()
            )
        )
    }
    
    func present(_ response: Barista.Close.Response) {
        view?.display(Barista.Close.ViewModel()
        )
    }
    func present(_ response: Barista.Buy.Response) {
        view?.display(Barista.Buy.ViewModel()
        )
    }
    
    func present(_ response: Barista.SelectBarista.Response) {
        view?.display(Barista.SelectBarista.ViewModel())
    }
}

private extension Barista.Model {
    func viewModel() -> Barista.RootViewModel {
        .init(
            items: items.map { employee in
                .init(
                    baristaPhoto: employee.imageUrl,
                    baristaName: employee.name,
                    baristaSkill: employee.level.skill(),
                    status: employee.isAvailable
                )
            }
        )
    }
}

private extension Employee.Level {
    func skill() -> String {
        switch self {
        case .low:
            return "Новичок"
        case .middle:
            return "Бариста"
        case .high:
            return "Топ-бариста"
        }
    }
}
